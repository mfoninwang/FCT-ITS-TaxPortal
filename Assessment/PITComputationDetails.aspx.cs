using System;
using TAAPs.Model;


namespace TAAPs.Assessment
{
    public partial class PITComputationDetails : System.Web.UI.Page
    {
        int year;
        decimal AccessibleIncome;

        public TAAPsDBContext context = new TAAPsDBContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            year = int.Parse(Request.QueryString["Year"]);
            AccessibleIncome = decimal.Parse(Request.QueryString["Income"]);

            var data = context.PITComputationDetails(AccessibleIncome, year);

            ASPxgvTaxDetails.DataSource = data;
            ASPxgvTaxDetails.DataBind();
        }
    }
}