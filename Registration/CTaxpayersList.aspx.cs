using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Utils;
using TAAPs.Model;

namespace TAAPs.Registration
{
    public partial class CTaxpayersList : AccessPage
    {
        OrderedDictionary newValues;
        ASPxComboBox ASPxComboBoxLga;

        private static string _action;
        private string _taxofficeId;
        static string _FileName;
        static string _FileType;
        static byte[] _FileContent;
        TAAPsDBContext _context = new TAAPsDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsCallback)
            {
                _action = Request.QueryString["Action"].ToString();
                _taxofficeId = Session["TaxOfficeId"] == null ? string.Empty : Session["TaxOfficeId"].ToString();

                switch (_action)
                {
                    case "Lookup":
                        ASPxgvCTaxpayers.DataSourceID = "esmdsCTaxpayers";
                        break;
                    case "Transfer":
                        ASPxgvCTaxpayers.DataSourceID = "esmdsCTaxpayers";
                        break;
                    case "Edit":
                        ASPxgvCTaxpayers.DataSourceID = "edsCTaxpayers";
                        ASPxgvCTaxpayers.Columns[6].Visible = false;
                        break;
                    default:
                        break;
                }

                ASPxgvCTaxpayers.DataBind();
            }
            else
            {
                Thread.Sleep(500);
            }

        }

        protected void ASPxPopupControl1_WindowCallback(object source, DevExpress.Web.PopupWindowCallbackArgs e)
        {
            string key = e.Parameter;

            Session["CTIN"] = key;
        }

        protected void ASPxgvCTaxpayers_CustomButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCustomButtonEventArgs e)
        {
            e.Visible = DefaultBoolean.False;

            if (e.CellType == GridViewTableCommandCellType.Filter)
                return;

            if (e.ButtonID == "btnTransfer" && _action == "Transfer")
                e.Visible = DefaultBoolean.True;
            else if (e.ButtonID == "btnBranches" && _action == "Edit")
                e.Visible = DefaultBoolean.True;
        }

        protected void esmdsCTaxpayers_Selecting(object sender, DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs e)
        {
            e.QueryableSource = from t in _context.CorporateBranches
                                select new
                                {
                                    TIN = t.BranchTIN,
                                    NewTIN = t.NewTIN,
                                    RCNo = t.CorporateTaxpayer.RCNo,
                                    CompanyName = t.BranchName,
                                    BusLine = t.CorporateTaxpayer.BusLine,
                                    TaxOfficeName = t.TaxOffice.TaxOfficeName
                                };
                                
            e.KeyExpression = "TIN";

           // if (string.IsNullOrEmpty(ASPxgvCTaxpayers.FilterExpression)) e.QueryableSource=null;
        }

        protected void edsCTaxpayers_Selecting(object sender, EntityDataSourceSelectingEventArgs e)
        {
            e.Cancel = ASPxgvCTaxpayers.FilterExpression == string.Empty;
        }

        protected void ASPxgvCTaxpayers_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == ColumnCommandButtonType.ApplyFilter ||
                    e.ButtonType == ColumnCommandButtonType.Update ||
                    e.ButtonType == ColumnCommandButtonType.Cancel ||
                    e.ButtonType == ColumnCommandButtonType.ClearFilter)
                return;

            e.Visible = false;

            if (e.ButtonType == ColumnCommandButtonType.Edit && _action == "Edit")
                e.Visible = true;
        }

        protected void ASPxGridViewTransfers_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        protected void ASPxGridViewTransfers_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            string tin = Session["CTIN"].ToString();

            var payer = _context.CorporateBranches.Where(t => t.BranchTIN == tin).Single();
            e.NewValues["FromTaxOfficeId"] = payer.TaxOfficeId;           
        }

        protected void ASPxgvCTaxpayers_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            this.newValues = e.NewValues;
            PopulateNewValues();
        }

        private void PopulateNewValues()
        {
            ASPxFormLayout formLayout = (ASPxFormLayout)ASPxgvCTaxpayers.FindEditFormTemplateControl("formLayout");
            formLayout.ForEach(ProcessItem);
        }

        private void ProcessItem(LayoutItemBase item)
        {
            LayoutItem layoutItem = item as LayoutItem;
            if (layoutItem != null)
            {
                ASPxEditBase editBase = layoutItem.GetNestedControl() as ASPxEditBase;
                if (editBase != null)
                    this.newValues[layoutItem.FieldName] = editBase.Value;
            }
        }

        protected void ASPxgvCTaxpayers_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        protected void ASPxGridViewTransfers_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                ((ASPxGridView)sender).JSProperties["cpIsInserted"] = true;
            }
        }

        protected void ASPxGridViewTransfers_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            ((ASPxGridView)sender).JSProperties["cpIsCancelled"] = true;
        }

        protected void ASPxGridViewRepresentatives_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        protected void ASPxgvBranches_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            this.newValues = e.NewValues;

            ASPxFormLayout formLayout = (ASPxFormLayout)ASPxgvBranches.FindEditFormTemplateControl("BranchFormLayout");
            formLayout.ForEach(ProcessItem);
        }

        protected void ASPxgvBranches_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        protected void ASPxComboBoxLga_Load(object sender, EventArgs e)
        {
            ASPxComboBoxLga = (ASPxComboBox)sender;
        }

        protected void ASPxComboBoxLga_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if (string.IsNullOrEmpty(e.Parameter)) return;

            edsLgas.WhereParameters[0].DefaultValue = e.Parameter;
            ASPxComboBoxLga.DataBind();
        }

        protected void ASPxGridViewBanks_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        protected void ASPxgvCTaxpayers_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            Session["CTIN"] = e.EditingKeyValue.ToString();
        }

        protected void ASPxgvCTaxpayers_HtmlEditFormCreated(object sender, ASPxGridViewEditFormEventArgs e)
        {
            (e.EditForm.NamingContainer as DevExpress.Web.Rendering.GridViewEditFormPopup).ShowPageScrollbarWhenModal = true;  
        }

        protected void gridAttachments_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        protected void gridAttachments_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["FileId"] = Guid.NewGuid();
            e.NewValues["TIN"] = Session["CTIN"].ToString();
            e.NewValues["FileName"] = _FileName;
            e.NewValues["FileType"] = _FileType;
            e.NewValues["FileContent"] = _FileContent;
            e.NewValues["CreatedBy"] = Global.SessionUser.UserName;
            e.NewValues["CreateDate"] = DateTime.Now;
        }
        protected void ucUploadFile_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            if (e.UploadedFile != null)
            {
                _FileName = e.UploadedFile.FileName;
                _FileType = e.UploadedFile.ContentType;
                _FileContent = e.UploadedFile.FileBytes;
            }
        }

        protected void btnButtton_Click(object sender, EventArgs e)
        {
            Guid _fileId = Guid.Parse((sender as ASPxButton).CommandArgument);
            using (_context)
            {
                var v = _context.CTaxpayerFiles.Where(a => a.FileId.Equals(_fileId)).Single();
                if (v != null)

                {
                    byte[] filedata = v.FileContent;
                    string _filename = v.FileName;

                    Response.AddHeader("Content-type", v.FileType);
                    Response.AddHeader("Content-Disposition", "attachment;  filename=" + _filename);

                    byte[] dataBlock = new byte[0x1000];
                    long fileSize;
                    int bytesRead;
                    long totalBytesRead = 0;

                    using (Stream st = new MemoryStream(filedata))
                    {
                        fileSize = st.Length;
                        while (totalBytesRead < fileSize)
                        {
                            if (Response.IsClientConnected)
                            {
                                bytesRead = st.Read(dataBlock, 0, dataBlock.Length);
                                Response.OutputStream.Write(dataBlock, 0, bytesRead);

                                Response.Flush();
                                totalBytesRead += bytesRead;
                            }
                        }

                        Response.End();
                    }
                }
            }
        }

    }
}