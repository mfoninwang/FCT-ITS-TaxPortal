<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="NotificationSettings.aspx.cs" Inherits="TAAPs.Administration.NotificationSettings" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Tax Authority Setup
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Settings
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="panelHeading" runat="server">
    <div class="btn-group">
        <a class="btn btn-primary" href="#">
            <i class="fa fa-list"></i>
            Notification Settings
        </a>
    </div>
</asp:Content>



<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">

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
