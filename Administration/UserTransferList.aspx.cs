using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.Data;
using TAAPs.Model;

namespace TAAPs.Administration
{
    public partial class UserTransferList : AccessPage
    {
        TAAPsDBContext _context = new TAAPsDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxPopupControl1_WindowCallback(object source, DevExpress.Web.PopupWindowCallbackArgs e)
        {
            string key = e.Parameter;
            Session["TransferUser"] = key;
        }

        protected void ASPxgvUsers_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            ASPxgvUsers.DataBind();
        }

        protected void ASPxgvTransfers_InitNewRow(object sender, ASPxDataInitNewRowEventArgs e)
        {
            string name = Session["TransferUser"].ToString();
            string createdby = Session["UserName"].ToString();

            var user = _context.Users.Where(u => u.UserName == name).Single();

            e.NewValues["FromTaxOfficeId"] = user.TaxOfficeId;
            e.NewValues["CreatedBy"] = user.TaxOfficeId;
        }

        protected void ASPxgvTransfers_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        protected void ASPxgvTransfers_RowInserted(object sender, ASPxDataInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                ((ASPxGridView)sender).JSProperties["cpIsInserted"] = true;
            }
        }

        protected void ASPxgvTransfers_CancelRowEditing(object sender, ASPxStartRowEditingEventArgs e)
        {
            ((ASPxGridView)sender).JSProperties["cpIsCancelled"] = true;
        }      
    }
}