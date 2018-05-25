using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Configuration;
using TAAPs.Model;

namespace TAAPs
{
    public class Global : HttpApplication
    {
        static TAAPsDBContext context = new TAAPsDBContext();
        public static int FailedLoginAttemts;
        private static Model.User user;
        static Tenant tenant;

        public static User SessionUser
        {
            get
            {
                user = (User)HttpContext.Current.Session["User"];
                return user;
            }
        }

        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            string taxAuthority = ConfigurationManager.AppSettings["TaxAuthority"].ToString();
            tenant = context.Tenants.Where(t => t.TenantId == taxAuthority).Single();
            FailedLoginAttemts = tenant.FailedLoginAttempts;

            Session.Timeout = tenant.SessionTimeout;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception exception = Server.GetLastError();

            if (exception is HttpUnhandledException)
            {
                // Pass the error on to the error page.
                //Server.Transfer("ErrorPage.aspx?handler=Application_Error%20-%20Global.asax", true);
            }
        }

        protected void Session_End(object sender, EventArgs e)
        {
        }

        protected void Application_End(object sender, EventArgs e)
        {
            Session.Abandon();
        }

        public static string GeneratePasswordHash(string password, string salt)
        {
            string saltAndPassword = string.Concat(password, salt);
#pragma warning disable CS0618 // Type or member is obsolete
            string hashedPwd = FormsAuthentication.HashPasswordForStoringInConfigFile(saltAndPassword, "SHA1");
#pragma warning restore CS0618 // Type or member is obsolete

            return hashedPwd;
        }

        public static bool CompareStrings(string string1, string string2)
        {
            return (0 == string.Compare(string1, string2, false));
        }

        public static void LogAttempt(string password1, string password2)
        {
        }

        public static void LogUserAccess(string UserName, Boolean IsSucess, string Comments = "")
        {
            Model.UserLoginHistory _userAccess = new UserLoginHistory
            {
                UserName = UserName,
                IsSuccess = IsSucess,
                Comments = Comments,
                CreateDate = DateTime.Now
            };

            context.UserLoginHistories.Add(_userAccess);
            context.SaveChanges();
        }

        public static string TaxAuthority => tenant.TenantId;
    }
}