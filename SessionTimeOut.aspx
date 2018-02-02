<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SessionTimeOut.aspx.cs" Inherits="TAAPs.SessionTimeOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" NavigateUrl="~/index.aspx" Text="Your session has timedout. Click here to Re-Login" />
</asp:Content>
