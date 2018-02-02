using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using TAAPs.Model;

namespace TAAPs.Collections
{
    public partial class TaxReceipts : AccessPage
    {
        TAAPsDBContext context = new TAAPsDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {  }
        }

        protected void ASPxbtnGenerate_Click(object sender, EventArgs e)
        {
            string[] _paymentDetailFields = new string[] {"payment_reference", 
                                                           "payment_amount", 
                                                           "payment_log_date",
                                                           "cust_name", 
                                                           "cust_address", 
                                                            "cust_number", 
                                                            "Type",                                                           
                                                            "from_assess_month", 
                                                            "to_assess_month",
                                                            "BankName", 
                                                            "bank_branch", 
                                                            "TaxOfficeName", 
                                                            "schedule_reference"                                                        
            };

                List<object> fieldValues = ASPxgvPayments.GetSelectedFieldValues(_paymentDetailFields);
                foreach (object[] item in fieldValues)
                {
                    context.GenerateReceipt("RCR_" + item[0],
                                                    item[0].ToString(),
                                                    decimal.Parse(item[1].ToString()),
                                                    DateTime.Parse(item[2].ToString()),
                                                    item[3].ToString(),
                                                    item[4].ToString(),
                                                    item[5].ToString(),
                                                    item[6].ToString(),
                                                    item[7].ToString(),
                                                    item[8].ToString(),
                                                    item[9].ToString(),
                                                    item[10].ToString(),
                                                    Session["UserName"].ToString(), 
                                                    item[11].ToString(),
                                                    item[12].ToString()
                                    );
                }

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Receipt Generation Successful.')", true);
        }

        protected void sqldsPayments_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Cancel = ASPxgvPayments.FilterExpression == string.Empty;

        }

        protected void ASPxgvPayments_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "SNo")
            {
                e.Value = e.ListSourceRowIndex + 1;
            }
        }
    }
}