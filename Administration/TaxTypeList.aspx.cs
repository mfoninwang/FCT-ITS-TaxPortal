using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;


namespace TAAPs.Administration
{
    public partial class TaxTypeList : AccessPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxgvTaxTypes_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "TaxTypeId")
            {
                e.Cell.Attributes.Add("onclick", "event.cancelBubble = true");
            }
        }

        protected void ASPxgvTaxTypes_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e)
        {
            //e.ErrorText = e.Exception.InnerException.ToString();
            DisplayAlert("Danger", "Tax Type", e.Exception.Message);
        }
    }
}