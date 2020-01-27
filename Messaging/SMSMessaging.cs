using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using OneApi.Client.Impl;
using OneApi.Config;
using OneApi.Model;
using OneApi.Exceptions;
using log4net;
using TAAPs.Model;


namespace TAAPs.Messaging
{
    public class SMSMessaging
    {
        public static string SendSMS(string recipientPhone, string message)
        {
            string senderAddress = "KW-IRS";
            string username = "Compumetrics";
            string password = "Pa$$w0rd";

            Configuration configuration = new Configuration(username, password);
            SMSClient smsClient = new SMSClient(configuration);

            try
            {
                LoginResponse loginResponse = smsClient.CustomerProfileClient.Login();
                if (loginResponse.Verified == false)
                {
                    throw new Exception("SMS gateway user credentials is not verified!");
                }
            }
            catch (RequestException ex)
            {
                throw new Exception(ex.Message);
            }

            SMSRequest smsRequest = new SMSRequest(senderAddress, message, recipientPhone);

            // Store request id because we can later query for the delivery status with it:
            string requestId = smsClient.SmsMessagingClient.SendSMS(smsRequest).ToString();

            return requestId;
        }


        public static void SendGenericSms(string firstName, string lastName, string tin, string recipientPhone)
        {
            StringBuilder message = new StringBuilder()
              .AppendFormat("Dear {0} {1},\n", firstName, lastName)
              .AppendFormat("The Kwara Internal Revenue Service (FCT-IRS) has successfully ")
              .AppendFormat("validated your taxpayer details and issued you a Taxpayer Identification Number.\n")
              .AppendFormat("TIN: {0} \n", tin)
              .AppendFormat("Please quote this TIN in all communications with the FCT-IRS. Thank you \n")
              .AppendFormat("contactus@kwirs.gov.ng");

            try
            {
                string requestId = SMSMessaging.SendSMS(recipientPhone, message.ToString());

                ChangeSMSNotificationStatus(tin);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private static void ChangeSMSNotificationStatus(string tin)
        {
            TAAPsDBContext context = new TAAPsDBContext();

            var taxpayer = context.ITaxpayers.Single(t => t.TIN == tin);

            taxpayer.SMSNotified = true;
            context.SaveChanges();
        }
    }

}