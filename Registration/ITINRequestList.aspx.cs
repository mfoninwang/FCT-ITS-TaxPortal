using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Core.Objects;
using System.Data.Entity;
using DevExpress.Web;
using TAAPs.Model;
using TAAPs.Messaging;
using log4net;

namespace TAAPs.Registration
{
    public partial class ITINRequestList : AccessPage    
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        static TAAPsDBContext context;
        private Model.ITINRequest tinRequest;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               try
                {
                    context = new TAAPsDBContext();

                    string yearDiff = (DateTime.Today.Year - 18).ToString();
                    string maxDate = string.Concat(yearDiff, "/12", "/31");
                    BirthDateDateEdit.MaxDate = DateTime.Parse(maxDate);

                    TinRequestGridview.Toolbars[0].Items[1].Visible =  Global.SessionUser.RoleId == 1 ? false : true;

                    LoadListData();
                }
                catch (Exception ex)
                {
                    DisplayAlert("Danger", "Individual Taxpayer", ex.Message);
                }
            }
        }

        protected void TinRequestEntityServerDataSource_Selecting(object sender, DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs e)
        {
            e.KeyExpression = "RequestId";
        }

        protected void ApproveButton_Click(object sender, EventArgs e)
        {
            try
            {
                string approvedBy = (string)Global.SessionUser.UserName;
                tinRequest = (ITINRequest)Session["TinRequest"];
                long requestId = tinRequest.RequestId;

                string tin =  ITINRequest.ApproveTinRequest(requestId, approvedBy);

                string message = string.Format("TIN: {0} has been successfully generated.", tin);
                DisplayAlert("Success", "Individual TIN Request", message);

                string firstName = tinRequest.FirstName;
                string lastname = tinRequest.LastName;
                string phone = tinRequest.Phone1;

                //SMSMessaging.SendGenericSms(firstName,lastname,tin,phone);

                TinRequestGridview.DataBind();
                TinRequestMultiView.ActiveViewIndex = 0;
            }
            catch (Exception ex)
            {
                DisplayAlert("Danger", "Individual TIN Request", ex.Message);
            }
        }

        protected void RejectButton_Click(object sender, EventArgs e)
        {
            tinRequest.Status = "Rejected";
            context.SaveChanges();

            TinRequestGridview.DataBind();
            TinRequestMultiView.ActiveViewIndex = 0;
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
                SubmitRecord();
        }

        protected void OriginLgaCombo_Callback(object sender, CallbackEventArgsBase e)
        {
            OriginLgaCombo.Items.Clear();

            List<LGA> lgas = GetLgas(e.Parameter);

            OriginLgaCombo.DataSource = lgas;
            OriginLgaCombo.TextField = "LGAName";
            OriginLgaCombo.ValueField = "LGAId";
            OriginLgaCombo.DataBind();
        }

        protected void AddressLgaCombo_Callback(object sender, CallbackEventArgsBase e)
        {
            AddressLgaCombo.Items.Clear();

            List<LGA> lgas = GetLgas(e.Parameter);

            AddressLgaCombo.DataSource = lgas;
            AddressLgaCombo.TextField = "LGAName";
            AddressLgaCombo.ValueField = "LGAId";
            AddressLgaCombo.DataBind();
        }

        protected void TinRequestForm_DataBinding(object sender, EventArgs e)
        {
            //TinRequestForm.DataSource = tinRequest;
        }

        protected void LoadStates()
        {
            var states = context.States.ToList();

            BirthStateCombo.DataSource = states;
            BirthStateCombo.TextField = "StateName";
            BirthStateCombo.ValueField = "StateId";
            BirthStateCombo.DataBind();

            OriginStateCombo.DataSource = states;
            OriginStateCombo.TextField = "StateName";
            OriginStateCombo.ValueField = "StateId";
            OriginStateCombo.DataBind();

            AddressStateCombo.DataSource = states;
            AddressStateCombo.TextField = "StateName";
            AddressStateCombo.ValueField = "StateId";
            AddressStateCombo.DataBind();

        }

        private void LoadTaxOffices()
        {
            var taxOffices = context.TaxOffices.ToList();

            TaxOfficeCombo.DataSource = taxOffices;
            TaxOfficeCombo.TextField = "TaxOfficeName";
            TaxOfficeCombo.ValueField = "TaxOfficeId";
            TaxOfficeCombo.DataBind();
        }

        private void LoadIndentificationTypes()
        {
            IdentificationTypeCombo.DataSource = IdentificationType.IdentificationTypes;
            IdentificationTypeCombo.TextField = "value";
            IdentificationTypeCombo.ValueField = "key";
            IdentificationTypeCombo.DataBind();
        }

        private List<LGA> GetLgas(string stateId)
        {
            if (string.IsNullOrEmpty(stateId)) return null;

            List<LGA> lgas =  LGA.GetLGAs(stateId).OrderBy(l => l.LGAName).ToList();

            return lgas;
        }

        private void LoadOriginLGAs(string stateId)
        {
            OriginLgaCombo.Items.Clear();

            if (string.IsNullOrEmpty(stateId)) return;

            OriginLgaCombo.DataSource = LGA.GetLGAs(stateId).OrderBy(l => l.LGAName);
            OriginLgaCombo.TextField = "LGAName";
            OriginLgaCombo.ValueField = "LGAId";
            OriginLgaCombo.DataBind();
        }

        private void LoadAddressLgas(string stateId)
        {
            AddressLgaCombo.Items.Clear();

            if (string.IsNullOrEmpty(stateId)) return;

            AddressLgaCombo.DataSource = LGA.GetLGAs(stateId).OrderBy(l => l.LGAName);
            AddressLgaCombo.TextField = "LGAName";
            AddressLgaCombo.ValueField = "LGAId";
            AddressLgaCombo.DataBind();
        }

        private void LoadProfessions()
        {
            var professions = context.Professions.ToList();

            ProfessionCombo.DataSource = professions;
            ProfessionCombo.TextField = "ProfessionName";
            ProfessionCombo.ValueField = "ProfessionName";
            ProfessionCombo.DataBind();
        }

        private void LoadListData()
        {
            LoadProfessions();
            LoadCountryList();
            LoadStates();
            LoadTaxOffices();
            LoadIndentificationTypes();

            //string state = BirthStateCombo.SelectedIndex < 1 ? string.Empty : (string)BirthStateCombo.SelectedItem.Value;
            //BirthLgaCombo_Callback(new object(), null);

            //string originstate = OriginStateCombo.SelectedIndex < 1 ? string.Empty : (string)OriginStateCombo.SelectedItem.Value;
            //LoadOriginLGAs(originstate);

            //string addressstate = AddressStateCombo.SelectedIndex < 1 ? string.Empty : (string)AddressStateCombo.SelectedItem.Value;
            //LoadAddressLgas(originstate);
        }

        private void LoadCountryList()
        {
            var countries = context.Countries.ToList();

            BirthCountryCombo.DataSource = countries;
            BirthCountryCombo.TextField = "CountryName";
            BirthCountryCombo.ValueField = "CountryId";
            BirthCountryCombo.DataBind();

            NationalityCombo.DataSource = countries;
            NationalityCombo.TextField = "CountryName";
            NationalityCombo.ValueField = "CountryId";
            NationalityCombo.DataBind();
        }

        private void SubmitRecord()
        {
            try
            {
                Model.ITINRequest request = new Model.ITINRequest();

                request = (Boolean) ViewState["IsNewRecord"] == true ? request : (ITINRequest) Session["TinRequest"];

                request.LastName = (string)TinRequestForm.GetNestedControlValueByFieldName("LastName");
                request.FirstName = (string)TinRequestForm.GetNestedControlValueByFieldName("FirstName");
                request.MiddleName = (string)TinRequestForm.GetNestedControlValueByFieldName("MiddleName");

                request.BVN = (string)TinRequestForm.GetNestedControlValueByFieldName("BVN");
                request.JTBTIN = (string)TinRequestForm.GetNestedControlValueByFieldName("JTBTIN");
                request.NIN = (string)TinRequestForm.GetNestedControlValueByFieldName("NIN");

                request.Title = (string)TinRequestForm.GetNestedControlValueByFieldName("Title");
                request.MaritalStatus = (string)TinRequestForm.GetNestedControlValueByFieldName("MaritalStatus");
                request.Gender = (string)TinRequestForm.GetNestedControlValueByFieldName("Gender");
                request.BirthDate = (DateTime)TinRequestForm.GetNestedControlValueByFieldName("BirthDate");
                request.BirthCity = (string)TinRequestForm.GetNestedControlValueByFieldName("BirthCity");
                request.BirthCountryId = int.Parse(TinRequestForm.GetNestedControlValueByFieldName("BirthCountryId").ToString());
                request.BirthStateId = (string)TinRequestForm.GetNestedControlValueByFieldName("BirthStateId");

                request.NationalityId = int.Parse(TinRequestForm.GetNestedControlValueByFieldName("NationalityId").ToString());

                request.OriginStateId = (string)TinRequestForm.GetNestedControlValueByFieldName("OriginStateId");

                if (!string.IsNullOrEmpty(OriginLgaCombo.Text))
                {
                    request.OriginLgaId = int.Parse(TinRequestForm.GetNestedControlValueByFieldName("OriginLgaId").ToString());
                }

                request.Employer = (string)TinRequestForm.GetNestedControlValueByFieldName("Employer");
                request.EmploymentId = (string)TinRequestForm.GetNestedControlValueByFieldName("EmploymentId");
                request.Employer = (string)TinRequestForm.GetNestedControlValueByFieldName("Employer");
                request.EmploymentStatus = (string)TinRequestForm.GetNestedControlValueByFieldName("EmploymentStatus");
                request.Profession = (string)TinRequestForm.GetNestedControlValueByFieldName("Profession");

                request.IdentificationNumber = (string)TinRequestForm.GetNestedControlValueByFieldName("IdentificationNumber");
                request.IdentificationType = (string)TinRequestForm.GetNestedControlValueByFieldName("IdentificationType");

                request.Phone1 = (string)TinRequestForm.GetNestedControlValueByFieldName("Phone1").ToString();
                request.Phone2 = (string)TinRequestForm.GetNestedControlValueByFieldName("Phone2");
                request.Email = (string)TinRequestForm.GetNestedControlValueByFieldName("Email");
                request.Website = (string)TinRequestForm.GetNestedControlValueByFieldName("Website");
                request.TaxOfficeId = (string)TinRequestForm.GetNestedControlValueByFieldName("TaxOfficeId");

                request.StreetNo = (string)TinRequestForm.GetNestedControlValueByFieldName("StreetNo");
                request.AddressLine1 = (string)TinRequestForm.GetNestedControlValueByFieldName("AddressLine1");
                request.AddressLine2 = (string)TinRequestForm.GetNestedControlValueByFieldName("AddressLine2");
                request.AddressCity = (string)TinRequestForm.GetNestedControlValueByFieldName("AddressCity");
                request.AddressStateId = (string)TinRequestForm.GetNestedControlValueByFieldName("AddressStateId");

                if (!string.IsNullOrEmpty(TinRequestForm.GetNestedControlValueByFieldName("AddressLgaId").ToString()))
                {
                    request.AddressLgaId = int.Parse(TinRequestForm.GetNestedControlValueByFieldName("AddressLgaId").ToString());
                }
                else { request.AddressLgaId = null; }

                request.RecordSource = "FCTIRS";
                request.CreatedBy = Global.SessionUser.UserName;
                request.CreateDate = DateTime.Now;
                request.Status = "Submitted";

                ValidateRecord(request);

                if ((Boolean)ViewState["IsNewRecord"] == true)
                {
                    context.ITINRequests.Add(request);
                    context.SaveChanges();
                } else
                {
                    context.SaveChanges();
                }

                DisplayAlert("Success", "Individual TIN Request", "TIN Request Submitted Successfully");

                TinRequestGridview.DataBind();
                TinRequestMultiView.ActiveViewIndex = 0;
            }
            catch (Exception ex)
            {
                DisplayAlert("Danger", "Individual TIN Request", ex.Message);
                return;
            }
        }

        protected void RequestIdButton_Click(object sender, EventArgs e)
        {
            ViewState["IsNewRecord"] = false;

            ASPxButton btn = (ASPxButton)sender;
            GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)btn.NamingContainer;
            var value = container.Grid.GetRowValues(container.VisibleIndex, new string[] { "RequestId" });

            long requestId = (long) value;
            try
            {
                tinRequest = context.ITINRequests.Single(r => r.RequestId == requestId);
                context.Entry(tinRequest).Reload();

                OriginLgaCombo_Callback(new object(), new CallbackEventArgsBase(tinRequest.OriginStateId));
                AddressLgaCombo_Callback(new object(), new CallbackEventArgsBase(tinRequest.AddressStateId));

                TinRequestForm.DataSource = tinRequest;
                TinRequestForm.DataBind();

                Session["TinRequest"] = tinRequest;

                TinRequestMultiView.ActiveViewIndex = 1;
                SetButtonVisibility();
            }
            catch (Exception ex)
            {
                DisplayAlert("Danger", "Get Individual Taxpayer", ex.Message);
                return;
            }
        }

        private void SetButtonVisibility()
        {
            if ((Boolean)ViewState["IsNewRecord"] == true)
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
                tinRequest = (Model.ITINRequest)Session["TinRequest"];
                // check request status;
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

        private void ValidateRecord(ITINRequest request)
        {
            string nin = request.NIN;
            string bvn = request.BVN;
            string jtbTin = request.JTBTIN;
            string message;

            if (ExistInNIN(nin) == true)
            {
                message = string.Format("National Identity Number: {0} is already registered as a taxpayer", nin);
                throw new Exception(message);
            }

            if (ExistInBVN(bvn) == true)
            {
                message = string.Format("BVN: {0} is already registered as a taxpayer", bvn);
                throw new Exception(message);
            }

            if (!string.IsNullOrEmpty(jtbTin) && context.ITaxpayers.Any(n => n.JTBTIN == jtbTin)==true)
            {
                message = string.Format("JTB TIN: {0} is already registered as a taxpayer", jtbTin);
                throw new Exception(message);
            }

            if (string.IsNullOrEmpty(bvn) && string.IsNullOrEmpty(nin))
            {
                message = string.Format("A BVN or National Identity Number (NIN) is required to submit this request");
                throw new Exception(message);
            }

        }

        private Boolean ExistInNIN(string nin)
        {
            Boolean exist = !string.IsNullOrEmpty(nin) && context.ITaxpayers.Any(n => n.NIN == nin)?true:false;

            return exist;
        }

        private Boolean ExistInBVN(string bvn)
        {
            Boolean exist = !string.IsNullOrEmpty(bvn) && context.ITaxpayers.Any(n => n.BVN == bvn) ? true : false;

            return exist;
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            TinRequestGridview.DataBind();
            TinRequestMultiView.ActiveViewIndex = 0;
        }

        protected void TinRequestGridview_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
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