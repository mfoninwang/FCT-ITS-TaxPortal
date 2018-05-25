<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="TAAPs.Administration.Users" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentTitle" runat="server">
    Administration
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentSubTitle" runat="server">
    Users
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="panelHeading" runat="server">
    <div class="btn-group">
        <a class="btn btn-primary" href="#">
            <i class="glyphicon glyphicon-align-justify"></i>
            User List
        </a>
    </div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsUsers" Width="100%" KeyFieldName="UserName" OnCellEditorInitialize="ASPxGridView1_CellEditorInitialize" OnCustomErrorText="ASPxGridView1_CustomErrorText" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow">
        <ClientSideEvents RowDblClick="function(s, e) {
	s.StartEditRow(e.visibleIndex);
}" />
        <EditFormLayoutProperties ColCount="2">
            <Items>
                <dx:GridViewColumnLayoutItem ColumnName="UserName">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="RoleId">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="TaxOfficeId">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Title">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="LastName">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="FirstName">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="MiddleName">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="StaffId">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Email">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="IsActive">
                </dx:GridViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="0" Width="100px" ReadOnly="True">
                <PropertiesTextEdit>
                    <ValidationSettings ErrorDisplayMode="None">
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="LastName" ShowInCustomizationForm="True" VisibleIndex="2">
    <PropertiesTextEdit>
        <ValidationSettings ErrorDisplayMode="None">
            <RequiredField IsRequired="True" />
        </ValidationSettings>
    </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="3">
                <PropertiesTextEdit>
                    <ValidationSettings ErrorDisplayMode="None">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataCheckColumn FieldName="IsActive" VisibleIndex="10" Caption="Active">
                <PropertiesCheckEdit DisplayTextChecked="Yes" DisplayTextUnchecked="No">
                    <ValidationSettings ErrorDisplayMode="None">
                    </ValidationSettings>
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewCommandColumn ShowApplyFilterButton="True" VisibleIndex="11" ShowEditButton="True" ShowUpdateButton="True" Width="100px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="1" ShowInCustomizationForm="True" Visible="False">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="9" ShowInCustomizationForm="True" Visible="False">
                <PropertiesTextEdit>
                    <ValidationSettings ErrorDisplayMode="None">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="MiddleName" VisibleIndex="4" ShowInCustomizationForm="True" Visible="False">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="StaffId" Visible="false" VisibleIndex="8" ShowInCustomizationForm="True">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataComboBoxColumn Caption="Role" FieldName="RoleId" ShowInCustomizationForm="True" VisibleIndex="5">
                <PropertiesComboBox DataSourceID="dsRoles" TextField="RoleName" ValueField="RoleId">
                    <ValidationSettings ErrorDisplayMode="None">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Tax Office" FieldName="TaxOfficeId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7">
                <PropertiesComboBox>
                    <ReadOnlyStyle BackColor="#CCCCCC">
                    </ReadOnlyStyle>
                    <ValidationSettings ErrorDisplayMode="None">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <SettingsBehavior AllowSelectSingleRowOnly="True" AllowSelectByRowClick="True" ColumnResizeMode="Control" />
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" ShowPreview="True" />
        <SettingsText PopupEditFormCaption="Edit User" />
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" VerticalAlign="TopSides" Width="800" />
            <CustomizationWindow HorizontalAlign="Center" VerticalAlign="Middle" />
        </SettingsPopup>
        <SettingsDataSecurity AllowDelete="False" />
        <Toolbars>
            <dx:GridViewToolbar ItemAlign="Right">
                <Items>
                    <dx:GridViewToolbarItem Command="New" Text="Add New User">
                    </dx:GridViewToolbarItem>
                </Items>
            </dx:GridViewToolbar>
        </Toolbars>
    </dx:ASPxGridView>
    <asp:EntityDataSource ID="dsUsers" runat="server" ConnectionString="name=TAAPsDBContext"
        DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True"
        EntitySetName="Users" Where="it.Role.ParentId = @RoleId &amp;&amp; it.TaxOfficeId = @TaxOfficeId" Include="Role,TaxOffice">
        <WhereParameters>
            <asp:SessionParameter Name="RoleId" SessionField="UserRoleId" Type="Int32" />
            <asp:SessionParameter Name="TaxOfficeId" SessionField="TaxOfficeId" Type="String" />
        </WhereParameters>
        <InsertParameters>
            <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
        </InsertParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsRoles" runat="server"
        ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False"
        EntitySetName="Roles" Where="it.ParentId = @ParentRoleId" EntityTypeFilter="" Select="">
        <WhereParameters>
            <asp:SessionParameter DefaultValue="" Name="ParentRoleId" SessionField="UserRoleId" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>

</asp:Content>
