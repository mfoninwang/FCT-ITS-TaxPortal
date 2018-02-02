using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TAAPs.Model;

namespace TAAPs
{
    public partial class Site : System.Web.UI.MasterPage
    {
        TAAPsDBContext context = new TAAPsDBContext();
        public List<Resource> _resources = new List<Resource>();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

    }
}