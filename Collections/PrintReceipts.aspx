<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PrintReceipts.aspx.cs" Inherits="TAAPs.Collections.PrintReceipts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <p>
        <applet id="Applet1" archive="firswebprint.jar" code="printutility.LoadReceipts" name="wprint" style="overflow: auto; width: 100%; height: 400px;">
Your browser does not support the <code>applet</code> tag.
            </applet></p>
</asp:Content>
