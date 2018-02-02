using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace TAAPs.Administration
{
    public partial class RegionList : AccessPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ASPxgvRegions_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "RegionId")
            {
                e.Cell.Attributes.Add("onclick", "event.cancelBubble = true");
            }
        }
    }
}