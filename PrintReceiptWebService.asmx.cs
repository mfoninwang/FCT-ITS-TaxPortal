using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Web;
using System.Web.Services;
using FIRSBusinessLayer;
using System.Data.SqlClient;

using Microsoft.ApplicationBlocks.Data;

namespace TAAPs
{
	/// <summary>
	/// Summary description for PrintReceiptWebService.
	/// </summary>
	public class PrintReceiptWebService : System.Web.Services.WebService
	{
		public PrintReceiptWebService()
		{
			//CODEGEN: This call is required by the ASP.NET Web Services Designer
			InitializeComponent();
		}

		#region Component Designer generated code
		
		//Required by the Web Services Designer 
		private IContainer components = null;
				
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if(disposing && components != null)
			{
				components.Dispose();
			}
			base.Dispose(disposing);		
		}
		
		#endregion

		// WEB SERVICE EXAMPLE
		// The HelloWorld() example service returns the string Hello World
		// To build, uncomment the following lines then save and build the project
		// To test this web service, press F5

		[WebMethod]
		public string HelloWorld()
		{
			return "Hello World";
		}

		[WebMethod]
		public string getPaymentMethod()
		{
			string Payment =" ";
			
			SqlDataReader reader;
			
			try
			{
				if (Report.GetPaymentMethodList(out reader))
				{
					int i = 0;
					while (reader.Read())
					{
						if(i==0)Payment += reader.GetString(1).ToString() + ","  + reader.GetInt32(0).ToString();
						else Payment += "#;#" + reader.GetString(1).ToString() + ","  + reader.GetInt32(0).ToString();
						++i;
					}
					
					reader.Close();
				}
			}
			catch (Exception ex)
			{
				return "error " + ex;
				
			}
			return Payment;
		}
		
        [WebMethod]
		public string GetTaxTypes()
		{
			string taxcollected="";
			SqlDataReader reader;
			ArrayList list=new ArrayList();
			
			try
			{
				
			
				int i=0;
				if (Tax.GetAllTaxType(out reader))
				{
					while(reader.Read())
					{
						if(i==0)taxcollected += reader.GetString(1).ToString() + ","  + reader.GetString(0).ToString();
						else taxcollected += "#;#" + reader.GetString(1).ToString() + ","+ reader.GetString(0).ToString();

						++i;
					}
					reader.Close();
				}
			}
				
			catch (Exception ex)
			{
				return "error " + ex;
			}

			return taxcollected;
		}

		[WebMethod]
		public string GetBank()
		{
			string banks=" ";
			SqlDataReader reader;
			
			try
			{
				int i=0;
				if (Report.GetBankList(out reader))
				{
					while(reader.Read())
					{
						if(i==0)banks += reader.GetString(1).ToString() + ","  + reader.GetInt32(0).ToString();
						else banks += "#;#" + reader.GetString(1).ToString() + ","  + reader.GetInt32(0).ToString();
						++i;
					}
					
					reader.Close();
				}
			}
			catch (Exception ex)
			{
				return "error " + ex;
			}
			return banks;
		}
		
		[WebMethod]
		public string GetRegions_LTO(string Location)
		{
			string Region="";
			
			SqlDataReader reader;

			try
			{
				int i=0;
				if (TaxOffice.GetAllRTO(out reader))
				{
					while(reader.Read())
					{
						if(i==0)Region += reader.GetString(1).ToString() + "," + reader.GetString(0);
						else Region += "#;#" + reader.GetString(1).ToString() + "," + reader.GetString(0);
						++i;
					}
					
					reader.Close();
				}
			}
			catch (Exception ex)
			{
				return "error " + ex;
				
			}
			return Region;
		
		}
		
        [WebMethod]
		public string GetITO(string rtoID)
		{
			string ITO="";
			SqlDataReader reader;
			
			try
			{
				//this.ddITO.Items.Clear();
				//this.ddITO.Items.Add(new ListItem("ALL ITOs/LTOs", "0"));
				int i=0;
				if (TaxOffice.GetITOByRTO(out reader,rtoID))
				{
					while(reader.Read())
					{
						if(i==0)ITO += reader.GetString(1).ToString() + "," + reader.GetString(0);
						else ITO += "#;#" + reader.GetString(1).ToString() + "," + reader.GetString(0);
						++i;
					
						
					}
					
					reader.Close();
				}
			}
			catch (Exception ex)
			{
				return "error " + ex;
				//FIRSConfigSettings.logErrorMessage(p.Identity.Name,ex.Message,this.lblModule.Text);
				//this.DisplayFailureMessage("Sorry, an Error occurred, please contact the System Administrator.");
			}
			return ITO;
		}

