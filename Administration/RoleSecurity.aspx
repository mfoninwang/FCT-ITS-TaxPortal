﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="RoleSecurity.aspx.cs" Inherits="TAAPs.Administration.RoleSecurity" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

        <script type="text/javascript">

            var windowId;

            function OnCustomButtonClick(s, e)
            {
                if (e.buttonID == 'btnPermissions')
                {
                    windowId = 0;
                    mastergrid.GetRowValues(e.visibleIndex, 'RoleId;RoleName', OnGetRowValues);
                }
            }

            function OnGetRowValues(keyValue) {
                var roleId = keyValue[0];
                var roleName = keyValue[1];

                if (windowId == 0) var headertext = 'Permissions for Role - ' + roleName;
                var window = popup.GetWindow(windowId);

                popup.ShowWindow(window);
                popup.PerformWindowCallback(window, roleId); // This is used only when there's are multiple window in the popoup control
            }
    </script>


    <asp:EntityDataSource ID="edsRoleResources" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EntitySetName="RoleResources" Include="Resource">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsModules" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Resources" Where="it.ResourceType == 'Mod'" EntityTypeFilter="Resource" OrderBy="" Select="">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsResources" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Resources" Where="it.ResourceType=='Men'" EntityTypeFilter="Resource" Include="Parent" EnableUpdate="True" OrderBy="">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsRoles" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Roles" Select="it.[RoleId], it.[RoleName]" Include="">
    </asp:EntityDataSource>
        <br />
        <table class="dxtcControl_PlasticBlue" __designer:mapid="14" style="width: 800px">
            <tr __designer:mapid="15">
                <td __designer:mapid="16">
    <dx:ASPxComboBox ID="ASPxcbRoles" runat="server" DataSourceID="edsRoles" TextField="RoleName" ValueField="RoleId" AutoPostBack="True" OnSelectedIndexChanged="ASPxcbRoles_SelectedIndexChanged" Width="200px">
    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr __designer:mapid="18">
                <td style="text-align: right" __designer:mapid="19">
                    &nbsp;</td>
            </tr>
            <tr __designer:mapid="18">
                <td style="text-align: right" __designer:mapid="19">
                    <dx:ASPxCheckBoxList ID="aspxChklResourses" runat="server" DataSourceID="edsResources" RepeatColumns="5" RepeatDirection="Horizontal" TextField="DecryptedResourceName" ValueField="ResourceId" ValueType="System.Int32" Width="100%">
                    </dx:ASPxCheckBoxList>
                </td>
            </tr>
            <tr __designer:mapid="18">
                <td style="text-align: right" __designer:mapid="19">
                    <dx:ASPxButton ID="ASPxbtnSaveRolePermissions" runat="server" OnClick="ASPxbtnSaveRolePermissions_Click" Text="Save">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    <br />
    </asp:Content>
