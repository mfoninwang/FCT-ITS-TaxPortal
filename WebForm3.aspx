<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="TAAPs.WebForm3" %>

<%@ Register assembly="DevExpress.Web.ASPxTreeList.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTreeList" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxComboBox ID="RoleCombo" runat="server" AutoPostBack="True" DataSourceID="EntityDataSource2" TextField="RoleName" ValueField="RoleId">
                <ClearButton DisplayMode="Always">
                </ClearButton>
            </dx:ASPxComboBox>
            <dx:ASPxComboBox ID="ModulesCombo" runat="server" AutoPostBack="True" DataSourceID="EntityDataSource3" TextField="DecryptedResourceName" ValueField="ResourceId">
            </dx:ASPxComboBox>
            <dx:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource1" KeyFieldName="RoleId;ResourceId" Width="100%">
                <Columns>
                    <dx:TreeListTextColumn AutoFilterCondition="Default" FieldName="ResourceId" ReadOnly="True" ShowInFilterControl="Default" VisibleIndex="1">
                    </dx:TreeListTextColumn>
                    <dx:TreeListCheckColumn AutoFilterCondition="Default" FieldName="AllowView" ShowInFilterControl="Default" VisibleIndex="3">
                    </dx:TreeListCheckColumn>
                    <dx:TreeListCheckColumn AutoFilterCondition="Default" FieldName="AllowUpdate" ShowInFilterControl="Default" VisibleIndex="4">
                    </dx:TreeListCheckColumn>
                    <dx:TreeListCheckColumn AutoFilterCondition="Default" FieldName="AllowAdd" ShowInFilterControl="Default" VisibleIndex="5">
                    </dx:TreeListCheckColumn>
                    <dx:TreeListCheckColumn AutoFilterCondition="Default" FieldName="AllowDelete" ShowInFilterControl="Default" VisibleIndex="6">
                    </dx:TreeListCheckColumn>
                    <dx:TreeListTextColumn AutoFilterCondition="Default" Caption="Resource Name" FieldName="Resource.DecryptedResourceName" ReadOnly="True" ShowInFilterControl="Default" VisibleIndex="2">
                    </dx:TreeListTextColumn>
                    <dx:TreeListCommandColumn VisibleIndex="7">
                        <EditButton Visible="True">
                        </EditButton>
                    </dx:TreeListCommandColumn>
                    <dx:TreeListTextColumn AutoFilterCondition="Default" FieldName="RoleId" ReadOnly="True" ShowInFilterControl="Default" VisibleIndex="0">
                    </dx:TreeListTextColumn>
                </Columns>
<SettingsBehavior AllowAutoFilter="True"></SettingsBehavior>

<SettingsCustomizationWindow PopupHorizontalAlign="RightSides" PopupVerticalAlign="BottomSides"></SettingsCustomizationWindow>

<SettingsPopupEditForm VerticalOffset="-1"></SettingsPopupEditForm>

                <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />

<SettingsPopup>
<EditForm VerticalOffset="-1"></EditForm>
</SettingsPopup>
            </dx:ASPxTreeList>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableUpdate="True" EntitySetName="RoleResources" Include="Resource" Where="it.RoleId==@RoleId &amp;&amp; it.Resource.ParentId==@ResourceId">
                <WhereParameters>
                    <asp:ControlParameter ControlID="RoleCombo" Name="RoleId" PropertyName="Value" Type="Int32" />
                    <asp:ControlParameter ControlID="ModulesCombo" Name="ResourceId" PropertyName="Value" Type="Int32" />
                </WhereParameters>
            </asp:EntityDataSource>
            <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Roles" Select="it.[RoleId], it.[RoleName]">
            </asp:EntityDataSource>
            <asp:EntityDataSource ID="EntityDataSource3" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Resources" EntityTypeFilter="Resource" Where="it.ResourceType == 'Mod'">
            </asp:EntityDataSource>
        </div>
    </form>
</body>
</html>
