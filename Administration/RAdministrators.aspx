<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="RAdministrators.aspx.cs" Inherits="TAAPs.Administration.RAdministrators" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Administration
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Regional Administrators
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="panelHeading" runat="server">
    <div class="btn-group">
        <a class="btn btn-primary" href="#">
            <i class="glyphicon glyphicon-align-justify"></i>
            Regional Administrator List
        </a>
    </div>
</asp:Content>



<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">

        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsUsers" Width="100%" KeyFieldName="UserName" OnCustomErrorText="ASPxGridView1_CustomErrorText" OnRowInserting="ASPxGridView1_RowInserting" OnCellEditorInitialize="ASPxGridView1_CellEditorInitialize">
            <ClientSideEvents RowDblClick="function(s, e) {	s.StartEditRow(e.visibleIndex);}" />
            <EditFormLayoutProperties ColCount="2">
                <Items>
                    <dx:GridViewColumnLayoutItem ColumnName="UserName">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="RoleId">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Title">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="RegionId">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="LastName">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="FirstName">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="MiddleName">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Staff Id">
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
                <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="0" Width="100px" ReadOnly="True">
                    <PropertiesTextEdit>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField ErrorText="Required" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1">
                    <PropertiesTextEdit>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2">
                    <PropertiesTextEdit>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="IsActive" VisibleIndex="10" Width="100px" Caption="Active">
                    <PropertiesCheckEdit DisplayTextChecked="Yes" DisplayTextUnchecked="No">
                        <ValidationSettings ErrorDisplayMode="None">
                        </ValidationSettings>
                    </PropertiesCheckEdit>
                </dx:GridViewDataCheckColumn>
                <dx:GridViewCommandColumn VisibleIndex="11" ShowEditButton="True" ShowUpdateButton="True" Width="100px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataComboBoxColumn Caption="Region" FieldName="RegionId" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="edsRegions" TextField="RegionName" ValueField="RegionId">
                        <ReadOnlyStyle BackColor="#CCCCCC">
                        </ReadOnlyStyle>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField ErrorText="Required" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="MiddleName" VisibleIndex="3" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Title" Visible="False" VisibleIndex="4">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Email" Visible="False" VisibleIndex="8">
                    <PropertiesTextEdit>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Role" FieldName="RoleId" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="dsRoles" TextField="RoleName" ValueField="RoleId">
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="StaffId" Visible="False" VisibleIndex="9">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior FilterRowMode="OnClick" AllowSelectSingleRowOnly="True" AllowSelectByRowClick="True" ColumnResizeMode="NextColumn" />
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="True" ShowFilterBar="Auto" ShowPreview="True" />
            <SettingsText PopupEditFormCaption="Edit Regional Administrator" />
            <SettingsPopup>
                <EditForm HorizontalAlign="Center" VerticalAlign="TopSides" Width="800" />
                <CustomizationWindow HorizontalAlign="Center" VerticalAlign="Middle" />
            </SettingsPopup>
            <SettingsDataSecurity AllowDelete="False" />
            <Toolbars>
                <dx:GridViewToolbar ItemAlign="Right">
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Text="Add New Regional Administrator">
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
        </dx:ASPxGridView>
        <asp:EntityDataSource ID="dsUsers" runat="server" ConnectionString="name=TAAPsDBContext"
            DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True"
            EntitySetName="Users" Where="it.Role.ParentId = @RoleId" Include="Role" EntityTypeFilter="" Select="">
            <WhereParameters>
                <asp:SessionParameter Name="RoleId" SessionField="UserRoleId" Type="Int32" />
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
        <asp:EntityDataSource ID="edsRegions" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxOfficeRegions" Select="it.[RegionId], it.[RegionName]">
        </asp:EntityDataSource>
        <asp:SqlDataSource ID="dsTaxOffices" runat="server" ConnectionString="<%$ ConnectionStrings:TAAPsCon %>" SelectCommand="SELECT [TaxOfficeId], [TaxOfficeName] FROM [TaxOffices]"></asp:SqlDataSource>

</asp:Content>
