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
        TAAPsDBContext _context = new TAAPsDBContext();
        string _username;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            _username = Request.QueryString["username"].ToString();

            string _oldPassword = txtOldPassword.Text.Trim();
            string _newPassword = txtPassword.Text.Trim();
            string _confirmPassword = txtConfirmPassword.Text.Trim();

            var _user = _context.Users.Where(u => u.UserName == _username).Single();

            string _oldPasswordHash = Global.GeneratePasswordHash(_oldPassword, _user.Salt);
            string _currentPasswordHash = _user.PasswordHash;

            if (_oldPasswordHash.Equals(_currentPasswordHash)==false)
            {
                DisplayAlert("Old Password is Incorrect." );
                return;
            }

            string _passwordHash = Global.GeneratePasswordHash(_newPassword, _user.Salt);
            _user.PasswordHash = _passwordHash;
            _context.SaveChanges();
        }
    }
}