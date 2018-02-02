using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Core.Objects;
using DevExpress.Web;
using TAAPs.Model;

namespace TAAPs.Registration
{
    public partial class CTINRequestList : AccessPage    //System.Web.UI.Page
    {
        TAAPsDBContext _context = new TAAPsDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnApprove_Click(object sender, EventArgs e)
        {
            try
            {
                string _createdby = Global.SessionUser.UserName;
                int editingRowVisibleIndex = int.Parse(ASPxGridView1.EditingRowVisibleIndex.ToString());
                int _requestId = int.Parse(ASPxGridView1.GetRowValues(editingRowVisibleIndex, "RequestId").ToString());

                var outputParameter = new ObjectParameter("TIN", typeof(string));
                _context.CreateCorporateTaxpayer(_requestId, _createdby, outputParameter);

                var _tin = outputParameter.Value;

                string displayMessage = string.Concat("TIN ", _tin, " has been generated successfully.");
                DisplayAlert(displayMessage);

                ASPxGridView1.CancelEdit();
                ASPxGridView1.DataBind();
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                DisplayAlert(error);
            }
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            int editingRowVisibleIndex = int.Parse(ASPxGridView1.EditingRowVisibleIndex.ToString());
            int _requestId = int.Parse(ASPxGridView1.GetRowValues(editingRowVisibleIndex, "RequestId").ToString());

            var rejectRequest = _context.CTINRequests.Single(r => r.RequestId == _requestId);

            _context.CTINRequests.Remove(rejectRequest);
            _context.SaveChanges();

            ASPxGridView1.CancelEdit();
            ASPxGridView1.DataBind();
        }
    }
}