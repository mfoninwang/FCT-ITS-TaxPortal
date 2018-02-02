﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TaxOfficeAnalysis.aspx.cs" Inherits="TAAPs.Analytics.TaxOfficeAnalysis" %>
<%@ Register assembly="DevExpress.Dashboard.v15.2.Web, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.DashboardWeb" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <dx:ASPxDashboardViewer ID="ASPxDashboardViewer1" runat="server"
        DashboardSource="~/Analytics/TaxOfficeAnalysis.xml" ClientInstanceName="dashboardViewer" RegisterJQuery="True" Width="100%" DashboardId="" DashboardXmlFile="~/Analytics/TaxOfficeAnalysis.xml" Height="600px" OnConfigureDataConnection="ASPxDashboardViewer1_ConfigureDataConnection" DashboardTheme="Dark" OnCustomParameters="ASPxDashboardViewer1_CustomParameters">
<ExportOptions PageLayout="Landscape">
<DocumentContentOptions FilterState="None"></DocumentContentOptions>
</ExportOptions>
    </dx:ASPxDashboardViewer>
        <dx:ASPxTimer ID="ASPxTimer1" runat="server">
        <ClientSideEvents Tick="function(s, e) {
	LoadingPanel.Show();
	dashboardViewer.ReloadData();
	LoadingPanel.Hide();
}" />
    </dx:ASPxTimer>

</asp:Content>
