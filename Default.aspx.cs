using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using TAAPs.Model;

namespace TAAPs
{
    public partial class Default : System.Web.UI.Page
    {
        TAAPsDBContext context = new TAAPsDBContext();
        public List<RoleResource> _resources = new List<RoleResource>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            else
            {
                // User _user = (User)(Session["User"]);
                int _roleId = Global.SessionUser.RoleId; //_user.RoleId;
                LoadResources(_roleId);
            }
        }

        private void LoadResources(int RoleId)
        {

            var value = from r in context.RoleResources
                        where r.RoleId == RoleId
                        select r;

            _resources = value.ToList();                  
        }      
    }  
}
