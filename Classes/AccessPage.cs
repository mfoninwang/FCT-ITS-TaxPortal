using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TAAPs.Model;
using System.Web.UI;

namespace TAAPs
{
    public class AccessPage : BasePage
    {
        TAAPsDBContext _context = new TAAPsDBContext();
        protected override void OnLoad(EventArgs e)
        {
            if (!IsPostBack || !IsCallback)
            {
                if (Session["User"] == null) { Response.Redirect("~/SessionTimeout.aspx"); }
                else
                {
                    Model.User _user = Global.SessionUser;

                    if (!CanRoleAccessResource(_user.Role))
                    {
                        DisplayAlert("Invalid Access");
                        Response.Redirect("~/index.aspx");
                    }
                    base.OnLoad(e);
                }
            }
        }

        private bool CanRoleAccessResource(Role _role)
        {
           //string _path1 = base.Request.CurrentExecutionFilePath;
           string _path = base.Request.RawUrl;
           //string _path2 = base.Request.Url.Query;
           //string _path3 = base.Request.AppRelativeCurrentExecutionFilePath;
           //string _path4 = base.Request.FilePath;

            if (_role.RoleResources.Any(u => _path.Contains(string.IsNullOrEmpty(u.Resource.DecryptedUrl)?"":u.Resource.DecryptedUrl)))
            {
                return true;
            }
            else { return false; }
        }


        public new void DisplayAlert(string message)
        {
            string alertString = string.Concat("alert('", message, "')");

            ClientScript.RegisterStartupScript(this.GetType(), "alert", alertString, true);

            //ScriptManager.RegisterStartupScript();           
        }

        protected override void OnError(EventArgs e)
        {
            Exception Ex = Server.GetLastError();
            Server.ClearError();

            DisplayAlert(Ex.InnerException.ToString());
        }

    }
}