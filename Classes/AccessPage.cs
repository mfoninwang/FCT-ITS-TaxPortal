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
        TAAPsDBContext context = new TAAPsDBContext();

        protected override void OnLoad(EventArgs e)
        {
            if (!IsPostBack || !IsCallback)
            {
                if (Session["User"] == null) { Response.Redirect("~/SessionTimeout.aspx"); }
                else
                {
                    Model.User user = Global.SessionUser;

                    if (!CanRoleAccessResource(user.Role))
                    {
                        DisplayAlert("Danger", "Access Right", "Unauthorized Access");
                        Response.Redirect(url: "~/login.aspx");
                    }
                    base.OnLoad(e);
                }
            }
        }

        private bool CanRoleAccessResource(Role role)
        {
           string path = Request.RawUrl;

            if (role.RoleResources.Any(u => path.Contains(string.IsNullOrEmpty(u.Resource.DecryptedUrl)?"":u.Resource.DecryptedUrl)))
            {
                return true;
            }
            else { return false; }
        }
    }
}