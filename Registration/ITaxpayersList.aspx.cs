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
    public partial class ITaxpayersList : AccessPage
    {
        OrderedDictionary newValues;

        private static string _type;
        private string _taxofficeId;
        static string _FileName;
        static string _FileType;
        static byte[] _FileContent;
        TAAPsDBContext _context = new TAAPsDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsCallback)
            {
                _type = Request.QueryString["Type"].ToString();
                //_taxofficeId = Session["TaxOfficeId"] == null ? string.Empty : Session["TaxOfficeId"].ToString();

                _taxofficeId = Global.SessionUser.TaxOfficeId;

                switch (_type)
                {
                    case "Lookup":
                        ASPxGridView1.DataSourceID = "esmdsItaxpayers";
                        break;
                    case "Transfer":
                        ASPxGridView1.DataSourceID = "esmdsItaxpayers";
                        break;
                    case "Edit":
                        ASPxGridView1.DataSourceID = "edsItaxpayers";
                        break;
                    default:
                        break;
                }

                ASPxGridView1.DataBind();
            }
            else
            {
                Thread.Sleep(500);
            }
        }

        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            this.newValues = e.NewValues;
            PopulateNewValues();
        }

        private void PopulateNewValues()
        {
            ASPxFormLayout formLayout = (ASPxFormLayout)ASPxGridView1.FindEditFormTemplateControl("formLayout");
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

        protected void ASPxGridView1_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
        {

            e.Visible = DefaultBoolean.False;

            if (e.CellType == GridViewTableCommandCellType.Filter)
                return;

            if (e.ButtonID == "btnTransfer" && _type == "Transfer")
                e.Visible = DefaultBoolean.True;
        }

        protected void ASPxPopupControl1_WindowCallback(object source, DevExpress.Web.PopupWindowCallbackArgs e)
        {
            string key = e.Parameter;

            Session["ITIN"] = key;
        }

        protected void esmdsItaxpayers_Selecting(object sender, DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs e)
        {
            e.KeyExpression = "TIN";

            //if (ASPxGridView1.FilterExpression == string.Empty) ASPxGridView1.DataSourceID = null;
        }

        protected void ASPxGridView1_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ASPxGridView1.DataBind();
        }

        protected void edsITaxpayers_Selecting(object sender, EntityDataSourceSelectingEventArgs e)
        {
            e.Cancel = ASPxGridView1.FilterExpression == string.Empty;
        }

        protected void ASPxGridView1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == ColumnCommandButtonType.ApplyFilter ||
                e.ButtonType == ColumnCommandButtonType.Update ||
                e.ButtonType == ColumnCommandButtonType.Cancel ||
                e.ButtonType == ColumnCommandButtonType.ClearFilter)
                return;

            e.Visible = false;

            if (e.ButtonType == ColumnCommandButtonType.Edit && _type == "Edit")
                e.Visible = true;
        }

        protected void ASPxGridViewTransfers_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.InnerException.ToString();
        }

        protected void ASPxGridViewTransfers_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            string tin = Session["ITIN"].ToString();

            var payer = _context.ITaxpayers.Where(t => t.TIN == tin).Single();

            e.NewValues["FromTaxOfficeId"] = payer.TaxOfficeID;
        }

        protected void ASPxGridView1_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        protected void ASPxGridViewRepresentatives_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
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

        private void FilterASPxGridView1()
        {
            if (ASPxGridView1.FilterExpression == string.Empty) ASPxGridView1.DataSourceID = null;
            else
            {
                ASPxGridView1.DataSourceID = _type == "Edit" ? "edsItaxpayers" : "esmdsItaxpayers";
            }

            ASPxGridView1.DataBind();
        }

        protected void ASPxGridView1_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            Session["ITIN"] = e.EditingKeyValue.ToString();
        }

        protected void ASPxGridView1_HtmlEditFormCreated(object sender, ASPxGridViewEditFormEventArgs e)
        {
            (e.EditForm.NamingContainer as DevExpress.Web.Rendering.GridViewEditFormPopup).ShowPageScrollbarWhenModal = true;
        }

        protected void gridAttachments_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        protected void ucUploadFile_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            //ASPxUploadControl ucUploadFile = (ASPxUploadControl)sender;

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
                var v = _context.ITaxpayerFiles.Where(a => a.FileId.Equals(_fileId)).Single();
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

        protected void gridAttachments_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["FileId"] = Guid.NewGuid();
            e.NewValues["TIN"] = Session["ITIN"].ToString();
            e.NewValues["FileName"] = _FileName;
            e.NewValues["FileType"] = _FileType;
            e.NewValues["FileContent"] = _FileContent;
            //e.NewValues["CreatedBy"] = Global.SessionUser.UserName;
            e.NewValues["CreateDate"] = DateTime.Now;
        }
    }

}
