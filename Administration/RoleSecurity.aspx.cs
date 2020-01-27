using System;
using System.Web.UI;
using System.Linq;
using TAAPs.Model;
using DevExpress.Web;

namespace TAAPs.Administration
{
    public partial class RoleSecurity : AccessPage
    {
        public TAAPsDBContext context = new TAAPsDBContext();
        private static int moduleId, roleId;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private void LoadModules()
        {
            var value = from r in context.Resources
                        where r.ResourceType == "Mod"
                        select new { r.ResourceId,
                                    ResourceName = context.DecryptData(r.ResourceName)};
        }

        protected void ASPxbtnSaveRolePermissions_Click(object sender, EventArgs e)
        {
            var resources = context.RoleResources
                .Where(r => r.RoleId == roleId && r.Resource.ParentId == moduleId);

            context.RoleResources.RemoveRange(resources);
            context.SaveChanges();

            foreach (var item in ASPxCblRoleResources.SelectedValues)
            {
                context.RoleResources.Add(new RoleResource { RoleId = roleId, ResourceId = int.Parse(item.ToString()) });            
            }
            context.SaveChanges();
        }

        protected void ASPxcbRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateCheckItems();
        }

        private void UpdateCheckItems()
        {
            if (ASPxModules.SelectedIndex == -1 || ASPxcbRoles.SelectedIndex == -1) return;

            moduleId = int.Parse(ASPxModules.SelectedItem.Value.ToString());
            roleId = int.Parse(ASPxcbRoles.SelectedItem.Value.ToString());

            var moduleItems = context.Resources
               .Where(i => i.ParentId == moduleId);

            ASPxCblRoleResources.DataSource = moduleItems.ToList();
            ASPxCblRoleResources.DataBind();

            var resources = context.RoleResources                   
                .Where(r => r.RoleId == roleId && r.Resource.ParentId == moduleId);

            foreach (ListEditItem checkitem in ASPxCblRoleResources.Items)
            {
                int val = int.Parse(checkitem.Value.ToString());

                checkitem.Selected = resources.Any(r => r.ResourceId == val) ? true : false;
            }
        }

        protected void ASPxModules_SelectedIndexChanged(object sender, EventArgs e)
        {         
            UpdateCheckItems();
        }
    }
}