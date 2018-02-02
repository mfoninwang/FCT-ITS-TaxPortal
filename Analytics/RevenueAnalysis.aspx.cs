using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using DevExpress.DataAccess.ConnectionParameters;
using TAAPs.Model;

namespace TAAPs.Analytics
{
    public partial class RevenueAnalysis : AccessPage
    {
        TAAPsDBContext _context = new TAAPsDBContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ASPxDashboardViewer1_ConfigureDataConnection(object sender, DevExpress.DashboardWeb.ConfigureDataConnectionWebEventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["firs_portalCon"].ConnectionString;
            SqlConnectionStringBuilder con = new SqlConnectionStringBuilder(conString);
            
            if (e.ConnectionName == "firs_portalCon")
            {
                // Gets the connection parameters used to establish a connection to the database.
                MsSqlConnectionParameters parameters =
                    (MsSqlConnectionParameters)e.ConnectionParameters;

                // Specifies the user name used to access the database file. 
                parameters.UserName = con.UserID;

                // Specifies the password used to access the database file.
                parameters.Password = con.Password;

                // Specifies the datasource.
                parameters.ServerName = con.DataSource;
            }
        }
    }
}