		[WebMethod]
		public string GetRevenueCollectorReceipts(String userName)
		{
			string RCR="";
			SqlDataReader reader;
			SqlParameter[] parameterValues = new SqlParameter[1];
			try
			{
				parameterValues[0] = new SqlParameter("@UserName",userName);
				reader = SqlHelper.ExecuteReader(FIRSBusinessLayer.FIRSConfigSettings.ConnectionStrings, CommandType.StoredProcedure, "GetRevenueCollectorReceipts",parameterValues);
				int i=0;
				if(!reader.HasRows)return null;
				while(reader.Read())
				{
                    if (i == 0) RCR += reader["receivedFrom"].ToString() + "~" +
                                reader["address"].ToString() + "~" + 
								reader["tin"].ToString()+ "~" + 
								reader["taxtype"].ToString()+ "~" +
                                reader["amount"].ToString() + "~" +
                                reader["amountInWords"].ToString() + "~" +
                                reader["periodFrom"].ToString() + "~" +
                                reader["periodTo"].ToString() + "~" +
                                reader["bank"].ToString() + "~" +
                                reader["bankBranch"].ToString() + "~" +
                                reader["reference"].ToString() + "~" +
                                reader["paymentDate"].ToString() + "~" +
                                reader["IssuingOfficer"].ToString() + "~" +
                                reader["irNumber"].ToString() + "~" +
                                reader["taxOfficer"].ToString() + "~" +
                                reader["hasCreditNote"].ToString(); 
										
					else RCR += "#;#" +
                             reader["receivedFrom"].ToString() + "~" +
                                reader["address"].ToString() + "~" +
                                reader["tin"].ToString() + "~" +
                                reader["taxtype"].ToString() + "~" +
                                reader["amount"].ToString() + "~" +
                                reader["amountInWords"].ToString() + "~" +
                                reader["periodFrom"].ToString() + "~" +
                                reader["periodTo"].ToString() + "~" +
                                reader["bank"].ToString() + "~" +
                                reader["bankBranch"].ToString() + "~" +
                                reader["reference"].ToString() + "~" +
                                reader["paymentDate"].ToString() + "~" +
                                reader["IssuingOfficer"].ToString() + "~" +
                                reader["irNumber"].ToString() + "~" +
                                reader["taxOfficer"].ToString() + "~" +
                                reader["hasCreditNote"].ToString(); 						
					++i;	
				}
					
				reader.Close();
			}
			catch (Exception ex)
			{
				return "error " + ex;
				//FIRSConfigSettings.logErrorMessage(p.Identity.Name,ex.Message,this.lblModule.Text);
				//this.DisplayFailureMessage("Sorry, an Error occurred, please contact the System Administrator.");
			}
			return RCR;
		}

		[WebMethod]
		public string GetWHTCreditNote(String RevenueCollectorReceiptsReference)
		{
			string RCR="";
			SqlDataReader reader;
			SqlParameter[] parameterValues = new SqlParameter[1];
			try
			{
				parameterValues[0] = new SqlParameter("@ReceiptID","RCR_" + RevenueCollectorReceiptsReference);
				reader = SqlHelper.ExecuteReader(FIRSBusinessLayer.FIRSConfigSettings.ConnectionStrings, CommandType.StoredProcedure, "GetWHTCreditNote",parameterValues);
				int i=0;
				if(!reader.HasRows)return null;
				while(reader.Read())
				{
                    if (i == 0) RCR += reader["beneficiary_name"].ToString() + "~" +
                                reader["beneficiary_address"].ToString() + "~" +
                                reader["beneficiary_tax_number"].ToString() + "~" +
                                reader["wht_amt"].ToString() + "~" +
                                reader["amt_in_words"].ToString() + "~" +
                                reader["revenue_collector_receipt_id"].ToString() + "~" +
                                reader["wht_rate"].ToString() + "~" +
                                reader["transaction_description"].ToString() + "~" +
                                reader["contract_amount"].ToString() + "~" +
                                reader["credit_note_id"].ToString();  					
								
					else RCR += "#;#" +
                                reader["beneficiary_name"].ToString() + "~" +
                                reader["beneficiary_address"].ToString() + "~" +
                                reader["beneficiary_tax_number"].ToString() + "~" +
                                reader["wht_amt"].ToString() + "~" +
                                reader["amt_in_words"].ToString() + "~" +
                                reader["revenue_collector_receipt_id"].ToString() + "~" +
                                reader["wht_rate"].ToString() + "~" +
                                reader["transaction_description"].ToString() + "~" +
                                reader["contract_amount"].ToString() + "~" +
                                reader["credit_note_id"].ToString();  			
					++i;					
				}
					
				reader.Close();
				
			}
			catch (Exception ex)
			{
				return "error " + ex;
				//FIRSConfigSettings.logErrorMessage(p.Identity.Name,ex.Message,this.lblModule.Text);
				//this.DisplayFailureMessage("Sorry, an Error occurred, please contact the System Administrator.");
			}
			return RCR;
		}

