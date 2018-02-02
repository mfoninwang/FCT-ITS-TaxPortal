using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TAAPs.Administration
{
    public partial class BusinessLineList : AccessPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxgvBusLineList_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "BusinessLineId")
            {
                e.Cell.Attributes.Add("onclick", "event.cancelBubble = true");
            }
        }
    }
}