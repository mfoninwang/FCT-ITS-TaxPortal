<%@ Page Title="" Language="C#" MasterPageFile="~/MainLayout.Master" AutoEventWireup="true" CodeBehind="TaxOfficeList.aspx.cs" Inherits="TAAPs.Administration.TaxOfficeList" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Administration
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Tax Offices
</asp:Content>



<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="edsTaxOffices" KeyFieldName="TaxOfficeId" OnCellEditorInitialize="ASPxGridView1_CellEditorInitialize" OnCustomErrorText="ASPxGridView1_CustomErrorText" Width="100%">
<SettingsAdaptivity>
<AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
</SettingsAdaptivity>

            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" />
            <SettingsDataSecurity AllowDelete="False" />
            <SettingsText PopupEditFormCaption="Edit Tax Office" />
            <EditFormLayoutProperties ColCount="2" ColumnCount="2">
            </EditFormLayoutProperties>
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="15" Width="100px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="TaxOfficeId" ReadOnly="True" VisibleIndex="0">
                    <PropertiesTextEdit>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField ErrorText="Required" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings CaptionLocation="Top" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TaxOfficeName" VisibleIndex="1">
                    <PropertiesTextEdit>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField ErrorText="Required" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings CaptionLocation="Top" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Street" VisibleIndex="6" Visible="False">
                    <PropertiesTextEdit>
                        <ValidationSettings ErrorDisplayMode="None">
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings CaptionLocation="Top" Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="City" Visible="False" VisibleIndex="7">
                    <EditFormSettings CaptionLocation="Top" Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LGAId" Visible="False" VisibleIndex="8">
                    <EditFormSettings CaptionLocation="Top" Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Telephone" Visible="False" VisibleIndex="9">
                    <EditFormSettings CaptionLocation="Top" Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TaxOfficerName" VisibleIndex="10" Caption="Tax Controller" Visible="False">
                    <EditFormSettings CaptionLocation="Top" Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TaxOfficerPhone" VisibleIndex="11" Visible="False">
                    <EditFormSettings CaptionLocation="Top" Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="IsActive" VisibleIndex="12" Width="100px" Caption="Active">
                    <EditFormSettings CaptionLocation="Top" />
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataDateColumn FieldName="CreateDate" ReadOnly="True" VisibleIndex="13">
                    <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                    </PropertiesDateEdit>
                    <EditFormSettings CaptionLocation="Top" Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="CreatedBy" ReadOnly="True" VisibleIndex="14" Visible="False">
                    <EditFormSettings CaptionLocation="Top" Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Region" FieldName="RegionId" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="edsRegions" TextField="RegionName" ValueField="RegionId">
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField ErrorText="Required" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                    <EditFormSettings CaptionLocation="Top" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Type" FieldName="TaxOfficeTypeId" VisibleIndex="4" Visible="False">
                    <PropertiesComboBox DataSourceID="edsTaxOfficeTypes" TextField="TaxOfficeTypeName" ValueField="TaxOfficeTypeId">
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField ErrorText="Required" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                    <EditFormSettings CaptionLocation="Top" Visible="True" />
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Toolbars>
                <dx:GridViewToolbar ItemAlign="Right">
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Text="Add New Tax Office">
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
        </dx:ASPxGridView>
        <asp:EntityDataSource ID="edsTaxOffices" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="TaxOffices">
            <InsertParameters>
                <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
            </InsertParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsRegions" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxOfficeRegions" Select="it.[RegionId], it.[RegionName]">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsTaxOfficeTypes" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxOfficeTypes" Select="it.[TaxOfficeTypeId], it.[TaxOfficeTypeName]">
        </asp:EntityDataSource>
</asp:Content>
