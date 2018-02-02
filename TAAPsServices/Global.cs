using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net.Configuration;
using System.Net;

namespace TAAPsServices
{
    class Global
    {
        string mailserver, mailuser, mailuserpwd, conString, sender;
            int port;

        public static void LogMessage(string source, string message)
        {
            string con = Properties.Settings.Default.TAAPsCon;

            SqlConnection cn = new SqlConnection(con);
            string cmdText = string.Format("insert into NotificationsLog(LogType, LogDescription) Values( '{0}', '{1}')", source, message);

            SqlCommand cmd = new SqlCommand(cmdText, cn);
            cn.Open();

            cmd.ExecuteNonQuery();
        }

        public Global()
        {
            string cmdText = "select * from Tenants where TenantId = 'OIRS'";
            conString = Properties.Settings.Default.TAAPsCon;

            SqlConnection cn = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand(cmdText, cn);

            cn.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();

            mailserver = reader["EmailServer"].ToString();
            mailuser = reader["EmailUser"].ToString();
            mailuserpwd = reader["EmailUserPassword"].ToString();
            sender = reader["EmailSender"].ToString();
            port = int.Parse( reader["EmailServerPort"].ToString());


            reader.Close();
            cn.Close();
        }

        public string MailServer
        {
            get
            {
                return mailserver;
            }
        }

        public string MailUser
        {
            get
            {
                return mailuser;
            }
        }

        public string MailUserPassword
        {
            get
            {
                return mailuserpwd;
            }
        }

        public string EmailSender
        {
            get
            {
                return sender;
            }
        }

        public int EmailServerPort
        {
            get
            {
                return port;
            }
        }

        public void SendMail(string Recipient, string Subject, Attachment Atttachment)
        {
            SmtpClient SmtpMail = new SmtpClient();

            SmtpMail.Host = mailserver;
            SmtpMail.Port = port;
            SmtpMail.EnableSsl = true;
            SmtpMail.Credentials = new NetworkCredential(mailuser, mailuserpwd);

            MailMessage mail = new MailMessage(sender, Recipient)
            {
                IsBodyHtml = true,
                Subject = Subject,
                Body = "Your TIN Certificate is attached"
            };

            mail.Attachments.Add(Atttachment);

            SmtpMail.Send(mail);
        }
    }
}
