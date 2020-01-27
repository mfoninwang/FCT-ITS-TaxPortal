<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="PrintReceipts.aspx.cs" Inherits="TAAPs.Collections.PrintReceipts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Print Payment Receipt
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Payment List
</asp:Content>




<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
    <p>
        <applet id="Applet1" archive="firswebprint.jar" code="printutility.LoadReceipts" name="wprint" style="overflow: auto; width: 100%; height: 400px;">
Your browser does not support the <code>applet</code> tag.
            </applet></p>
</asp:Content>
