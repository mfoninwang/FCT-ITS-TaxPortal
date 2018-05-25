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
    public partial class LAdministrators : AccessPage
    {
        TAAPsDBContext context = new TAAPsDBContext();

        ASPxFormLayout formLayout;
        ASPxButton ASPxButtonPwdReset;
        
        string userName;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                formLayout = (ASPxFormLayout)LAdministratorGridview.FindEditFormTemplateControl("formLayout");
            }
        }

        protected void LAdministratorGridview_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            string userName = (string)e.NewValues["UserName"];
            string salt = Model.Global.GenerateSalt(10);
            string password = Model.Global.GeneratePasswordHash(userName.Trim().ToLower(), salt);

            e.NewValues["Salt"] = salt;
            e.NewValues["PasswordHash"] = password;
        }

        protected void ASPxButtonPwdReset_Click(object sender, EventArgs e)
        {
                string salt = Model.Global.GenerateSalt(10);
                string hash = Model.Global.GeneratePasswordHash(userName.ToLower(), salt);

                Model.User user = context.Users.Where(u => u.UserName == userName).Single();

                user.Salt = salt;
                user.PasswordHash = hash;

                context.SaveChanges();

            DisplayAlert("Success", "Password Reset", "User password has been reset successfully");
        }

        protected void ASPxButtonPwdReset_Init(object sender, EventArgs e)
        {
            ASPxButtonPwdReset = (ASPxButton)LAdministratorGridview.FindEditFormTemplateControl("ASPxButtonPwdReset");
            ASPxButtonPwdReset.Visible = !LAdministratorGridview.IsNewRowEditing; 
        }

        protected void LAdministratorGridview_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "UserName" && LAdministratorGridview.IsNewRowEditing)
            {
                e.Editor.ReadOnly = false;
            }
            else if (e.Column.FieldName == "UserName")
            {
                userName = (string)e.KeyValue;
            }
        }

        protected void LAdministratorGridview_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }
    }
}