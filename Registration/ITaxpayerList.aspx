<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="ITaxpayerList.aspx.cs" Inherits="TAAPs.Registration.ITaxpayerList" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Individual Taxpayer
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Individual Taxpayers
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="panelHeading" runat="server">
    <div class="btn-group">
        <a class="btn btn-primary" href="#">
            <i class="glyphicon glyphicon-align-justify"></i>
            Individual Taxpayer List
        </a>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">

    <dx:ASPxGridView ID="TaxpayerGridView" runat="server" AutoGenerateColumns="False" DataSourceID="TaxpayerEntityServerModeDataSource" KeyFieldName="TIN" Width="100%">
<SettingsAdaptivity>
<AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
</SettingsAdaptivity>

        <SettingsPager>
            <PageSizeItemSettings Visible="True">
            </PageSizeItemSettings>
        </SettingsPager>
        <Settings ShowFilterRow="True" />
        <SettingsBehavior AllowEllipsisInText="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" FilterRowMode="OnClick" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <SettingsExport EnableClientSideExportAPI="True">
        </SettingsExport>

<EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="TIN" VisibleIndex="0">
                <DataItemTemplate>
                    <dx:ASPxButton ID="TINButton" runat="server" OnClick="TINButton_Click" RenderMode="Link" Text='<%# Eval("TIN") %>'>
                    </dx:ASPxButton>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NIN" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MiddleName" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="BirthDate" VisibleIndex="13">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy" EditFormat="Custom" EditFormatString="dd/mm/yyyy">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Source" FieldName="RecordSource" VisibleIndex="45">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="CreateDate" VisibleIndex="50" SortIndex="0" SortOrder="Descending">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="51">
            </dx:GridViewCommandColumn>
        </Columns>
        <Toolbars>
            <dx:GridViewToolbar ItemAlign="Right">
                <Items>
<dx:GridViewToolbarItem Text="Refresh" Command="Refresh" BeginGroup="True">
</dx:GridViewToolbarItem>
                    <dx:GridViewToolbarItem BeginGroup="True" Text="Grid Options">
                        <Items>
                            <dx:GridViewToolbarItem Command="ShowFilterRow" Text="Show Filter">
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Command="ShowFilterRowMenu" Text="Show Filter Menu">
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Command="ShowGroupPanel" Text="Group">
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbarItem>
                    <dx:GridViewToolbarItem BeginGroup="True" Text="Export" DisplayMode="Text">
                        <Items>
                            <dx:GridViewToolbarItem Command="ExportToPdf" Text="PDF">
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Xlsx">
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Command="ExportToXls" Text="xls">
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbarItem>
                </Items>
            </dx:GridViewToolbar>
        </Toolbars>
    </dx:ASPxGridView>

    <dx:EntityServerModeDataSource ID="TaxpayerEntityServerModeDataSource" runat="server" ContextTypeName="TAAPs.Model.TAAPsDBContext" OnSelecting="TaxpayerEntityServerModeDataSource_Selecting" TableName="ITaxpayers" />
</asp:Content>
