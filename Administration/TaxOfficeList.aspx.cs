using System;
using TAAPs.Model;

namespace TAAPs.Administration
{
    public partial class TaxOfficeList : AccessPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "TaxOfficeId" && ASPxGridView1.IsNewRowEditing)
            {
                e.Editor.ReadOnly = false;
            }
        }

        protected void ASPxGridView1_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.InnerException.ToString();
        }
    }
}