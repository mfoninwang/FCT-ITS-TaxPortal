using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TAAPs.Model;
using System.Web.Script.Serialization;
using System.Web.UI;

namespace TAAPs
{
    public class BasePage : System.Web.UI.Page
    {
        public void DisplayAlert(string message)
        {
            string alertString = string.Concat("alert('", message, "')");
            ClientScript.RegisterStartupScript(this.GetType(), "alert", alertString, true);
        }

        public void DisplayAlert(string message, string type)
        {
            //string alertString = string.Concat("alert('", message, "')");
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", alertString, true);

            var alert = new JavaScriptSerializer().Serialize(message);
            var script = string.Format("alert({0});", message);
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", script, true);

        }

        protected override void OnError(EventArgs e)
        {
            Exception Ex = Server.GetLastError();
            Server.ClearError();

            DisplayAlert(Ex.Message);
        }
    }
}