using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TAAPs.Model;

namespace TAAPs
{
    public partial class mainLayout : System.Web.UI.MasterPage
    {
        TAAPsDBContext context = new TAAPsDBContext();
        public List<RoleResource> _resources = new List<RoleResource>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                User _user = (User)Session["User"];

                int _roleId = _user.RoleId;
                LoadResources(_roleId);

                //    lblLoggedInUser.Text = string.Concat(_user.FirstName, " ", _user.LastName);
                //    lblUserTaxOffice.Text = string.Concat(_user.Role.RoleName, " - ", string.IsNullOrEmpty(_user.TaxOfficeId) ? _user.TaxOfficeRegion.RegionName : _user.TaxOffice.TaxOfficeName);
            }
        }

        private void LoadResources(int RoleId)
        {

            var value = from r in context.RoleResources
                        where r.RoleId == RoleId && r.Resource.Url != null
                        select r;

            _resources = value.ToList();
        }

        protected void Logout_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/index.aspx");
        }

    }
}