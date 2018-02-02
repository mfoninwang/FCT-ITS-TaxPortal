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
    public partial class ITINRequestList : AccessPage    
    {
        TAAPsDBContext _context = new TAAPsDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnApprove_Click(object sender, EventArgs e)
        {
            string _createdby = (string)Global.SessionUser.UserName;
            int editingRowVisibleIndex = int.Parse(ASPxGridView1.EditingRowVisibleIndex.ToString());
            int _requestId = int.Parse(ASPxGridView1.GetRowValues(editingRowVisibleIndex, "RequestId").ToString());

            var outputParameter = new ObjectParameter("TIN", typeof(string));

            _context.CreateIndividualTaxpayer(_requestId, _createdby, outputParameter);
            var _tin = outputParameter.Value;

            string displayMessage = string.Concat("TIN ", _tin, " has been generated successfully.");
            DisplayAlert(displayMessage);

            ASPxGridView1.CancelEdit();
            ASPxGridView1.DataBind();
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            int editingRowVisibleIndex = int.Parse(ASPxGridView1.EditingRowVisibleIndex.ToString());
            int _requestId = int.Parse(ASPxGridView1.GetRowValues(editingRowVisibleIndex, "RequestId").ToString());

            var rejectRequest = _context.ITINRequests.Single(r => r.RequestId == _requestId);

            _context.ITINRequests.Remove(rejectRequest);
            _context.SaveChanges();

            ASPxGridView1.CancelEdit();
            ASPxGridView1.DataBind();
        }
    }
}