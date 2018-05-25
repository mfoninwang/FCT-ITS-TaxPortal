using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using TAAPs.Model;
using System.Configuration;
using System.Data.SqlClient;
using DevExpress.DashboardWeb;
using DevExpress.DataAccess.ConnectionParameters;


namespace TAAPs
{
    public partial class Default : BasePage
    {
        static TAAPsDBContext context;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                context = new TAAPsDBContext();
            }

            if (Session["User"] == null)
            {
                Response.Redirect("~/SessionTimeout.aspx");
            }
        }

        protected void SubmitIssue_Click(object sender, EventArgs e)
        {
            IssueLog issue = new IssueLog()
            {
                Subject = SubjectTextField.Value,
                Description = DescriptionTextField.Value,
                Priority = PriorityField.Value,
                CreatedBy = (string)Session["UserName"],
                CreateDate=DateTime.Now,
                Status = "Open"
            };

            context.IssueLogs.Add(issue);
            context.SaveChanges();

            ResetForm();
        }

        private void ResetForm()
        {
            SubjectTextField.Value = string.Empty;
            DescriptionTextField.Value = string.Empty;
        }

    }  
}
