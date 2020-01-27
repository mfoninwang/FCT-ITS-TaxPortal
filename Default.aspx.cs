using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using TAAPs.Model;
using System.Configuration;
using System.Data.SqlClient;
using DevExpress.DashboardWeb;
using DevExpress.DataAccess.ConnectionParameters;


namespace TAAPs
{
    public partial class Default : BasePage
    {
        static TAAPsDBContext context;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                context = new TAAPsDBContext();
            }

            if (Session["User"] == null)
            {
                Response.Redirect("~/SessionTimeout.aspx");
            }
        }


    }  
}
