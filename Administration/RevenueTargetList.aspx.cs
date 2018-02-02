using System;
using DevExpress.Web;

namespace TAAPs.Administration
{
    public partial class RevenueTargetList : AccessPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void ASPxgvTargets_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;

            if (e.ButtonType == ColumnCommandButtonType.Delete)
            {
               e.Visible = DeleteButtonVisibleCriteria(ASPxgvTargets, e.VisibleIndex);
            }
        }

        private bool DeleteButtonVisibleCriteria(ASPxGridView grid, int _visibleIndex)
        {
            bool _visible = false;
            int _currentyear = DateTime.Today.Year;

            object row = grid.GetRowValues(_visibleIndex, "Year");

            if (row == null) return false;

            int _rowvalue = (int)row;
            _visible = _rowvalue >= _currentyear ? true : false;

            return _visible;
        }

        protected void ASPxgvTargets_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.GetValue("Year") == null) return;
            
            if ((int)(e.GetValue("Year")) <  DateTime.Today.Year)
            {
                e.Cell.Attributes.Add("onclick", "event.cancelBubble = true");
            }           
        }

        protected void ASPxgvTargets_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            if (e.Exception.InnerException.ToString().Contains("PRIMARY KEY"))
            {
                e.ErrorText = "You entered Duplicate Data, Please re-enter Unique information.";
            }
            else e.ErrorText = e.Exception.ToString();
        }
    }
}