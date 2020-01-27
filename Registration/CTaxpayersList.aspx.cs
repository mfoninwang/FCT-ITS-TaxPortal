using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Utils;
using TAAPs.Model;


namespace TAAPs.Registration
{
    public partial class CTaxpayersList : AccessPage
    {
        TAAPsDBContext context = new TAAPsDBContext();
        Model.CTaxpayer taxpayer;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    context = new TAAPsDBContext();
                    LoadListData();
                }
                catch (Exception ex)
                {
                    DisplayAlert("Danger", "Individual Taxpayer", ex.Message);
                }
            }
        }

        protected void TaxpayersEntityServerModeDataSource_Selecting(object sender, DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs e)
        {
            e.KeyExpression = "TIN";
        }

        protected void TinButton_Click(object sender, EventArgs e)
        {
            ASPxButton btn = (ASPxButton)sender;
            GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)btn.NamingContainer;
            var value = container.Grid.GetRowValues(container.VisibleIndex, new string[] { "TIN" });

            string tin = (string)value;
            try
            {
                taxpayer = context.CTaxpayers.Single(r => r.TIN == tin);
                context.Entry(taxpayer).Reload();

                AddressStateCombo_Callback(null, new CallbackEventArgsBase(taxpayer.RegisteredAddressCountryId.ToString()));
                AddressLgaCombo_Callback(new object(), new CallbackEventArgsBase(taxpayer.RegisteredAddressStateId));

                CTaxpayerForm.DataSource = taxpayer;
                CTaxpayerForm.DataBind();

                TaxpayerMultiView.ActiveViewIndex = 1;
            }
            catch (Exception ex)
            {
                DisplayAlert("Danger", "Get Individual Taxpayer", ex.Message);
                return;
            }
        }

        private void LoadListData()
        {
            LoadCompanyTypes();
            LoadCountryList();
            LoadBusinessLines();
        }

        private void LoadCountryList()
        {
            var countries = context.Countries.ToList();

            AddressCountryCombo.DataSource = countries;
            AddressCountryCombo.TextField = "CountryName";
            AddressCountryCombo.ValueField = "CountryId";
            AddressCountryCombo.DataBind();
        }

        private void LoadCompanyTypes()
        {
            var companyTypes = context.CompanyTypes.ToList();

            CompanyTypeCombo.DataSource = companyTypes;
            CompanyTypeCombo.TextField = "CompanyTypeName";
            CompanyTypeCombo.ValueField = "CompanyTypeId";
            CompanyTypeCombo.DataBind();
        }

        protected List<State> GetStates(int countryId)
        {
            var states = context.States.Where(c => c.CountryId == countryId).OrderBy(s => s.StateName).ToList();

            return states;
        }

        private List<LGA> GetLgas(string stateId)
        {
            if (string.IsNullOrEmpty(stateId)) return null;

            List<LGA> lgas = LGA.GetLGAs(stateId).OrderBy(l => l.LGAName).ToList();

            return lgas;
        }

        protected void LoadBusinessLines()
        {
            var businessLines = context.BusinessLines.ToList();

            BusinessLineCombo.DataSource = businessLines;
            BusinessLineCombo.TextField = "BusinessLineName";
            BusinessLineCombo.ValueField = "BusinessLineId";
            BusinessLineCombo.DataBind();
        }

        protected void AddressStateCombo_Callback(object sender, CallbackEventArgsBase e)
        {
            var states = GetStates(int.Parse(e.Parameter));

            AddressStateCombo.DataSource = states;
            AddressStateCombo.TextField = "StateName";
            AddressStateCombo.ValueField = "StateId";
            AddressStateCombo.DataBind();
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

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            SaveRecord();
        }

        private void SaveRecord()
        {
            try
            {
                string tin = (string)CTaxpayerForm.GetNestedControlValueByFieldName("TIN");

                taxpayer = context.CTaxpayers.Single(t => t.TIN == tin);

                taxpayer.CompanyName = (string)CTaxpayerForm.GetNestedControlValueByFieldName("CompanyName");
                taxpayer.BusinessLineId = (string)CTaxpayerForm.GetNestedControlValueByFieldName("BusinessLineId");
                taxpayer.CommencementDate = (DateTime?)CTaxpayerForm.GetNestedControlValueByFieldName("CommencementDate");

                taxpayer.RegisteredAddressCountryId = (int)CTaxpayerForm.GetNestedControlValueByFieldName("RegisteredAddressCountryId");
                taxpayer.RegisteredAddressStateId = (string)CTaxpayerForm.GetNestedControlValueByFieldName("RegisteredAddressStateId");
                taxpayer.RegisteredAddressLgaId = (int)CTaxpayerForm.GetNestedControlValueByFieldName("RegisteredAddressLgaId");
                taxpayer.RegisteredAddressStreetNo = (string)CTaxpayerForm.GetNestedControlValueByFieldName("RegisteredAddressStreetNo");
                taxpayer.RegisteredAddressStreet = (string)CTaxpayerForm.GetNestedControlValueByFieldName("RegisteredAddressStreet");
                taxpayer.RegisteredAddressCity = (String)CTaxpayerForm.GetNestedControlValueByFieldName("RegisteredAddressCity");

                taxpayer.PrimaryPhone = (string)CTaxpayerForm.GetNestedControlValueByFieldName("PrimaryPhone");
                taxpayer.SecondaryPhone = (string)CTaxpayerForm.GetNestedControlValueByFieldName("SecondaryPhone");
                taxpayer.Email = (string)CTaxpayerForm.GetNestedControlValueByFieldName("Email");
                taxpayer.Website = (string)CTaxpayerForm.GetNestedControlValueByFieldName("Website");

                taxpayer.ContactPerson = (string)CTaxpayerForm.GetNestedControlValueByFieldName("ContactPerson");
                taxpayer.ContactPersonPhone = (string)CTaxpayerForm.GetNestedControlValueByFieldName("ContactPersonPhone");

                context.SaveChanges();
                DisplayAlert("Success", "Non Individual Taxpayer", "Taxpayer record successfully saved");
            }

            catch (Exception ex)
            {
                DisplayAlert("Danger", "Individual Taxpayer", ex.Message);
            }
        }

        protected void BackToListButton_Click(object sender, EventArgs e)
        {
            TaxpayerMultiView.ActiveViewIndex = 0;
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            TaxpayerMultiView.ActiveViewIndex = 0;
        }
    }
}