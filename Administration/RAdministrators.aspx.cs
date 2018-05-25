using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Security.Cryptography;
using DevExpress.Web;
using TAAPs.Model;

namespace TAAPs.Administration
{
    public partial class RAdministrators : AccessPage
    {
        TAAPsDBContext context = new TAAPsDBContext();
        ASPxButton ASPxButtonPwdReset;
        string userName;


        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ASPxGridView1_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "UserName" && ASPxGridView1.IsNewRowEditing)
            {
                e.Editor.ReadOnly = false;
            }
            else if (e.Column.FieldName=="UserName")
            { userName = (string) e.KeyValue; }
        }

        protected void ASPxGridView1_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            string userName = (string)e.NewValues["UserName"];
            string salt = Model.Global.GenerateSalt(10);
            string password = Model.Global.GeneratePasswordHash(userName.Trim().ToLower(), salt);

            e.NewValues["Salt"] = salt;
            e.NewValues["PasswordHash"] = password;
        }


        protected void ASPxPwdReset_Click(object sender, EventArgs e)
        {
                string salt = Model.Global.GenerateSalt(10);
                string hash = Model.Global.GeneratePasswordHash(userName.ToLower(), salt);

                Model.User user = context.Users.Where(u => u.UserName == userName).Single();

                user.Salt = salt;
                user.PasswordHash = hash;

                context.SaveChanges();

            DisplayAlert("Success", "Password Reset", "User password has been reset successfully");
        }

        protected void ASPxPwdReset_Init(object sender, EventArgs e)
        {
            ASPxButtonPwdReset = (ASPxButton)ASPxGridView1.FindEditFormTemplateControl("ASPxPwdReset");
            ASPxButtonPwdReset.Visible = !ASPxGridView1.IsNewRowEditing;
        }
    }
}