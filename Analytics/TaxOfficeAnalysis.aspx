<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="TaxOfficeAnalysis.aspx.cs" Inherits="TAAPs.Analytics.TaxOfficeAnalysis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Dashboard
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Tax Office Revenue Dashboard
</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
        <iframe src="../WebForm2.aspx" height="900" width="100%"></iframe>
</asp:Content>
