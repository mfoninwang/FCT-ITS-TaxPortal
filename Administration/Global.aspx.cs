using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using TAAPs.Model;


namespace TAAPs.Administration
{
    public partial class Global : AccessPage
    {
        TAAPsDBContext _context = new TAAPsDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsCallback)
            {
                Thread.Sleep(500);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Model.Tenant _tenant = _context.Tenants.Single(i=>i.TenantId=="OIRS");

            _tenant.EmailServer = (string)formlayout.GetNestedControlValueByFieldName("EmailServer");
            _tenant.EmailSender = (string)formlayout.GetNestedControlValueByFieldName("EmailSender");
            _tenant.EmailUser = (string)formlayout.GetNestedControlValueByFieldName("EmailUser");
            _tenant.EmailUserPassword = (string)formlayout.GetNestedControlValueByFieldName("EmailUserPassword");
            _tenant.ReportServer = (string)formlayout.GetNestedControlValueByFieldName("ReportServer");
            _tenant.ReportDomain = (string)formlayout.GetNestedControlValueByFieldName("ReportDomain");
            _tenant.ReportFolder = (string)formlayout.GetNestedControlValueByFieldName("ReportFolder");
            _tenant.ReportUser = (string)formlayout.GetNestedControlValueByFieldName("ReportUser");
            _tenant.ReportPassword = (string)formlayout.GetNestedControlValueByFieldName("ReportPassword");

            _tenant.PasswordExpiration = int.Parse(formlayout.GetNestedControlValueByFieldName("PasswordExpiration").ToString());
            _tenant.FailedLoginAttempts = int.Parse(formlayout.GetNestedControlValueByFieldName("FailedLoginAttempts").ToString());
            _tenant.SessionTimeout = int.Parse(formlayout.GetNestedControlValueByFieldName("SessionTimeout").ToString());

            _context.SaveChanges();

            string _alert = "Record Saved Successfully";
            DisplayAlert(_alert);
        }
    }
}