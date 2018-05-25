using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TAAPs.Model;

namespace TAAPs
{
    public partial class ChangePassword : BasePage
    {
        TAAPsDBContext context = new TAAPsDBContext();
        string usernaNe;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            usernaNe = Request.QueryString["username"].ToString();

            string oldPassword = txtOldPassword.Text.Trim();
            string newPassword = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            var user = context.Users.Where(u => u.UserName == usernaNe).Single();

            string oldPasswordHash = Global.GeneratePasswordHash(oldPassword, user.Salt);
            string _currentPasswordHash = user.PasswordHash;

            if (oldPasswordHash.Equals(_currentPasswordHash)==false)
            {
                DisplayAlert("Danger", "Change Password", "Old Password is Incorrect." );
                return;
            }

            string passwordHash = Global.GeneratePasswordHash(newPassword, user.Salt);
            user.PasswordHash = passwordHash;
            context.SaveChanges();
        }
    }
}