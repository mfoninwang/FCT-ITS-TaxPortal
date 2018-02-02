using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using DevExpress.DataAccess.ConnectionParameters;

namespace TAAPs.Analytics
{
    public partial class TaxOfficeAnalysis : AccessPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxDashboardViewer1_ConfigureDataConnection(object sender, DevExpress.DashboardWeb.ConfigureDataConnectionWebEventArgs e)
        {
            string conString;

            if (e.ConnectionName == "firs_portalCon")
            {
                MsSqlConnectionParameters parameters = (MsSqlConnectionParameters)e.ConnectionParameters;
                conString = ConfigurationManager.ConnectionStrings["firs_portalCon"].ConnectionString;
                SqlConnectionStringBuilder con = new SqlConnectionStringBuilder(conString);

                // Specifies the user name used to access the database file. 
                parameters.UserName = con.UserID;

                // Specifies the password used to access the database file.
                parameters.Password = con.Password;

                // Specifies the datasource.
                parameters.ServerName = con.DataSource;
            }

            if (e.ConnectionName == "TAAPsCon")
            {
                MsSqlConnectionParameters parameters = (MsSqlConnectionParameters)e.ConnectionParameters;
                conString = ConfigurationManager.ConnectionStrings["TAAPsCon"].ConnectionString;
                SqlConnectionStringBuilder con = new SqlConnectionStringBuilder(conString);

                // Specifies the user name used to access the database file. 
                parameters.UserName = con.UserID;

                // Specifies the password used to access the database file.
                parameters.Password = con.Password;

                // Specifies the datasource.
                parameters.ServerName = con.DataSource;
            }
        }

        protected void ASPxDashboardViewer1_CustomParameters(object sender, DevExpress.DashboardWeb.CustomParametersWebEventArgs e)
        {
            foreach (var p in e.Parameters)
            {
                switch (p.Name)
                {
                    case "TaxOffice":
                        p.Value = Session["TaxOfficeId"];
                        break;

                    default:
                        break;
                }
            }
        }
    }
}