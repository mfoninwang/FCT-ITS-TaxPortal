﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="RegionList.aspx.cs" Inherits="TAAPs.Administration.RegionList" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <dx:ASPxGridView ID="ASPxgvRegions" runat="server" AutoGenerateColumns="False" DataSourceID="dsRegions" KeyFieldName="RegionId" Width="100%" OnHtmlDataCellPrepared="ASPxgvRegions_HtmlDataCellPrepared">
        <Columns>
            <dx:GridViewCommandColumn ShowApplyFilterButton="True" ShowClearFilterButton="True" ShowNewButtonInHeader="True" VisibleIndex="5">
            </dx:GridViewCommandColumn>
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
            <dx:GridViewDataTextColumn Caption="Email" FieldName="TaxOfficeEmail" VisibleIndex="4">
                <EditFormSettings CaptionLocation="Top" />
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowSelectSingleRowOnly="True" FilterRowMode="OnClick" />
        <SettingsEditing Mode="Batch" NewItemRowPosition="Bottom">
        </SettingsEditing>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" ShowPreview="True" />
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" Modal="True" VerticalAlign="TopSides" />
        </SettingsPopup>
        <SettingsDataSecurity AllowDelete="False" />
    </dx:ASPxGridView>
    <asp:EntityDataSource ID="dsRegions" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="TaxOfficeRegions">
        <InsertParameters>
            <asp:SessionParameter Name="CreatedBy" Type="String" SessionField="UserName"  />
        </InsertParameters>

    </asp:EntityDataSource>
</asp:Content>
