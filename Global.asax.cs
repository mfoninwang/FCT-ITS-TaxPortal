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
        static TAAPsDBContext _context = new TAAPsDBContext();
        public static int FailedLoginAttemts;
        private static Model.User _user;
        static Tenant _tenant;

        public static User SessionUser
        {
            get
            {
                _user = (User)HttpContext.Current.Session["User"];
                return _user;
            }
        }

        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            string taxauthority = ConfigurationManager.AppSettings["TaxAuthority"];

            _tenant = _context.Tenants.Where(t => t.TenantId == taxauthority).Single();
            FailedLoginAttemts = _tenant.FailedLoginAttempts;

            Session.Timeout = _tenant.SessionTimeout;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            //Exception Ex = Server.GetLastError();
            //Server.ClearError();
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
            string _SaltAndPassword = string.Concat(password, salt);
            string _hashedpwd = FormsAuthentication.HashPasswordForStoringInConfigFile(_SaltAndPassword, "SHA1");

            return _hashedpwd;
        }

        public static bool CompareStrings(string password1, string password2)
        {
            return password1.Equals(password2) ? true : false;
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

            _context.UserLoginHistories.Add(_userAccess);
            _context.SaveChanges();
        }

    }
}