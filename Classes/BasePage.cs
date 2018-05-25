using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TAAPs.Model;
using System.Web.Script.Serialization;
using System.Web.UI;

namespace TAAPs
{
    public class BasePage : Page
    {


        public void DisplayAlert(string type, string message)
        {
            string alertString = string.Concat("alert('", message, "')");
            ClientScript.RegisterStartupScript(this.GetType(), "ClientScript1", alertString, true);
        }

        public void DisplayAlert(string type, string title, string message)
        {
            ClientScript.RegisterStartupScript(GetType(), "ClientScript1", "ShowDialog('" + type +"','" + title + "','" + message +"')", true);
        }

        protected override void OnError(EventArgs e)
        {
            Exception ex = Server.GetLastError();
            DisplayAlert("Danger", title: "Page Error", message: ex.Message);

            // Clear the error from the server.
            Server.ClearError();
        }
    }
}