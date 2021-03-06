﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Utils;

namespace TAAPs.Collections
{
    public partial class ReversePrintedReceipts : AccessPage
    {
        ASPxGridView ASPxgvCreditNotes;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ASPxPopupControl1_WindowCallback(object source, DevExpress.Web.PopupWindowCallbackArgs e)
        {
            string key = e.Parameter;

            Session["ReceiptId"] = key;
            ASPxgvCreditNotes.DataBind();
        }

        protected void ASPxgvReceipts_Load(object sender, EventArgs e)
        {
            ASPxgvCreditNotes = (ASPxGridView)sender;
        }

        protected void ASPxgvReceipts_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
        {
            e.Visible = DefaultBoolean.False;

            if (e.CellType == GridViewTableCommandCellType.Filter)
                return;

            var _rowdata = ASPxgvReceipts.GetRowValues(e.VisibleIndex, "TaxType");

            if (e.ButtonID == "btnCreditNotes" && _rowdata != null)
            {
                string _taxType = _rowdata.ToString();
                e.Visible = _taxType == "Withholding Tax" ? DefaultBoolean.True : DefaultBoolean.False;
            }
        }

        protected void dsReceipts_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Cancel = ASPxgvReceipts.FilterExpression == string.Empty;
        }

        protected void ASPxgvReceipts_ProcessOnClickRowFilter(object sender, ASPxGridViewOnClickRowFilterEventArgs e)
        {
            if (string.IsNullOrEmpty(ASPxgvReceipts.FilterExpression.Trim()))
            { ASPxgvReceipts.DataSourceID = null; }
            else
            {
                ASPxgvReceipts.DataSourceID = "dsReceipts";

                ASPxgvReceipts.DataBind();
            }
        }

        protected void AspxrblStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            //foreach (var item in ASPxgvReceipts.GetSelectedFieldValues("PrintStatus")	)
            //{
            //    item[]
            //}    
               
        }
    }
}