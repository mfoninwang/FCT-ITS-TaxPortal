<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="RevenueTargetList.aspx.cs" Inherits="TAAPs.Administration.RevenueTargetList" %>
<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <asp:EntityDataSource ID="dsTargets" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="RevenueTargets" EntityTypeFilter="RevenueTarget">
</asp:EntityDataSource>
<asp:EntityDataSource ID="dsTaxOffices" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxOffices" Select="it.[TaxOfficeId], it.[TaxOfficeName]" EntityTypeFilter="">
</asp:EntityDataSource>
    <dx:ASPxGridView ID="ASPxgvTargets" runat="server" AutoGenerateColumns="False" DataSourceID="dsTargets" KeyFieldName="TaxOfficeId;Year" Width="100%" OnCommandButtonInitialize="ASPxgvTargets_CommandButtonInitialize" OnCustomErrorText="ASPxgvTargets_CustomErrorText" OnHtmlDataCellPrepared="ASPxgvTargets_HtmlDataCellPrepared">
        <ClientSideEvents RowDblClick="function(s, e) {
}" />
        <Columns>
            <dx:GridViewCommandColumn ShowApplyFilterButton="True" ShowClearFilterButton="True" ShowNewButtonInHeader="True" VisibleIndex="9" ShowDeleteButton="True" Width="100px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Target" VisibleIndex="8">
                <PropertiesTextEdit DisplayFormatString="#,##0.00" DisplayFormatInEditMode="True">
                    <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                        <RegularExpression ErrorText="Only numeric values are allowed" ValidationExpression="^\d+([,\.]\d{1,2})?$" />
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditCellStyle HorizontalAlign="Right">
                </EditCellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Tax Office" FieldName="TaxOfficeId" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="dsTaxOffices" TextField="TaxOfficeName" ValueField="TaxOfficeId" EnableFocusedStyle="False">
                    <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="Year" VisibleIndex="5">
                <PropertiesTextEdit DisplayFormatString="g" MaxLength="4" EnableFocusedStyle="False">
                    <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText">
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditCellStyle HorizontalAlign="Right">
                </EditCellStyle>
            </dx:GridViewDataTextColumn>
        </Columns>
        <settingsbehavior allowselectsinglerowonly="True" filterrowmode="OnClick" AllowSelectByRowClick="True" />
        <settingsediting mode="Batch" NewItemRowPosition="Bottom">
        </settingsediting>
        <settings showfilterrow="True" showfilterrowmenu="True" showgrouppanel="True" ShowFilterBar="Visible" />
        <settingspopup>
            <editform horizontalalign="Center" modal="True" verticalalign="TopSides" />
        </settingspopup>
    </dx:ASPxGridView>
</asp:Content>
