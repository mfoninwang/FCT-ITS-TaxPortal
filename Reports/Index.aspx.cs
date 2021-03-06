﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;


using TAAPs.Model;

namespace TAAPs.Reports
{
    public partial class Index : AccessPage //System.Web.UI.Page
    {
        TAAPsDBContext context = new TAAPsDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private void LoadReportCategories()
        {
            var query = context.ReportCategories.OrderBy(n => n.ReportCategoryName);

            //ASPxcbReportList = (ASPxComboBox)ASPxRoundPanel1.FindControl("ASPxcbReportList");

            //ASPxcbReportList.DataSource = query.ToList();
            //ASPxcbReportList.TextField = "ReportCategoryName";
            //ASPxcbReportList.ValueField = "ReportCategoryId";
            //ASPxcbReportList.DataBind();

            //ASPxcbReportList.SelectedIndex = 0;
        }

        private void LoadReports()
        {
            //ASPxcbReportList = (ASPxComboBox)ASPxRoundPanel1.FindControl("ASPxcbReportList");

            //int reportCat = int.Parse(ASPxcbReportList.SelectedItem.Value.ToString());

            //var query = context.Reports.Where(c => c.ReportCategoryId == reportCat)
            //                            .OrderBy(n => n.ReportDesc);

            //ASPxDataView1.DataSource = query.ToList();
            //ASPxDataView1.DataBind();
        }

        protected void ASPxcbReportList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //this.LoadReports();
        }

    }
}