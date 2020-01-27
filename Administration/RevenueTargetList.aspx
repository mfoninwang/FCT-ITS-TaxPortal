<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="RevenueTargetList.aspx.cs" Inherits="TAAPs.Administration.RevenueTargetList" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.Bootstrap.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Administration
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Revenue Targets
</asp:Content>




<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">

        <dx:ASPxGridView ID="ASPxgvTargets" runat="server" AutoGenerateColumns="False" DataSourceID="dsTargets" KeyFieldName="TaxOfficeId;Year" Width="100%" OnCommandButtonInitialize="ASPxgvTargets_CommandButtonInitialize" OnCustomErrorText="ASPxgvTargets_CustomErrorText" OnHtmlDataCellPrepared="ASPxgvTargets_HtmlDataCellPrepared">
            <ClientSideEvents RowDblClick="function(s, e) {
}" />
            <Columns>
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
            <SettingsBehavior AllowSelectSingleRowOnly="True" AllowSelectByRowClick="True" />
            <SettingsEditing Mode="Batch">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <SettingsPopup>
                <EditForm HorizontalAlign="Center" Modal="True" VerticalAlign="TopSides" />
            </SettingsPopup>
            <Toolbars>
                <dx:GridViewToolbar ItemAlign="Right">
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Text="Add Revenue Target">
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
        </dx:ASPxGridView>

        <asp:EntityDataSource ID="dsTargets" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="RevenueTargets" EntityTypeFilter="RevenueTarget">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="dsTaxOffices" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxOffices" Select="it.[TaxOfficeId], it.[TaxOfficeName]" EntityTypeFilter="">
        </asp:EntityDataSource>
</asp:Content>
