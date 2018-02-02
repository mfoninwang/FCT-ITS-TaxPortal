<%@ Page Title="" Language="C#" MasterPageFile="ReportMaster.Master" AutoEventWireup="true" CodeBehind="TaxPortalReport.aspx.cs" Inherits="TAAPs.Reports.TaxPortalReport" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <rsweb:ReportViewer ID="rptViewer" runat="server" Height="100%" Width="100%" Font-Names="Verdana" Font-Size="8pt" ProcessingMode="Remote" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" SizeToReportContent="True">
</rsweb:ReportViewer>
</asp:Content>
