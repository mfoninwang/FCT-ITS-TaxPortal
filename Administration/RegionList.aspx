<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="RegionList.aspx.cs" Inherits="TAAPs.Administration.RegionList" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Administration
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Regions
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="panelHeading" runat="server">
    <div class="btn-group">
        <a class="btn btn-primary" href="#">
            <i class="glyphicon glyphicon-align-justify"></i>
            Region List
        </a>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
        <dx:ASPxGridView ID="ASPxgvRegions" runat="server" AutoGenerateColumns="False" DataSourceID="dsRegions" KeyFieldName="RegionId" Width="100%" OnHtmlDataCellPrepared="ASPxgvRegions_HtmlDataCellPrepared">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="RegionId" VisibleIndex="0">
                    <PropertiesTextEdit>
                        <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText">
                            <RequiredField ErrorText="Required" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RegionName" VisibleIndex="1">
                    <PropertiesTextEdit>
                        <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText">
                            <RequiredField ErrorText="Required" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings CaptionLocation="Top" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Coordinator" FieldName="TaxOfficerName" VisibleIndex="2">
                    <EditFormSettings CaptionLocation="Top" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Phone" FieldName="TaxOfficerPhone" VisibleIndex="3">
                    <EditFormSettings CaptionLocation="Top" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Email" FieldName="TaxOfficeEmail" VisibleIndex="4" Width="200px">
                    <EditFormSettings CaptionLocation="Top" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior AllowSelectSingleRowOnly="True" FilterRowMode="OnClick" />
            <SettingsEditing Mode="Batch">
            </SettingsEditing>
            <SettingsPopup>
                <EditForm HorizontalAlign="Center" Modal="True" VerticalAlign="TopSides" />
            </SettingsPopup>
            <SettingsDataSecurity AllowDelete="False" />
            <Toolbars>
                <dx:GridViewToolbar ItemAlign="Right">
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Text="Add New Region">
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
        </dx:ASPxGridView>
        <asp:EntityDataSource ID="dsRegions" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="TaxOfficeRegions">
            <InsertParameters>
                <asp:SessionParameter Name="CreatedBy" Type="String" SessionField="UserName" />
            </InsertParameters>

        </asp:EntityDataSource>
</asp:Content>
