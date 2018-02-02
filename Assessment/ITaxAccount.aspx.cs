using System;
using System.Drawing;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TAAPs.Assessment
{
    public partial class ITaxAccount : AccessPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxgvTaxAccounts_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            string str = this.ASPxgvTaxAccounts.GetRowValuesByKeyValue(e.EditingKeyValue, new string[] { "TIN" }).ToString();
            Session["AccountTIN"] = str;
            Session["TaxAccountNo"] = e.EditingKeyValue.ToString();
        }

        protected void ASPxgvTaxAccounts_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if ((e.DataColumn.FieldName == "Balance") && (Convert.ToDecimal(e.CellValue) < 0M))
            {
                e.Cell.ForeColor = Color.Red;
            }
        }

        protected void ASPxgvTaxAccounts_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.InnerException.ToString();
        }

        protected void ASPxgvTaxAccounts_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            this.Session["TaxAccountNo"] = null;
            this.Session["AccountTIN"] = null;
        }

        protected void ASPxgvTaxAccounts_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridViewEditFormEventArgs e)
        {
            (e.EditForm.NamingContainer as DevExpress.Web.Rendering.GridViewEditFormPopup).ShowPageScrollbarWhenModal = true;  
        }

        protected void ASPxgvTaxAccounts_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
        {
            if (ASPxgvTaxAccounts.IsNewRowEditing) return;
            if (e.Column.FieldName != "Status")
                e.Editor.ReadOnly = true;
        }
    }
}