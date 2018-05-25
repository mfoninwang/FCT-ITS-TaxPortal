using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using TAAPs.Model;
using DevExpress.Web;

namespace TAAPs.Assessment
{

    public partial class IAssessment : AccessPage
    {
        static string _FileName;
        static string _FileType;
        static byte[] _FileContent;

        TAAPsDBContext _context = new TAAPsDBContext();
        static Boolean IsNew;
        Model.IAssessment _Iassessment = new Model.IAssessment();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               ASPxPageControl1.ActiveTabPage = ASPxPageControl1.TabPages[0];

                ASPxFormLayout1.ForEach(ClearItem);
                SetTabEnableProperty(false);

                IsNew = true;
            }
        }

        private void ClearItem(LayoutItemBase item)
        {
            if (item is LayoutItem layoutItem)
            {
                if (layoutItem.GetNestedControl() is ASPxEditBase editBase)
                {
                    editBase.Value = string.Empty;
                }
            }
        }
       
        protected void ASPxFormLayout1_DataBound(object sender, EventArgs e)
        {
            ASPxFormLayout1.ForEach(ClearItem);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsNew == true) { CreateAssessmentRecord(); }
                else { UpdateAssessmentRecord(); }

                SetTabEnableProperty(true);
                LoadChildRecords();
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                DisplayAlert("Danger", "Assessment" ,ex.Message);
            }
        }

        private void UpdateAssessmentRecord()
        {
            int Id = int.Parse(ASPxTextAssessmentNo.Text);
            _Iassessment = _context.IAssessments.Single(i=>i.AssessmentId==Id);

            this.SetAssessmentValues();

            _context.SaveChanges();

            DisplayAlert("Success", "Assessment", "Assessment Record Updated Successfully.");
        }

        private void SetTabEnableProperty(bool value)
        {
            foreach (TabPage tab in ASPxPageControl1.TabPages)
            {
                tab.Enabled = tab.Index==0 ? true: value;
            }
        }

        protected void edsIAssessment_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            int newKey = ((Model.IAssessment)e.Entity).AssessmentId;
            ASPxTextAssessmentNo.Text = newKey.ToString();
        }

        private void LoadChildRecords()
        {
            ASPxTextAssesableIncome.Text = _Iassessment.AssessableIncome.ToString();
            ASPxTextExemptAmount.Text = _Iassessment.ExemptAmount.ToString();
            ASPxTextGrossIncome.Text = _Iassessment.GrossIncome.ToString();
            ASPxTextPayable.Text = _Iassessment.TaxPayable.ToString();

            string taxTypeId = _context.ITaxAccounts.Single(t => t.TaxAccountNo == _Iassessment.TaxAccountNo).TaxTypeId;

            edsAssessmentIncome.WhereParameters[0].DefaultValue = _Iassessment.AssessmentId.ToString();
            edsUnearnedIncome.WhereParameters[0].DefaultValue = _Iassessment.AssessmentId.ToString();
            edsAssessmentTradeIncome.WhereParameters[0].DefaultValue = _Iassessment.AssessmentId.ToString();
            edsExclusions.WhereParameters[0].DefaultValue = _Iassessment.AssessmentId.ToString();

            edsEarnedIncomes.WhereParameters[0].DefaultValue = taxTypeId;
            edsTaxExclusions.WhereParameters[0].DefaultValue = taxTypeId;
            edsTradeIncomes.WhereParameters[0].DefaultValue = taxTypeId;
            edsUnearnedTaxIncomes.WhereParameters[0].DefaultValue = taxTypeId;           
        }

        protected void ASPxButtonCancel_Click(object sender, EventArgs e)
        {
            
        }

        private void UpdateTaxFields()
        {
            ASPxTextAssesableIncome.Text = _Iassessment.AssessableIncome.ToString();
            ASPxTextExemptAmount.Text = _Iassessment.ExemptAmount.ToString();
            ASPxTextGrossIncome.Text = _Iassessment.GrossIncome.ToString();
            ASPxTextPayable.Text = _Iassessment.TaxPayable.ToString();
        }

        private void CreateAssessmentRecord()
        {

            SetAssessmentValues();

            _context.IAssessments.Add(_Iassessment);
            _context.SaveChanges();
            IsNew = false;

            DisplayAlert("Success", "Assessment","Assessment Record Created Successfully");

            ASPxTextAssessmentNo.Text = _Iassessment.AssessmentId.ToString();
            edsAttachments.WhereParameters[0].DefaultValue = ASPxTextAssessmentNo.Text;
            gvAttachment.DataBind();
        }

        private void SetAssessmentValues()
        {
            _Iassessment.TaxAccountNo = int.Parse(ASPxFormLayout1.GetNestedControlValueByFieldName("TaxAccountNo").ToString());
            _Iassessment.AssessmentYear = int.Parse(ASPxFormLayout1.GetNestedControlValueByFieldName("AssessmentYear").ToString());
            _Iassessment.FormNo = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("FormNo");
            _Iassessment.FormTitle = (string)ASPxFormLayout1.GetNestedControlValueByFieldName("FormTitle");
            _Iassessment.AssessmentDate = dtAssessmentDate.Date;
            _Iassessment.CreatedBy = Global.SessionUser.UserName;
            _Iassessment.CreateDate = DateTime.Now;
        }

        protected void ASPxPageControl1_TabClick(object source, TabControlCancelEventArgs e)
        {
           //if (e.Tab.Index == 0)
           //{
           //    UpdateAssessmentRecord();
           //}
        }

        protected void ASPxPopupControl1_WindowCallback(object source, PopupWindowCallbackArgs e)
        {
            this.LoadPopupControl();
        }

        protected void ASPxGridView1_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            btnSubmit_Click(sender, e);
        }    

        private void LoadPopupControl()
        {
            int assessmentNo = int.Parse(ASPxTextAssessmentNo.Text);
            var incomedata = from income in _context.IAssessmentIncomes.Where(a => a.AssessmentId == assessmentNo && a.Amount > 0)
                             select new
                             {
                                 income.TaxIncome.IncomeDescription,
                                 income.Amount
                             };
            ASPxgvIncome.DataSource = incomedata.ToList();
            ASPxgvIncome.DataBind();

            var exemptdata = from exempt in _context.IAssessmentExclusions.Where(a => a.AssessmentId == assessmentNo && a.Amount > 0)
                             select new
                             {
                                 exempt.TaxExclusion.ExclusionName,
                                 exempt.Amount
                             };
            ASPxgvExempt.DataSource = exemptdata.ToList();
            ASPxgvExempt.DataBind();


            int year = int.Parse(ASPxComboBoxAssessmentYear.SelectedItem.Value.ToString());
            decimal? AccessableIncome = _context.IAssessments.Single(n => n.AssessmentId == assessmentNo).AssessableIncome;

            ASPxLabelAssesableIncome.Text = String.Format("Assesable Income (a-b):  {0:#,##0.00}", AccessableIncome);

            var data = _context.PITComputationDetails(AccessableIncome, year);
            ASPxgvTaxDetails.DataSource = data;
            ASPxgvTaxDetails.DataBind();
        }

        protected void ASPxgvExempt_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
        {
            e.Value = e.ListSourceRowIndex + 1;
        }

        protected void ASPxgvIncome_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
        {
            e.Value = e.ListSourceRowIndex + 1;
        }

        protected void ASPxgvTaxDetails_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
        {
            e.Value = e.ListSourceRowIndex + 1;
        }

        protected void gvAttachment_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        protected void gvAttachment_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["FileId"] = Guid.NewGuid();
            e.NewValues["AssessmentId"] = int.Parse(ASPxTextAssessmentNo.Text);
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

    }
}