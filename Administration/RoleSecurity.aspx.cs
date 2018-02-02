using System;
using System.Linq;
using TAAPs.Model;
using DevExpress.Web;

namespace TAAPs.Administration
{
    public partial class RoleSecurity : AccessPage
    {
        public TAAPsDBContext context = new TAAPsDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack || !IsCallback)
            {
                //LoadRoleResources();
            }
        }

        private void LoadModules()
        {
            var value = from r in context.Resources
                        where r.ResourceType == "Mod"
                        select new {ResourceId = r.ResourceId,
                                    ResourceName = context.DecryptData(r.ResourceName)};

        }

        protected void ASPxbtnSaveRolePermissions_Click(object sender, EventArgs e)
        {
            int _roleId = int.Parse(ASPxcbRoles.SelectedItem.Value.ToString());

            var _resources = context.RoleResources.Where(r => r.RoleId == _roleId);
            context.RoleResources.RemoveRange(_resources);
           // context.SaveChanges();

            foreach (var item in aspxChklResourses.SelectedValues)
            {
                context.RoleResources.Add(new RoleResource { RoleId = _roleId, ResourceId = int.Parse(item.ToString()) });
                
            }
            context.SaveChanges();
        }

        protected void ASPxcbRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            aspxChklResourses.UnselectAll();
            
            int _roleId = int.Parse(ASPxcbRoles.SelectedItem.Value.ToString());
            var _resources = context.RoleResources.Where(r => r.RoleId == _roleId);

            foreach (RoleResource item in _resources)
            {
                aspxChklResourses.Items.FindByValue(item.ResourceId).Selected = true;
            }
        }
    }
}