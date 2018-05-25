using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Core.Objects;
using DevExpress.Web;
using TAAPs.Model;
using TAAPs.Messaging;
using log4net;

namespace TAAPs.Registration
{
    public partial class CTINRequestList : AccessPage   
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        static TAAPsDBContext context;
        Model.CTINRequest tinRequest;
        private const string DataObjectName = "CTINRequest";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    context = new TAAPsDBContext();
                    tinRequest = new Model.CTINRequest();

                    RegistrationDateEdit.MaxDate = DateTime.Today;

                    TinRequestGrid.Toolbars[0].Items[1].Visible = Global.SessionUser.RoleId == 1 ? false : true;

                    LoadListData();
                }
                catch (Exception ex)
                {
                    DisplayAlert("Danger", "Corporate Taxpayer", ex.Message);
                }
            }
        }

        protected void ApproveButton_Click(object sender, EventArgs e)
        {
            try
            {
                string approvedBy = (string)Global.SessionUser.UserName;
                long requestId = (long)TinRequestForm.GetNestedControlValueByFieldName("RequestId");

                string tin = Model.CTINRequest.ApproveTinRequest(requestId, approvedBy);

                string message = string.Format("TIN: {0} has been successfully generated.", tin);
                DisplayAlert("Success", "Non-Individual TIN Request", message);

                TinRequestGrid.DataBind();
                TinRequestMultiView.ActiveViewIndex = 0;
            }
            catch (Exception ex)
            {
                DisplayAlert("Danger", "Individual TIN Request", ex.Message);
            }

        }

        protected void RejectButton_Click(object sender, EventArgs e)
        {
            tinRequest = (CTINRequest)Session[DataObjectName];

            tinRequest.Status = "Rejected";
            context.SaveChanges();
            
            TinRequestGrid.DataBind();
            TinRequestMultiView.ActiveViewIndex = 0;
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            SubmitRecord();
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            TinRequestGrid.DataBind();
            TinRequestMultiView.ActiveViewIndex = 0;
        }

        protected void TinRequestEntityServerModeDataSource_Selecting(object sender, DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs e)
        {
            e.KeyExpression = "RequestId";
        }

        private void LoadListData()
        {
            LoadCountries();
            LoadBusinessLines();
            LoadTaxOffices();
        }

        private void LoadTaxOffices()
        {
            var taxOffices = context.TaxOffices.ToList();

            TaxOfficeCombo.DataSource = taxOffices;
            TaxOfficeCombo.TextField = "TaxOfficeName";
            TaxOfficeCombo.ValueField = "TaxOfficeId";
            TaxOfficeCombo.DataBind();
        }

        private void LoadCountries()
        {
            var countries = context.Countries.ToList();

            CountryCombo.DataSource = countries;
            CountryCombo.TextField = "CountryName";
            CountryCombo.ValueField = "CountryId";
            CountryCombo.DataBind();
        }

        private void LoadBusinessLines()
        {
            var busLines = context.BusinessLines.ToList();

            BusinessLineCombo.DataSource = busLines;
            BusinessLineCombo.TextField = "BusinessLineName";
            BusinessLineCombo.ValueField = "BusinessLineId";
            BusinessLineCombo.DataBind();
        }

        protected List<State> GetStates(int countryId)
        {
            var states = context.States.Where(c=>c.CountryId==countryId).OrderBy(s=>s.StateName).ToList();

            return states;
        }

        private List<LGA> GetLgas(string stateId)
        {
            if (string.IsNullOrEmpty(stateId)) return null;

            List<LGA> lgas = LGA.GetLGAs(stateId).OrderBy(l => l.LGAName).ToList();

            return lgas;
        }

        private void SetButtonVisibility()
        {
            if ( (Boolean)ViewState["IsNewRecord"] == true)
            {
                TinRequestForm.ForEach(ClearItem);
                TinRequestForm.ForEach(EnableItem);

                TinRequestForm.Enabled = true;
                SubmitButton.Visible = true;
                ApproveButton.Visible = false;
                RejectButton.Visible = false;
            }
            else
            {
                // check request status;
                tinRequest = (CTINRequest)Session[DataObjectName];

                switch (tinRequest.Status)
                {
                    case "Submitted":
                        TinRequestForm.ForEach(DisableItem);
                        SubmitButton.Visible = false;
                        ApproveButton.Visible = Global.SessionUser.RoleId == 1 ? true : false;
                        RejectButton.Visible = Global.SessionUser.RoleId == 1 ? true : false;
                        break;
                    case "Approved":
                        TinRequestForm.ForEach(DisableItem);
                        SubmitButton.Visible = false;
                        ApproveButton.Visible = false;
                        RejectButton.Visible = false;
                        break;
                    case "Rejected":
                        TinRequestForm.Enabled = true;
                        TinRequestForm.ForEach(EnableItem);

                        if (Global.SessionUser.RoleId == 1)
                        {
                            TinRequestForm.ForEach(DisableItem);
                        }

                        SubmitButton.Visible = Global.SessionUser.RoleId == 1 ? false : true;
                        ApproveButton.Visible = false;
                        RejectButton.Visible = false;
                        break;
                }
            }
        }

        private void ClearItem(LayoutItemBase item)
        {
            if (item is LayoutItem layoutItem)
            {
                if (layoutItem.GetNestedControl() is ASPxEditBase editBase)
                {
                    editBase.Value = string.Empty;
                }
            }
        }

        private void DisableItem(LayoutItemBase item)
        {
            if (item is LayoutItem layoutItem)
            {
                if (layoutItem.GetNestedControl() is ASPxEditBase editBase)
                {
                    editBase.Enabled = false;
                }
            }
        }

        private void EnableItem(LayoutItemBase item)
        {
            if (item is LayoutItem layoutItem)
            {
                if (layoutItem.GetNestedControl() is ASPxEditBase editBase)
                {
                    editBase.Enabled = true;
                }
            }
        }

        protected void LgaCombo_Callback(object sender, CallbackEventArgsBase e)
        {
            LgaCombo.Items.Clear();

            List<LGA> lgas = GetLgas(e.Parameter);

            LgaCombo.DataSource = lgas;
            LgaCombo.TextField = "LGAName";
            LgaCombo.ValueField = "LGAId";
            LgaCombo.DataBind();
        }

        protected void AddressStateCombo_Callback(object sender, CallbackEventArgsBase e)
        {
            var states = GetStates(int.Parse(e.Parameter));

            AddressStateCombo.DataSource = states;
            AddressStateCombo.TextField = "StateName";
            AddressStateCombo.ValueField = "StateId";
            AddressStateCombo.DataBind();
        }

        private void SubmitRecord()
        {
            try
            {
                Model.CTINRequest request;
                if ((Boolean)ViewState["IsNewRecord"] == true)
                {
                    request = new CTINRequest();
                }
                else { request = (CTINRequest)Session[DataObjectName];}

                request.CompanyType = (string)TinRequestForm.GetNestedControlValueByFieldName("CompanyType");
                request.CacNumber = (string)TinRequestForm.GetNestedControlValueByFieldName("CacNumber");
                request.BNNumber = (string)TinRequestForm.GetNestedControlValueByFieldName("BNNumber");
                request.RegistrationDate = (DateTime)TinRequestForm.GetNestedControlValueByFieldName("RegistrationDate");
                request.CompanyName = (string)TinRequestForm.GetNestedControlValueByFieldName("CompanyName");
                request.PreviousFCTTin = (string)TinRequestForm.GetNestedControlValueByFieldName("PreviousFCTTin");
                request.BusinessLineId = (string)TinRequestForm.GetNestedControlValueByFieldName("BusinessLineId");
                request.RegisteredAddressStreetNo = (string)TinRequestForm.GetNestedControlValueByFieldName("RegisteredAddressStreetNo");
                request.RegisteredAddressStreet = (string)TinRequestForm.GetNestedControlValueByFieldName("RegisteredAddressStreet");
                request.RegisteredAddressCity = (string)TinRequestForm.GetNestedControlValueByFieldName("RegisteredAddressCity");
                request.RegisteredAddressCountryId = int.Parse(TinRequestForm.GetNestedControlValueByFieldName("RegisteredAddressCountryId").ToString());
                request.RegisteredAddressStateId = (string)TinRequestForm.GetNestedControlValueByFieldName("RegisteredAddressStateId");
                request.RegisteredAddressLgaId = int.Parse(TinRequestForm.GetNestedControlValueByFieldName("RegisteredAddressLgaId").ToString());
                request.PrimaryPhone = (string)TinRequestForm.GetNestedControlValueByFieldName("PrimaryPhone");
                request.SecondaryPhone = (string)TinRequestForm.GetNestedControlValueByFieldName("SecondaryPhone");
                request.Email = (string)TinRequestForm.GetNestedControlValueByFieldName("Email");
                request.ContactPerson = (string)TinRequestForm.GetNestedControlValueByFieldName("ContactPerson");
                request.ContactPersonPhone = (string)TinRequestForm.GetNestedControlValueByFieldName("ContactPersonPhone");
                request.TaxOfficeId = (string)TinRequestForm.GetNestedControlValueByFieldName("TaxOfficeId");
                request.CreateDate = DateTime.Now;
                request.CreatedBy = Global.SessionUser.UserName;
                request.Status = "Submitted";
                request.RecordSource = "FCTIRS";

                ValidateRecord(request);

                if ((Boolean)ViewState["IsNewRecord"] == true)
                {
                    context.CTINRequests.Add(request);
                    context.SaveChanges();
                }
                else { context.SaveChanges(); }

                DisplayAlert("Success", "Non-Individual TIN Request", "TIN Request Submitted Successfully");

                TinRequestGrid.DataBind();
                TinRequestMultiView.ActiveViewIndex = 0;

            }
            catch (Exception ex)
            {
                DisplayAlert("Danger", "Non-Individual TIN Request", ex.Message);
            }
        }

        protected void RequestIdButton_Click(object sender, EventArgs e)
        {
            ViewState["IsNewRecord"] = false;

            ASPxButton btn = (ASPxButton)sender;
            GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)btn.NamingContainer;
            var value = container.Grid.GetRowValues(container.VisibleIndex, new string[] { "RequestId" });

            long requestId = (long)value;

            try
            {
                Session[DataObjectName] = context.CTINRequests.Where(r => r.RequestId == requestId).Single();
                context.Entry((CTINRequest)Session[DataObjectName]).Reload();
                Session[DataObjectName] = context.CTINRequests.Single(r => r.RequestId == requestId);

                TinRequestForm.DataSource = (CTINRequest)Session[DataObjectName];
                TinRequestForm.DataBind();

                TinRequestMultiView.ActiveViewIndex = 1;
                SetButtonVisibility();

                if (CountryCombo.SelectedIndex > 0)
                {
                    string country = (string) CountryCombo.SelectedItem.Value;
                    AddressStateCombo_Callback(null, new CallbackEventArgsBase(country.ToString()));
                }

                string addressState = AddressStateCombo.SelectedIndex < 1 ? string.Empty : (string)AddressStateCombo.SelectedItem.Value;
                LgaCombo_Callback(null, new CallbackEventArgsBase(addressState));
            }
            catch (Exception ex)
            {
                DisplayAlert("Danger", "Get Individual Taxpayer", ex.Message);
                return;
            }
        }

        private void ValidateRecord(Model.CTINRequest request)
        {
            string businessNumber = request.BNNumber;
            string cacNumber = request.CacNumber;
            string message;

            if (!string.IsNullOrEmpty(cacNumber) && context.CTaxpayers.Any(n => n.CacNumber == cacNumber) == true)
            {
                message = string.Format("CAC Number: {0} is already registered as a taxpayer", cacNumber);
                throw new Exception(message);
            }

            if (!string.IsNullOrEmpty(businessNumber) && context.CTaxpayers.Any(n => n.BNNumber == businessNumber) == true)
            {
                message = string.Format("Enterprise: {0} is already registered as a taxpayer", businessNumber);
                throw new Exception(message);
            }

            if (string.IsNullOrEmpty(cacNumber) && string.IsNullOrEmpty(businessNumber))
            {
                message = string.Format("CAC number or Business Number is required to submit this request");
                throw new Exception(message);
            }
        }

        protected void TinRequestForm_DataBinding(object sender, EventArgs e)
        {
            TinRequestForm.DataSource = (CTINRequest)Session[DataObjectName];
        }

        protected void CacEntityServerModeDataSource_Selecting(object sender, DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs e)
        {
            e.KeyExpression = "CacNumber";
        }

        protected void CacNumberGridLookup_ValueChanged(object sender, EventArgs e)
        {
            ASPxGridView grid = (ASPxGridView)CacNumberGridLookup.GridView;

            string[] fields = new string[]
            {"CacNumber","CompanyName","RegistrationDate"};

            var selectedRowValues = grid.GetRowValues(grid.FocusedRowIndex, fields);

            CompanyNameTextBox.Text = (string)grid.GetRowValues(grid.FocusedRowIndex, "CompanyName");
            RegistrationDateEdit.Date= (DateTime)grid.GetRowValues(grid.FocusedRowIndex, "RegistrationDate");
        }

        protected void CompanyTypeCombo_ValueChanged(object sender, EventArgs e)
        {
            CheckCompanyType();
        }

        private void CheckCompanyType()
        {
            switch (CompanyTypeCombo.SelectedItem.Value)
            {
                case "Corporate":
                    CacNumberGridLookup.Enabled = true;
                    CompanyNameTextBox.Enabled = false;
                    RegistrationDateEdit.Enabled = false;
                    BNNumberText.Enabled = false;
                    BNNumberText.Text = string.Empty;
                    break;
                case "Enterprise":
                    CacNumberGridLookup.Enabled = false;
                    CacNumberGridLookup.Text = string.Empty;
                    CompanyNameTextBox.Enabled = true;
                    CompanyNameTextBox.Text = string.Empty;
                    RegistrationDateEdit.Enabled = true;
                    BNNumberText.Enabled = true;
                    break;
            }

        }

        protected void TinRequestGrid_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Name == "AddTINRequest")
            {
                ViewState["IsNewRecord"] = true;
                TinRequestMultiView.ActiveViewIndex = 1;
                SetButtonVisibility();
            }
        }
    }
}