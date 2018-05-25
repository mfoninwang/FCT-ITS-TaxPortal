using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Text;
using TAAPs.Model;
using TAAPs.Messaging;


namespace TAAPs.Registration
{
    public partial class ItaxpayerEdit : BasePage
    {
        private const string DataObjectName = "ITaxpayer";

        static TAAPsDBContext context;
        ITaxpayer taxpayer;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                context = new TAAPsDBContext();

                string yearDiff = (DateTime.Today.Year - 18).ToString();
                string maxDate = string.Concat(yearDiff, "/12", "/31");
                BirthDateDateEdit.MaxDate = DateTime.Parse(maxDate);
                BirthDateDateEdit.MinDate = DateTime.Parse("01/01/1920");

                SaveButton.Visible = Global.SessionUser.RoleId == 1 || Global.SessionUser.RoleId == 2 ? true : false;
                SendSMSButton.Visible = Global.SessionUser.RoleId == 1 ? true : false;
                CancelButton.Visible = Global.SessionUser.RoleId == 1 ? true : false;
                TaxpayerForm.Enabled = Global.SessionUser.RoleId == 1 || Global.SessionUser.RoleId == 2 ? true : false;
                try
                {
                    if (Page.PreviousPage.IsValid)
                    {
                        LoadListData();
                        ViewState["TIN"] = PreviousPage.TIN;
                        GetTaxpayer((string)ViewState["TIN"]);
                        AddressCardView.DataBind();
                        AttachmentGridview.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    DisplayAlert("Danger", "Individual Taxpayer", ex.Message);
                }
            }
        }

        private void GetTaxpayer(string tin)
        {
            Session[DataObjectName] = context.ITaxpayers.Where(t => t.TIN == tin).Single();

            TaxpayerForm.DataSource = Session[DataObjectName];
            TaxpayerForm.DataBind();

            taxpayer = (ITaxpayer)Session[DataObjectName];

            BirthLgaCombo_Callback(new object(), new CallbackEventArgsBase(taxpayer.BirthStateId));
            OriginLgaCombo_Callback(new object(), new CallbackEventArgsBase(taxpayer.OriginStateId));
        }

        private void LoadCountryList()
        {
            var countries = context.Countries.ToList();

            ASPxcbBirthCountry.DataSource = countries;
            ASPxcbBirthCountry.TextField = "CountryName";
            ASPxcbBirthCountry.ValueField = "CountryId";
            ASPxcbBirthCountry.DataBind();

            ASPxcbNationality.DataSource = countries;
            ASPxcbNationality.TextField = "CountryName";
            ASPxcbNationality.ValueField = "CountryId";
            ASPxcbNationality.DataBind();
        }

        protected void LoadStates()
        {
            var states = context.States.ToList();

            BirthStateCombo.DataSource = states;
            BirthStateCombo.TextField = "StateName";
            BirthStateCombo.ValueField = "StateId";
            BirthStateCombo.DataBind();

            OriginStateCombo.DataSource = states;
            OriginStateCombo.TextField = "StateName";
            OriginStateCombo.ValueField = "StateId";
            OriginStateCombo.DataBind();

        }

        private void LoadTaxOffices()
        {
            var taxOffices = context.TaxOffices.ToList();

            ASPxcbTaxOffice.DataSource = taxOffices;
            ASPxcbTaxOffice.TextField = "TaxOfficeName";
            ASPxcbTaxOffice.ValueField = "TaxOfficeId";
            ASPxcbTaxOffice.DataBind();
        }

        private void LoadIndentificationTypes()
        {
            IdentificationTypeCombo.DataSource = IdentificationType.IdentificationTypes;
            IdentificationTypeCombo.TextField = "value";
            IdentificationTypeCombo.ValueField = "key";
            IdentificationTypeCombo.DataBind();
        }

        private void LoadBirthLGAs(string stateId)
        {
            BirthLgaCombo.Items.Clear();

            if (string.IsNullOrEmpty(stateId)) return;

            BirthLgaCombo.DataSource = LGA.GetLGAs(stateId).OrderBy(l => l.LGAName);
            BirthLgaCombo.TextField = "LGAName";
            BirthLgaCombo.ValueField = "LGAId";
            BirthLgaCombo.DataBind();
        }

