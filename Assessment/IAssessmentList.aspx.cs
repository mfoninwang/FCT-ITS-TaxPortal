using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.ASPxHtmlEditor;
using DevExpress.Web.Data;
using System.Collections.Specialized;
using TAAPs.Model;

namespace TAAPs.Assessment
{
    public partial class IAssessmentList : AccessPage
    {
        TAAPsDBContext _context = new TAAPsDBContext();
        static string _FileName;
        static string _FileType;
        static byte[] _FileContent;
        int newKey;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ASPxgvAssessments_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        protected void ASPxgvAssessments_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {         
            e.NewValues["CreateDate"] = DateTime.Now;
            e.NewValues["CreatedBy"] = Global.SessionUser.UserName;
        }

        protected void ASPxgvAssessments_StartRowEditing(object sender, ASPxStartRowEditingEventArgs e)
        {
            Session["IAssessmentId"] = e.EditingKeyValue.ToString();
        }

        protected void ASPxgvAssessments_HtmlEditFormCreated(object sender, ASPxGridViewEditFormEventArgs e)
        {
            //(e.EditForm.NamingContainer as DevExpress.Web.Rendering.GridViewEditFormPopup).ShowPageScrollbarWhenModal = true;  
        }

        protected void ASPxgvAssessments_InitNewRow(object sender, ASPxDataInitNewRowEventArgs e)
        {
            Session["IAssessmentId"] = null;
            ASPxgvAssessments.SettingsText.PopupEditFormCaption = "New Assessment";

            ASPxPageControl AspxPageControl1 = (ASPxPageControl)ASPxgvAssessments.FindEditFormTemplateControl("AspxPageControl1");

            AspxPageControl1.ActiveTabPage = AspxPageControl1.TabPages[0];
            foreach (TabPage tab in AspxPageControl1.TabPages)
            {
                tab.Enabled = tab.Index == 0 ? true : false;
            }
        } 

        protected void ASPxgvExclusions_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data)
                return;

            bool IsComputed = (bool)e.GetValue("TaxExclusion.IsComputed");

            if (IsComputed == true)
            {
                e.Row.Cells[2].Enabled = true;
                e.Row.Cells[2].BackColor = System.Drawing.Color.LightGray;
            }
        }

        protected void ASPxgvExclusions_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            ASPxGridView gridView = (ASPxGridView)sender;

            if (!gridView.IsNewRowEditing && "TaxExclusion.IsComputed".Equals(e.Column.FieldName))
            {
                //e.Editor.ReadOnly = !(bool) e.Editor.Value;

                if (e.Column.FieldName == "Amount")
                {
                    e.Editor.ReadOnly = !(bool)e.Editor.Value;
                }
            }
        }

        protected void gvAttachment_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            e.NewValues["FileId"] = Guid.NewGuid();
            e.NewValues["AssessmentId"] =  int.Parse(Session["IAssessmentId"].ToString());
            e.NewValues["FileName"] = _FileName;
            e.NewValues["FileType"] = _FileType;
            e.NewValues["FileContent"] = _FileContent;
            e.NewValues["CreatedBy"] = Global.SessionUser.UserName;
            e.NewValues["CreateDate"] = DateTime.Now;
        }

        protected void ucAttachFile_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            if (e.UploadedFile != null)
            {
                _FileName = e.UploadedFile.FileName;
                _FileType = e.UploadedFile.ContentType;
                _FileContent = e.UploadedFile.FileBytes;
            }
        }

        protected void btnFileDownload_Click(object sender, EventArgs e)
        {
            Guid _fileId = Guid.Parse((sender as ASPxButton).CommandArgument);
            using (_context)
            {
                var v = _context.IAssessmentFiles.Where(a => a.FileId.Equals(_fileId)).Single();
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

        protected void gvAttachment_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        protected void ASPxgvAssessments_RowInserted(object sender, ASPxDataInsertedEventArgs e)
        {

        }

        protected void ASPxgvAssessments_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            //if (e.CallbackName == "ADDNEWROW" || e.CallbackName == "STARTEDIT")
            //    Session["PreviousCommand"] = e.CallbackName;
            //if (e.CallbackName == "UPDATEEDIT" && (string)Session["PreviousCommand"] == "STARTEDIT")
            //    ASPxgvAssessments.StartEdit(ASPxgvAssessments.FocusedRowIndex);
        }

        protected void ASPxgvAssessments_DataBound(object sender, EventArgs e)
        {
            if (newKey > -1)
            {
                ASPxGridView g = sender as ASPxGridView;
                int rowIndex = g.FindVisibleIndexByKeyValue(newKey);
                g.StartEdit(rowIndex);
            }
        }

        protected void edsIAssessment_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            newKey = ((Model.IAssessment)e.Entity).AssessmentId;
        }

        protected void ASPxgvAssessments_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (ASPxgvAssessments.IsNewRowEditing) return;
                e.Editor.ReadOnly = true;
        }
    }
}