<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="SessionTimeOut.aspx.cs" Inherits="TAAPs.SessionTimeOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentTitle" runat="server">
    Session Timeout
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentSubTitle" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="panelHeading" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    Your session has timedout. Click <a href="Login.aspx" class="btn-info">here</a> to login.
</asp:Content>
