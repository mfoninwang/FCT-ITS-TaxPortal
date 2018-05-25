using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using DevExpress.DashboardCommon;
using DevExpress.DashboardWeb;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using DevExpress.DataAccess.ConnectionParameters;

namespace TAAPs
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DashboardFileStorage dashboardFileStorage = new DashboardFileStorage("~/App_Data/Dashboards");
            ASPxDashboard1.SetDashboardStorage(dashboardFileStorage);

            DataSourceInMemoryStorage dataSourceStorage = new DataSourceInMemoryStorage();

        }

        protected void ASPxDashboard1_ConfigureDataConnection(object sender, ConfigureDataConnectionWebEventArgs e)
        {
            //string conString;

            //if (e.ConnectionName == "TAAPsCon")
            //{
            //    MsSqlConnectionParameters parameters = (MsSqlConnectionParameters)e.ConnectionParameters;
            //    conString = ConfigurationManager.ConnectionStrings["TAAPsCon"].ConnectionString;
            //    SqlConnectionStringBuilder con = new SqlConnectionStringBuilder(conString);

            //    // Specifies the user name used to access the database file. 
            //    parameters.UserName = con.UserID;

            //    // Specifies the password used to access the database file.
            //    parameters.Password = con.Password;

            //    // Specifies the datasource.
            //    parameters.ServerName = con.DataSource;
            //}
        }
    }
}