		[WebMethod]
		public bool ChangeReceiptPrintStatus(String receiptId, String printeByUserName)
		{
			Receipt receipt = new Receipt(receiptId);
			if(receipt.ChangeReceiptPrintStatus(printeByUserName))
			{
				return true;
			}
			return false;
		}

		[WebMethod]
		public bool ChangeRevenuCollectorReceiptHasCreditNoteField(String receiptId, int newHasCreditNote)
		{
			Receipt receipt = new Receipt(receiptId);
			if(receipt.ChangeRevenuCollectorReceiptHasCreditNoteField(receiptId, newHasCreditNote))
			{
				return true;
			}
			return false;
		}

		[WebMethod]
		public String GetServerDate()
		{
				
				 
			return DateTime.Now.Day + "-" +DateTime.Now.Month + "-" + DateTime.Now.Year;
						
			
	
		}

        [WebMethod]
        public List<Payment> GetPayments(String userName)
        {
            SqlDataReader reader = null;
            SqlParameter[] parameterValues = new SqlParameter[1];

            List<Payment> payments = new List<Payment>();

            try
            {
                parameterValues[0] = new SqlParameter("@UserName", userName);
                reader = SqlHelper.ExecuteReader(FIRSBusinessLayer.FIRSConfigSettings.ConnectionStrings, CommandType.StoredProcedure, "GetRevenueCollectorReceipt", parameterValues);

                if (!reader.HasRows) return null;
                Payment payment;

                while (reader.Read())
                {
                    payment = new Payment();

                    payment.TaxpayerName = reader.GetValue(0).ToString();
                    payment.Address = reader.GetValue(1).ToString();
                    payment.TIN = reader.GetValue(2).ToString();
                    payment.TaxType = reader.GetValue(3).ToString();
                    payment.Amount = reader.GetDecimal(4);
                    payment.AmountInWords = reader.GetValue(5).ToString();
                    payment.PeriodCoveredFrom = reader.GetValue(6).ToString();
                    payment.PeriodCoveredTo = reader.GetValue(7).ToString();
                    payment.Bank = reader.GetValue(8).ToString();
                    payment.BankBranch = reader.GetValue(9).ToString();
                    payment.PaymentReference = reader.GetValue(10).ToString();
                    payment.PaymentDate = reader[11].ToString();
                    payment.IssuingOfficer = reader.GetValue(12).ToString();
                    payment.IrNumber = reader.GetValue(13).ToString();
                    payment.TaxOfficer = reader.GetValue(14).ToString();
                    if (reader.GetValue(15).Equals(1))
                    {
                        payment.HasCreditNote = true;
                    }
                    else
                    {
                        payment.HasCreditNote = false;
                    }

                    payments.Add(payment);
                }

                reader.Close();

                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return payments;
        }

        [WebMethod]
        public List<Receipt> GetReceipts(String paymentReference)
        {
            SqlDataReader reader;
            SqlParameter[] parameterValues = new SqlParameter[1];

            List<Receipt> receipts = new List<Receipt>();

            try
            {
                parameterValues[0] = new SqlParameter("@ReceiptID", "RCR_" + paymentReference);
                reader = SqlHelper.ExecuteReader(FIRSBusinessLayer.FIRSConfigSettings.ConnectionStrings, CommandType.StoredProcedure, "GetWHTCreditNote", parameterValues);

                if (!reader.HasRows) return null;
                Receipt receipt;

                while (reader.Read())
                {
                    receipt = new Receipt();

                    receipt.TaxpayerName = reader.GetValue(0).ToString();
                    receipt.TaxpayerAddress = reader.GetValue(1).ToString();
                    receipt.TIN = reader.GetValue(2).ToString();
                    receipt.Amount = double.Parse( reader.GetValue(3).ToString());
                    receipt.AmountInWords = reader.GetValue(4).ToString();
                    receipt.Reference = reader.GetValue(5).ToString();
                    receipt.WHTRate = float.Parse(reader.GetValue(6).ToString());
                    receipt.TransactionDescription = reader.GetValue(7).ToString();
                    receipt.ContractAmount = float.Parse(reader.GetValue(8).ToString());
                    
                    // payment. HasCreditNote =  reader.GetBoolean(14);

                    receipts.Add(receipt);
                }

                reader.Close();

                return receipts;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }



	}
}
