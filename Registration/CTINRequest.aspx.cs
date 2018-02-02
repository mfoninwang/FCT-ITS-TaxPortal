﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TAAPs.Model;
using DevExpress.Web;


namespace TAAPs.Registration
{
    public partial class CTINRequest : AccessPage
    {
        TAAPsDBContext _context = new TAAPsDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ASPxFormLayout1.ForEach(ClearItem);
            }
        }

        protected void ASPxComboBoxLga_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if (string.IsNullOrEmpty(e.Parameter)) return;

            edsLgas.WhereParameters[0].DefaultValue = e.Parameter;
            ASPxComboBoxLga.DataBind();
        }

        protected void aspxCompanyType_SelectedIndexChanged(object sender, EventArgs e)
        {
            aspxButtonEditRCNo.Enabled =  aspxCompanyType.SelectedItem.Value.ToString() == "Corporate" ? true : false;
            aspxButtonEditRCNo.Text = string.Empty;
            aspxtxtCompanyName.ReadOnly = aspxCompanyType.SelectedItem.Value.ToString() == "Corporate" ? true : false;
            aspxdtDoI.ReadOnly = aspxCompanyType.SelectedItem.Value.ToString() == "Corporate" ? true : false;     
        }

        protected void ASPxButtonSubmit_Click(object sender, EventArgs e)
        {
            Model.CTINRequest _request = new Model.CTINRequest()
            {
                CompanyType = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("CompanyType"),
                RCNo = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("RCNo"),
                DateOfIncorporation = (DateTime)ASPxFormLayout1.GetNestedControlValueByFieldName("DateOfIncorporation"),
                DateOfCommencement = (DateTime?)ASPxFormLayout1.GetNestedControlValueByFieldName("DateOfCommencement"),
                FinancialYearBegin = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("FinancialYearBegin"),
                FinancialYearEnd = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("FinancialYearEnd"),
                CompanyName = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("CompanyName"),
                BusinessLineId = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("BusinessLineId"),
                BusinessStreetNo = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("BusinessStreetNo"),
                BusinessStreet = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("BusinessStreet"),
                BusinessCity = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("BusinessCity"),
                BusinessStateId = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("BusinessStateId"),
                // BusinessLgaId = (int)ASPxFormLayout1.GetNestedControlValueByFieldName("BusinessLgaId"),
                Phone1 = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("Phone1"),
                Phone2 = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("Phone2"),
                Email = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("Email"),
                TaxOfficeId = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("TaxOfficeId"),
                CreateDate = DateTime.Now
            };
           
            _context.CTINRequests.Add(_request);
            _context.SaveChanges();

            DisplayAlert ("Corpotare TIN Request Submitted Successfully");

            ASPxFormLayout1.ForEach(ClearItem);
        }

        private void ClearItem(LayoutItemBase item)
        {
            var layoutItem = item as LayoutItem;
            if (layoutItem != null)
            {
                var editBase = layoutItem.GetNestedControl() as ASPxEditBase;
                if (editBase != null)
                {
                    editBase.Value = string.Empty;
                }
            }            
        }

        protected void ASPxFormLayout1_DataBound(object sender, EventArgs e)
        {
            ASPxFormLayout1.ForEach(ClearItem);
        }
    }
}