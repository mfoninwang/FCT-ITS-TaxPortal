<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="LAdministrators.aspx.cs" Inherits="TAAPs.Administration.LAdministrators" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
     Administration
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Local Administrators 
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="panelHeading" runat="server">
    <div class="btn-group">
        <a class="btn btn-primary" href="#">
            <i class="glyphicon glyphicon-align-justify"></i>
            Local Administrator List
        </a>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">

        <dx:ASPxGridView ID="LAdministratorGridview" runat="server" AutoGenerateColumns="False" DataSourceID="dsUsers" Width="100%" KeyFieldName="UserName" OnCellEditorInitialize="LAdministratorGridview_CellEditorInitialize" OnCustomErrorText="LAdministratorGridview_CustomErrorText" OnRowInserting="LAdministratorGridview_RowInserting" ClientInstanceName="grid">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="True" ShowFilterBar="Auto" ShowPreview="True" />
            <SettingsBehavior FilterRowMode="OnClick" AllowSelectSingleRowOnly="True" AllowSelectByRowClick="True" ColumnResizeMode="Control" />
            <SettingsDataSecurity AllowDelete="False" />
            <SettingsPopup>
                <EditForm HorizontalAlign="Center" VerticalAlign="TopSides" Width="800" />
                <CustomizationWindow HorizontalAlign="Center" VerticalAlign="Middle" />
            </SettingsPopup>
            <SettingsText PopupEditFormCaption="Edit Local Administrator" />
            <EditFormLayoutProperties ColCount="2">
                <Items>
                    <dx:GridViewColumnLayoutItem ColumnName="UserName">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Role">
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
                <SettingsItemCaptions Location="Top" />
            </EditFormLayoutProperties>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="0" ReadOnly="True">
                    <PropertiesTextEdit Width="100%">
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
                <dx:GridViewDataCheckColumn FieldName="IsActive" VisibleIndex="7" Width="100px" Caption="Active">
                    <PropertiesCheckEdit DisplayTextChecked="Yes" DisplayTextUnchecked="No">
                    </PropertiesCheckEdit>
                </dx:GridViewDataCheckColumn>
                <dx:GridViewCommandColumn VisibleIndex="11" ShowEditButton="True" ShowUpdateButton="True" Width="80px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tax Office" FieldName="TaxOfficeId" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="edsTaxOffices" TextField="TaxOfficeName" ValueField="TaxOfficeId" Width="100%">
                        <ReadOnlyStyle BackColor="#CCCCCC">
                        </ReadOnlyStyle>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField ErrorText="Required" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Email" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                    <PropertiesTextEdit>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StaffId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="1" ShowInCustomizationForm="True" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MiddleName" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Role" FieldName="RoleId" ShowInCustomizationForm="True" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="dsRoles" TextField="RoleName" ValueField="RoleId">
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataButtonEditColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                    <EditFormSettings Caption="Reset Password" Visible="True" />
                </dx:GridViewDataButtonEditColumn>
            </Columns>
            <Toolbars>
                <dx:GridViewToolbar ItemAlign="Right">
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Text="Add New Local Administrator">
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
        </dx:ASPxGridView>
        <asp:EntityDataSource ID="dsUsers" runat="server" ConnectionString="name=TAAPsDBContext"
            DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True"
            EntitySetName="Users" Where="it.Role.ParentId = @RoleId &amp;&amp; it.TaxOffice.RegionId = @RegionId" Include="Role,TaxOffice">
            <WhereParameters>
                <asp:SessionParameter Name="RoleId" SessionField="UserRoleId" Type="Int32" />
                <asp:SessionParameter Name="RegionId" SessionField="UserRegionId" Type="String" />
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
        <asp:EntityDataSource ID="edsTaxOffices" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxOffices" Select="it.[TaxOfficeId], it.[TaxOfficeName], it.[RegionId]" Where="it.RegionId = @RegionId">
            <WhereParameters>
                <asp:SessionParameter Name="RegionId" SessionField="UserRegionId" Type="String" />
            </WhereParameters>
        </asp:EntityDataSource>
</asp:Content>
