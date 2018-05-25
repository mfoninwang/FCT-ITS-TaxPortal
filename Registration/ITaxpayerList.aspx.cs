using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TAAPs.Model;
using DevExpress.Web;

namespace TAAPs.Registration
{
    public partial class ITaxpayerList : AccessPage
    {
        TAAPsDBContext context = new TAAPsDBContext();
        string tin;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        public String TIN
        {
            get
            {
                return tin;
            }
        }

        protected void TINButton_Click(object sender, EventArgs e)
        {
            ASPxButton btn = (ASPxButton)sender;

            GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)btn.NamingContainer;
            var value = container.Grid.GetRowValues(container.VisibleIndex, new string[] {"TIN"});

            tin = value.ToString();

            Server.Transfer("ItaxpayerEdit.aspx", false);
        }

        protected void TaxpayerEntityServerModeDataSource_Selecting(object sender, DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs e)
        {
            e.KeyExpression = "TIN";
        }
    }
}