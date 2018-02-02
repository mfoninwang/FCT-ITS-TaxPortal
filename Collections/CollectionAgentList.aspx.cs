using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TAAPs.Collections
{
    public partial class CollectionAgentList : AccessPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void aspxgvAgents_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        protected void aspxgvAgents_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "AgentId" && aspxgvAgents.IsNewRowEditing)
            {
                e.Editor.ReadOnly = false;
            }
        }
    }
}