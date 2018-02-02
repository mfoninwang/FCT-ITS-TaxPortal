using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using TAAPs.Model;

namespace TAAPs.Reports
{
    public partial class TaxPortalReport : BasePage
    {
        private string _ReportName;
        TAAPsDBContext _context = new TAAPsDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _ReportName = Request.QueryString["name"].ToString();
                this.Title = _ReportName;

                string taxauthority = ConfigurationManager.AppSettings["TaxAuthority"];

                Model.Tenant _tenant = _context.Tenants.Single(i => i.TenantId == taxauthority);

                string reportserver = _tenant.ReportServer; 
                string reportfolder = _tenant.ReportFolder; 

                string _userName = _tenant.ReportUser;
                string _Password = _tenant.ReportPassword;
                string _reportDomain = _tenant.ReportDomain;

                Uri uri = new Uri(reportserver);
                rptViewer.ServerReport.ReportServerUrl = uri;
                rptViewer.ServerReport.ReportPath = reportfolder + _ReportName;

                rptViewer.ServerReport.ReportServerCredentials = new CustomReportCredentials(_userName,_Password,_reportDomain);
                rptViewer.ServerReport.Refresh();
            } 
        }
    }
}