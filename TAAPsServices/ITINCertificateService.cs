using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Net.Mail;
using System.Net.Configuration;
using System.Net;
using System.Threading.Tasks;

namespace TAAPsServices
{
    public partial class ITINCertificateService : ServiceBase
    {
        //Properties.Settings["TAAPsCon"]
        System.Timers.Timer timer = new System.Timers.Timer();
        //SmtpClient SmtpMail = new SmtpClient();

        public ITINCertificateService()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            Global.LogMessage("ITINCertificate Service", "Service Started Suucessfully");

            try
            {
                timer.Enabled = true;
                timer.Interval = 30000;
                timer.Elapsed += new System.Timers.ElapsedEventHandler(timer_Elapsed);
            }
            catch (Exception ex)
            {
                Global.LogMessage("ITINCertificate Service", "OnStart(): " + ex.Message);
                Stop();
            }

        }
        protected override void OnStop()
        {
            timer.Enabled = false;
        }

        protected void timer_Elapsed(object source, System.Timers.ElapsedEventArgs aa)
        {
            SendTINCertificate();
        }

        private void SendTINCertificate()
        {
            string cmdText = string.Format("select {0}, {1}  from ITINNotificationList", "TIN", "Email");
            string email, tin;

            string conString = Properties.Settings.Default.TAAPsCon;

            SqlConnection cn = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand(cmdText, cn);

            try
            {
                cn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    email = reader["Email"].ToString();
                    tin = reader["TIN"].ToString();

                    rptITINCertificate report = new rptITINCertificate();

                    // Obtain a parameter, and set its value.
                    report.Parameters[0].Value = tin;

                    MemoryStream mem = new MemoryStream();

                    report.ExportToPdf(mem);

                    // Create a new attachment and put the PDF report into it.
                    mem.Seek(0, System.IO.SeekOrigin.Begin);
                    Attachment att = new Attachment(mem, "TINCertificate.pdf", "application/pdf");

                    Global global = new Global();
                    global.SendMail(email, "TIN Certificate", att);

                    // Set taxpayer record to indicate that email notification was sent
                    UpdateTaxpayerRecord(tin);

                    // Close the memory stream.
                    mem.Close();
                    mem.Flush();
                }

                reader.Close();
                cn.Close();
            }
            catch (Exception ex)
            {
                Global.LogMessage("ITINCertificateService", "SendTINCertificate(): " + ex.ToString());
            }
        }

        private void UpdateTaxpayerRecord(string tin)
        {
            try
            {
                string conString = Properties.Settings.Default.TAAPsCon;
                string cmdText = String.Format("update {0} set {1} = 1 where {2} = '{3}'", "Itaxpayer", "EmailNotified", "TIN", tin);

                SqlConnection cn = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand(cmdText, cn);

                cn.Open();

                cmd.ExecuteNonQuery();

                cn.Close();
            }
            catch (Exception ex)
            {
                Global.LogMessage("ITINCertificateService", "UpdateTaxpayerRecord(): " + ex.ToString());
            }
        }

    }
}
