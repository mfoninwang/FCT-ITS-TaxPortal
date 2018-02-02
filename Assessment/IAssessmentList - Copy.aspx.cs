using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.Data;
using System.Collections.Specialized;


namespace FIRSTAAPs.Assessment
{
    public partial class IAssessmentList : System.Web.UI.Page
    {
        private OrderedDictionary newValues;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            ASPxgvAssessments.DataBind();
            //}
        }

        protected void ASPxgvAssessments_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.ToString();
        }

        private void PopulateNewValues()
        {
            ((ASPxFormLayout)this.ASPxgvAssessments.FindEditFormTemplateControl("formLayout")).ForEach(new Action<LayoutItemBase>(this.ProcessItem));
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

        protected void ASPxgvAssessments_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            this.newValues = e.NewValues;
            this.PopulateNewValues();
        }

        protected void ASPxgvAssessments_StartRowEditing(object sender, ASPxStartRowEditingEventArgs e)
        {
            this.Session["IAssessmentId"] = e.EditingKeyValue.ToString();
        }

        protected void ASPxgvAssessments_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            this.newValues = e.NewValues;
            this.PopulateNewValues();
        }
    }
}