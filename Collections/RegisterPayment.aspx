<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="RegisterPayment.aspx.cs" Inherits="TAAPs.Collections.RegisterPayment" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Payment
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Register Payment
</asp:Content>



<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="edsIAssessment" KeyFieldName="AssessmentId" Width="100%">
        <SettingsAdaptivity AdaptivityMode="HideDataCells">
        </SettingsAdaptivity>
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="AssessmentId" ReadOnly="True" VisibleIndex="0" Caption="Assessment #">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssessmentYear" VisibleIndex="1" Caption="Year">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ITaxAccount.Itaxpayer.TIN" VisibleIndex="2" Caption="TIN">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ITaxAccount.TaxTypeId" VisibleIndex="4" Caption="Tax Type">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="GrossIncome" VisibleIndex="6">
                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ExemptAmount" VisibleIndex="7">
                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssessableIncome" VisibleIndex="8">
                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaxPayable" VisibleIndex="9">
                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Taxpayer Name" FieldName="ITaxAccount.ITaxpayer.TaxpayerName" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn UnboundType="String" VisibleIndex="10" Caption="Action">
                <PropertiesHyperLinkEdit NavigateUrlFormatString="https://62.173.33.147:8443/sfwpay/" Target="_blank" Text="Pay">
                </PropertiesHyperLinkEdit>
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" NavigateUrl="https://62.173.33.147:8443/sfwpay/" Target="_blank" Text="Pay" />
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
        </Columns>

        <Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>
    <asp:EntityDataSource ID="edsIAssessment" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="IAssessments" Include="ITaxAccount,ITaxAccount.ITaxpayer">
    </asp:EntityDataSource>
</asp:Content>
