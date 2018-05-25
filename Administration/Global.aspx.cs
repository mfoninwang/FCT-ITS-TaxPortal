using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using TAAPs.Model;
using TAAPs.Messaging;


namespace TAAPs.Administration
{
    public partial class Global : AccessPage
    {
        TAAPsDBContext context = new TAAPsDBContext();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            Model.Tenant tenant = context.Tenants.Single(i => i.TenantId == "FCT-IRS");

            tenant.EmailServer = (string)formlayout.GetNestedControlValueByFieldName("EmailServer");
            tenant.EmailSender = (string)formlayout.GetNestedControlValueByFieldName("EmailSender");
            tenant.EmailUser = (string)formlayout.GetNestedControlValueByFieldName("EmailUser");
            tenant.EmailUserPassword = (string)formlayout.GetNestedControlValueByFieldName("EmailUserPassword");
            tenant.ReportServer = (string)formlayout.GetNestedControlValueByFieldName("ReportServer");
            tenant.ReportDomain = (string)formlayout.GetNestedControlValueByFieldName("ReportDomain");
            tenant.ReportFolder = (string)formlayout.GetNestedControlValueByFieldName("ReportFolder");
            tenant.ReportUser = (string)formlayout.GetNestedControlValueByFieldName("ReportUser");
            tenant.ReportPassword = (string)formlayout.GetNestedControlValueByFieldName("ReportPassword");

            tenant.PasswordExpiration = int.Parse(formlayout.GetNestedControlValueByFieldName("PasswordExpiration").ToString());
            tenant.FailedLoginAttempts = int.Parse(formlayout.GetNestedControlValueByFieldName("FailedLoginAttempts").ToString());
            tenant.SessionTimeout = int.Parse(formlayout.GetNestedControlValueByFieldName("SessionTimeout").ToString());

            context.SaveChanges();

            string message = "Record Saved Successfully";
            DisplayAlert("Success", "Tax Authority Settings", message);
        }
    }
}