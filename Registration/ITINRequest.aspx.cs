using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TAAPs.Model;
using DevExpress.Web;


namespace TAAPs.Registration
{
    public partial class ITINRequest : AccessPage
    {
        TAAPsDBContext _context = new TAAPsDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { }
        }

        protected void ASPxComboBoxLga_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if (string.IsNullOrEmpty(e.Parameter)) return;

            edsLgas.WhereParameters[0].DefaultValue = e.Parameter;
            ASPxComboBoxLga.DataBind();
        }


        protected void ASPxButtonSubmit_Click(object sender, EventArgs e)
        {
            Model.ITINRequest _request = new Model.ITINRequest()
            {
                EmploymentType = ASPxrblIndividualType.Value.ToString(), 
                TaxpayerName = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("TaxpayerName"),
                BusinessLineId = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("BusinessLineId"),
                StreetNo = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("StreetNo"),
                Street = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("Street"),
                City = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("City"),
                StateId = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("StateId"),
                //LgaId = (int?)ASPxFormLayout1.GetNestedControlValueByFieldName("LgaId"),
                Phone1 = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("Phone1"),
                Phone2 = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("Phone2"),
                Email = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("Email"),
                TaxOfficeId = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("TaxOfficeId"),
                CreateDate = DateTime.Now
            };

            _context.ITINRequests.Add(_request);
            _context.SaveChanges();

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Individual TIN Request Submitted Successfully')", true);

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