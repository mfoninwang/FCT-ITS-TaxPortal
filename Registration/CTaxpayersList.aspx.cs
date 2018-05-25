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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void TaxpayersEntityServerModeDataSource_Selecting(object sender, DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs e)
        {
            e.KeyExpression = "TIN";
        }
    }
}