        private void LoadOriginLGAs(string stateId)
        {
            OriginLgaCombo.Items.Clear();

            if (string.IsNullOrEmpty(stateId)) return;

            OriginLgaCombo.DataSource = LGA.GetLGAs(stateId).OrderBy(l => l.LGAName);
            OriginLgaCombo.TextField = "LGAName";
            OriginLgaCombo.ValueField = "LGAId";
            OriginLgaCombo.DataBind();
        }

        private void LoadProfessions()
        {
            var professions = context.Professions.ToList();

            ProfessionCombo.DataSource = professions;
            ProfessionCombo.TextField = "ProfessionName";
            ProfessionCombo.ValueField = "ProfessionName";
            ProfessionCombo.DataBind();
        }

        private void LoadListData()
        {
            LoadCountryList();
            LoadStates();
            LoadTaxOffices();
            LoadIndentificationTypes();
            LoadProfessions();

            string state = BirthStateCombo.SelectedIndex < 1 ? string.Empty : (string)BirthStateCombo.SelectedItem.Value;
            LoadBirthLGAs(state);

            string originstate = OriginStateCombo.SelectedIndex < 1 ? string.Empty : (string)OriginStateCombo.SelectedItem.Value;
            LoadOriginLGAs(originstate);
        }

        protected void AddressCardView_CardInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ITaxpayerAddress address = new ITaxpayerAddress
            {
                TIN = (string)ViewState["TIN"],
                StreetNo = (String)e.NewValues["StreetNo"],
                AddressLine1 = (String)e.NewValues["AddressLine1"],
                AddressLine2 = (String)e.NewValues["AddressLine2"],
                CountryId = (int)(e.NewValues["CountryId"]),
                StateId = (String)(e.NewValues["StateId"]),
                City = (String)(e.NewValues["City"]),
                LgaId = (int)(e.NewValues["LgaId"]),
                PostCode = (String)(e.NewValues["PostCode"]),
                CreateDate = DateTime.Now,
                CreatedBy = (String)Session["UserName"],
                IsPrimary = (Boolean)(e.NewValues["IsPrimary"])
            };

            SaveAddress(address, "Add");

