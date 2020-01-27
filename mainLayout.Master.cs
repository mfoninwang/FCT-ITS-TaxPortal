using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TAAPs.Model;

namespace TAAPs
{
    public partial class mainLayout : System.Web.UI.MasterPage
    {
        TAAPsDBContext context = new TAAPsDBContext();
        protected List<RoleResource> resources = new List<RoleResource>();
        private User user;

        protected User CurrentUser { get => user; set => user = value; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                user = (User)Session["User"];

                int roleId = user.RoleId;
                LoadResources(roleId);
            }
        }

        private void LoadResources(int roleId)
        {
            var value = from r in context.RoleResources
                        where r.RoleId == roleId && r.Resource.Url != null
                        select r;

            resources = value.ToList();
        }

        protected void Logout_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/index.aspx");
        }

        protected void SubmitIssue_Click(object sender, EventArgs e)
        {
            //IssueLog issue = new IssueLog()
            //{
            //    Subject = SubjectTextField.Value,
            //    Description = DescriptionTextField.Value,
            //    Priority = PriorityField.Value,
            //    CreatedBy = (string)Session["UserName"],
            //    CreateDate = DateTime.Now,
            //    Status = "Open"
            //};

            //context.IssueLogs.Add(issue);
            //context.SaveChanges();

            //ResetForm();
        }

        private void ResetForm()
        {
            //SubjectTextField.Value = string.Empty;
            //DescriptionTextField.Value = string.Empty;
        }


    }
}