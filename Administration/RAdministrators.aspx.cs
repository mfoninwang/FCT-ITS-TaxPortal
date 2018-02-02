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
        TAAPsDBContext _context = new TAAPsDBContext();
        OrderedDictionary newValues;

        ASPxButton ASPxButtonPwdReset;
        string _username;


        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            this.newValues = e.NewValues;
            PopulateNewValues();
        }

        private void PopulateNewValues()
        {
            ASPxFormLayout formLayout = (ASPxFormLayout)ASPxGridView1.FindEditFormTemplateControl("formLayout");
            formLayout.ForEach(ProcessItem);
        }

        private void ProcessItem(LayoutItemBase item)
        {
            LayoutItem layoutItem = item as LayoutItem;
            if (layoutItem != null)
            {
                ASPxEditBase editBase = layoutItem.GetNestedControl() as ASPxEditBase;
                if (editBase != null)
                    this.newValues[layoutItem.FieldName] = editBase.Value;
            }
        }

        protected void ASPxGridView1_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "UserName" && ASPxGridView1.IsNewRowEditing)
            {
                e.Editor.ReadOnly = false;
            }
            else if (e.Column.FieldName=="UserName")
            { _username = (string) e.KeyValue; }
        }

        protected void ASPxGridView1_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            string _username = (string)e.NewValues["UserName"];
            string _salt = Model.Global.GenerateSalt(10);
            string _password = Model.Global.GeneratePasswordHash(_username.Trim().ToLower(), _salt);

            e.NewValues.Add("Salt", _salt);
            e.NewValues.Add("PasswordHash", _password);

            this.newValues = e.NewValues;
            PopulateNewValues();
        }


        protected void ASPxPwdReset_Click(object sender, EventArgs e)
        {
                string _salt = Model.Global.GenerateSalt(10);
                string _hash = Model.Global.GeneratePasswordHash(_username.ToLower(), _salt);

                Model.User _user = _context.Users.Where(u => u.UserName == _username).Single();

                _user.Salt = _salt;
                _user.PasswordHash = _hash;

                _context.SaveChanges();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User password has been reset successfully.')", true);
        }

        protected void ASPxPwdReset_Init(object sender, EventArgs e)
        {
            ASPxButtonPwdReset = (ASPxButton)ASPxGridView1.FindEditFormTemplateControl("ASPxPwdReset");
            ASPxButtonPwdReset.Visible = !ASPxGridView1.IsNewRowEditing;
        }
    }
}