            e.Cancel = true;
            AddressCardView.CancelEdit();
        }

        protected void AddressCardView_CardUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            long addressId = (long)e.Keys["AddressId"];

            ITaxpayerAddress address = context.ITaxpayerAddresses.Find(addressId);

            address.StreetNo = (String)e.NewValues["StreetNo"];
            address.AddressLine1 = (String)e.NewValues["AddressLine1"];
            address.AddressLine2 = (String)e.NewValues["AddressLine2"];
            address.CountryId = (int?)(e.NewValues["CountryId"]);
            address.StateId = (String)(e.NewValues["StateId"]);
            address.City = (String)(e.NewValues["City"]);
            address.LgaId = (int?)(e.NewValues["LgaId"]);
            address.PostCode = (String)(e.NewValues["PostCode"]);
            address.IsPrimary = (Boolean)(e.NewValues["IsPrimary"]);

            SaveAddress(address, "Update");

            e.Cancel = true;
            AddressCardView.CancelEdit();
        }

        private void SaveAddress(ITaxpayerAddress address, string action)
        {
            switch (action)
            {
                case "Add":
                    context.ITaxpayerAddresses.Add(address);
                    context.SaveChanges();
                    break;
                case "Update":
                    context.SaveChanges();
                    break;
                default:
                    context.SaveChanges();
                    break;
            }
        }

        protected void AddressCardView_DataBinding(object sender, EventArgs e)
        {
            taxpayer = (ITaxpayer)Session["ITaxpayer"];
            AddressCardView.DataSource = taxpayer.ITaxpayerAddresses.ToList();
        }

        protected void TaxpayerForm_DataBinding(object sender, EventArgs e)
        {
            TaxpayerForm.DataSource = (ITaxpayer)Session["ITaxpayer"];
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            SaveRecord();
        }

        private void SaveRecord()
        {
            try
            {
                string tin = (string)TaxpayerForm.GetNestedControlValueByFieldName("TIN");

                taxpayer = context.ITaxpayers.Single(t => t.TIN == tin);

                taxpayer.BVN = (string)TaxpayerForm.GetNestedControlValueByFieldName("BVN");
                taxpayer.JTBTIN = (string)TaxpayerForm.GetNestedControlValueByFieldName("JTBTIN");
                taxpayer.FIRSTIN = (string)TaxpayerForm.GetNestedControlValueByFieldName("FIRSTIN");
                taxpayer.NIN = (string)TaxpayerForm.GetNestedControlValueByFieldName("NIN");
                taxpayer.StateTIN = (string)TaxpayerForm.GetNestedControlValueByFieldName("StateTIN");

                taxpayer.LastName = (string)TaxpayerForm.GetNestedControlValueByFieldName("LastName");
                taxpayer.FirstName = (string)TaxpayerForm.GetNestedControlValueByFieldName("FirstName");
                taxpayer.MiddleName = (string)TaxpayerForm.GetNestedControlValueByFieldName("MiddleName");

                taxpayer.MaidenName = (string)TaxpayerForm.GetNestedControlValueByFieldName("MaidenName");
                taxpayer.PreviousFirstName = (string)TaxpayerForm.GetNestedControlValueByFieldName("PreviousFirstName");
                taxpayer.PreviousLastName = (string)TaxpayerForm.GetNestedControlValueByFieldName("PreviousLastName");
                taxpayer.PreviousMiddleName = (string)TaxpayerForm.GetNestedControlValueByFieldName("PreviousMiddleName");

                taxpayer.Height = (decimal?)TaxpayerForm.GetNestedControlValueByFieldName("Height");
                taxpayer.SpouseNIN = (String)TaxpayerForm.GetNestedControlValueByFieldName("SpouseNIN");

                taxpayer.Gender = (string)TaxpayerForm.GetNestedControlValueByFieldName("Gender");
                taxpayer.MaritalStatus = (string)TaxpayerForm.GetNestedControlValueByFieldName("MaritalStatus");
                taxpayer.Religion = (string)TaxpayerForm.GetNestedControlValueByFieldName("Religion");

                taxpayer.BirthDate = (DateTime)TaxpayerForm.GetNestedControlValueByFieldName("BirthDate");
                taxpayer.BirthStateId = (String)TaxpayerForm.GetNestedControlValueByFieldName("BirthStateId");
                taxpayer.BirthCity = (String)TaxpayerForm.GetNestedControlValueByFieldName("BirthCity");
                taxpayer.BirthLgaId = (int?)TaxpayerForm.GetNestedControlValueByFieldName("BirthLgaId");
                taxpayer.BirthCountryId = (int?)TaxpayerForm.GetNestedControlValueByFieldName("BirthCountryId");
                taxpayer.NationalityId = (int?)TaxpayerForm.GetNestedControlValueByFieldName("NationalityId");
                taxpayer.OriginStateId = (string)TaxpayerForm.GetNestedControlValueByFieldName("OriginStateId");
                taxpayer.OriginLgaId = (int?)TaxpayerForm.GetNestedControlValueByFieldName("OriginLgaId");

                taxpayer.Phone1 = (string)TaxpayerForm.GetNestedControlValueByFieldName("Phone1");
                taxpayer.Phone2 = (string)TaxpayerForm.GetNestedControlValueByFieldName("Phone2");
                taxpayer.Email = (string)TaxpayerForm.GetNestedControlValueByFieldName("Email");
                taxpayer.Website = (string)TaxpayerForm.GetNestedControlValueByFieldName("Website");

                taxpayer.Employer = (string)TaxpayerForm.GetNestedControlValueByFieldName("Employer");
                taxpayer.Profession = (string)TaxpayerForm.GetNestedControlValueByFieldName("Profession");
                taxpayer.EmploymentId = (string)TaxpayerForm.GetNestedControlValueByFieldName("EmploymentId");
                taxpayer.EmploymentStatus = (string)TaxpayerForm.GetNestedControlValueByFieldName("EmploymentStatus");

                taxpayer.HighestEducation = (string)TaxpayerForm.GetNestedControlValueByFieldName("HighestEducation");
                taxpayer.IdentificationType = (string)TaxpayerForm.GetNestedControlValueByFieldName("IdentificationType");
                taxpayer.IdentificationNumber = (string)TaxpayerForm.GetNestedControlValueByFieldName("IdentificationNumber");
                taxpayer.EmploymentStatus = (string)TaxpayerForm.GetNestedControlValueByFieldName("EmploymentStatus");
                taxpayer.TaxOfficeId = (string)TaxpayerForm.GetNestedControlValueByFieldName("TaxOfficeId");

                ValidateRecord(taxpayer);

                context.SaveChanges();
                DisplayAlert("Success", "Individual Taxpayer", "Taxpayer successfully saved");
            }

            catch(Exception ex)
            {
                DisplayAlert("Danger", "Individual Taxpayer", ex.Message);
            }
        }

        private void ValidateRecord(ITaxpayer taxpayerRecord)
        {
            string nin = taxpayerRecord.NIN;
            string bvn = taxpayerRecord.BVN;
            string jtbTin = taxpayerRecord.JTBTIN;
            string message;

            if (string.IsNullOrEmpty(bvn) && string.IsNullOrEmpty(nin))
            {
                message = string.Format("A BVN or National Identity Number (NIN) is required to submit this record");
                throw new Exception(message);
            }
        }

        protected void BirthLgaCombo_Callback(object sender, CallbackEventArgsBase e)
        {
            LoadBirthLGAs(e.Parameter);
        }

        protected void OriginLgaCombo_Callback(object sender, CallbackEventArgsBase e)
        {
            LoadOriginLGAs(e.Parameter);
        }

        protected void AttachmentGridview_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Object[] fileInfo = (Object[])Session["UploadedFile"];

            ITaxpayerFile file = new ITaxpayerFile
            {
                FileId = Guid.NewGuid(),
                TIN = (string)ViewState["TIN"],
                FileName = (string)fileInfo[0],
                FileDescription = (string)e.NewValues["FileDescription"],
                FileType = (string)fileInfo[1],
                FileContent = (byte[])fileInfo[2],
                CreateDate = DateTime.Now,
                CreatedBy = Global.SessionUser.UserName
            };

            context.ITaxpayerFiles.Add(file);
            context.SaveChanges();

            e.Cancel = true;
            AttachmentGridview.CancelEdit();
        }

        protected void AttachmentGridview_DataBinding(object sender, EventArgs e)
        {
            taxpayer = (ITaxpayer)Session["ITaxpayer"];
            AttachmentGridview.DataSource = taxpayer.ITaxpayerFiles.ToList();
        }

        protected void AttachmentGridview_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Guid fileId = (Guid)e.Keys["FileId"];

            ITaxpayerFile file = context.ITaxpayerFiles.Single(d => d.FileId == fileId);

            context.ITaxpayerFiles.Remove(file);
            context.SaveChanges();

            e.Cancel = true;
            AttachmentGridview.CancelEdit();
        }

        protected void DownloadButton_Click(object sender, EventArgs e)
        {
            Guid fileId = Guid.Parse((sender as ASPxButton).CommandArgument);
            using (context)
            {
                var v = context.ITaxpayerFiles.Where(a => a.FileId.Equals(fileId)).Single();
                if (v != null)
                {
                    byte[] filedata = v.FileContent;
                    Response.AddHeader("Content-type", v.FileType);

                    string filename = v.FileName;
                    Response.AddHeader("Content-Disposition", "attachment;  filename=" + filename);

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

        protected void FileUploadControl_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            if (e.UploadedFile != null)
            {
                object[] fileInfo = new object[]
                {
                   e.UploadedFile.FileName,
                   e.UploadedFile.ContentType,
                   e.UploadedFile.FileBytes
                };

                Session["UploadedFile"] = fileInfo;             
            }
        }

        protected void SendSMSButton_Click(object sender, EventArgs e)
        {
            SendSMSNotification();
        }

        protected void SendSMSNotification()
        {
            taxpayer = (ITaxpayer)Session["ITaxpayer"];

            StringBuilder message = new StringBuilder()            
                .AppendFormat("Dear {0} {1},\n", taxpayer.FirstName, taxpayer.LastName)
                .AppendFormat("The FCT Internal Revenue Service (FCT-IRS) has successfully ")
                .AppendFormat("validated your taxpayer details and issued you a Taxpayer Identification Number.\n")
                .AppendFormat("TIN: {0} \n", taxpayer.TIN)
                .AppendFormat("Please quote this TIN in all communications with the FCT-IRS. Thank you \n")
                .AppendFormat("contactus@fctirs.gov.ng");

            string recipientPhone = taxpayer.Phone1;
            try
            {
                string requestId = SMSMessaging.SendSMS(recipientPhone,message.ToString());
                DisplayAlert("Success", "SMS Notification", string.Concat("SMS succesfully sent to ", recipientPhone));

                taxpayer.SMSNotified = true;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                DisplayAlert("Danger", "SMS Notification", ex.Message);
                return;
            }
        }

        protected void AttachmentGridview_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.InnerException.InnerException.Message;  
        }
    }
}