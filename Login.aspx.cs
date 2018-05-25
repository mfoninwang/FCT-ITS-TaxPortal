using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TAAPs.Model;

namespace TAAPs
{
    public partial class Login_aspx : BasePage
    {
        TAAPsDBContext context = new TAAPsDBContext();
        static int counter;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            ValidateUser();
        }

        private void ValidateUser()
        {
            string username = this.username.Value;
            string password = this.password.Value;

            try
            {
                if (context.Users.Any(u => u.UserName == username))
                {
                    var user = context.Users.Where(u => u.UserName == username).Single();

                    if (user.IsActive == false)
                    {
                        Global.LogUserAccess(username, false, "Inactive Account");

                        DisplayAlert("Information", "Login", "Your account is not active. Please contact the System Administrator");
                        return;
                    }

                    if (user.PasswordHash != Global.GeneratePasswordHash(password, user.Salt))
                    {
                        Global.LogUserAccess(username, false, "Invalid Password");

                        DisplayAlert("Danger", "Login", "Your password is incorrect.");
                        if (counter++ == Global.FailedLoginAttemts) { LockUserAccount(user); }
                        return;
                    }

                    if (user.ChangePassword)
                    {
                        Response.Redirect("ChangePassword.aspx?username=" + username);
                        return;
                    }

                    Session["User"] = user;
                    Session["TaxOfficeId"] = user.TaxOfficeId;
                    Session["LoggedInUser"] = user;
                    Session["UserName"] = user.UserName;
                    Session["UserRoleId"] = user.RoleId;
                    Session["UserRegionId"] = user.RegionId;

                    Global.LogUserAccess(username, true, "Successful Login");

                    Response.Redirect(url: "default.aspx");
                }
                else
                {
                    DisplayAlert("Danger", "Login", "This user does not exist");
                }
            }
            catch (Exception ex)
            {
                DisplayAlert("Danger", "Login", ex.Message);
            }
        }

        private void LockUserAccount(User user)
        {
            user.IsActive = false;
            context.SaveChanges();
        }
    }
}