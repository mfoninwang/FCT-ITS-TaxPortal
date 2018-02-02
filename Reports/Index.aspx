﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TAAPs.Reports.Index" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <div style="padding-top: 20px; padding-bottom: 30px;">

        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Report Category:">
        </dx:ASPxLabel>
        <dx:ASPxComboBox ID="ASPxcbReportList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ASPxcbReportList_SelectedIndexChanged" Width="300px" DataSourceID="edsCategory" TextField="ReportCategoryName" ValueField="ReportCategoryId">
        </dx:ASPxComboBox>



    </div>
    <dx:ASPxDataView runat="server" RowPerPage="10" ColumnCount="4" AllowPaging="False" DataSourceID="edsReports" ID="ASPxDataView1">
        <SettingsFlowLayout ItemsPerPage="40"></SettingsFlowLayout>
        <SettingsTableLayout ColumnCount="4" RowsPerPage="10"></SettingsTableLayout>
        <PagerSettings ShowNumericButtons="False">
        </PagerSettings>
        <ItemTemplate>
            <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" NavigateUrl='<%# string.Concat("TaxPortalReport.aspx?name=", Eval("Url")) %>' Target="_blank" Text='<%# Eval("ReportDesc") %>' Width="100%" />
            <br />
        </ItemTemplate>
        <ContentStyle BackColor="White">
        </ContentStyle>
        <ItemStyle Height="10px" Width="100%" Wrap="False"></ItemStyle>
        <Border BorderStyle="None"></Border>
    </dx:ASPxDataView>

    <asp:EntityDataSource ID="edsReports" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Reports" EntityTypeFilter="" Select="" Where="it.ReportCategoryId = @ReportCategoryId">
        <WhereParameters>
            <asp:ControlParameter ControlID="ASPxcbReportList" Name="ReportCategoryId" PropertyName="Value" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsCategory" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="ReportCategories">
    </asp:EntityDataSource>

</asp:Content>
