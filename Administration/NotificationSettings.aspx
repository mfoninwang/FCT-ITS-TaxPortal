<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="NotificationSettings.aspx.cs" Inherits="TAAPs.Administration.NotificationSettings" %>
<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <dx:ASPxGridView ID="ASPxGridViewNotifications" runat="server" AutoGenerateColumns="False" DataSourceID="edsNotifications" KeyFieldName="NotificationId" Width="100%">
    <Columns>
        <dx:GridViewDataTextColumn Caption="Notification Process Trigger" FieldName="NotificationId" ReadOnly="True" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataCheckColumn FieldName="Email" VisibleIndex="2">
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataCheckColumn FieldName="SMS" VisibleIndex="3">
        </dx:GridViewDataCheckColumn>
    </Columns>
    <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
    <SettingsPager Visible="False">
    </SettingsPager>
        <SettingsEditing Mode="Batch" NewItemRowPosition="Bottom">
        </SettingsEditing>
    <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
</dx:ASPxGridView>
<asp:EntityDataSource ID="edsNotifications" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="NotificationSettings">
</asp:EntityDataSource>
</asp:Content>
