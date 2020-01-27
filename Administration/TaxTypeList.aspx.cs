using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using DevExpress.Web;

namespace TAAPs.Administration
{
    public partial class TaxTypeList : AccessPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TaxTypeGridView_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.InnerException.InnerException.ToString();
        }

        protected void TaxTypeGridView_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "TaxTypeId")
            {
                e.Cell.Attributes.Add("onclick", "event.cancelBubble = true");
            }
        }

    }
}