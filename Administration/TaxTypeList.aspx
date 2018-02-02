<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TaxTypeList.aspx.cs" Inherits="TAAPs.Administration.TaxTypeList" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <dx:ASPxGridView ID="ASPxgvTaxTypes" runat="server" AutoGenerateColumns="False" DataSourceID="dsTaxTypes" KeyFieldName="TaxTypeId" Width="100%" OnHtmlDataCellPrepared="ASPxgvTaxTypes_HtmlDataCellPrepared" OnCustomErrorText="ASPxgvTaxTypes_CustomErrorText">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="TaxTypeId" VisibleIndex="0" ReadOnly="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaxTypeName" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="FillingDueDate" VisibleIndex="2">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="LateFilingFlatFee" VisibleIndex="4">
                <PropertiesTextEdit DisplayFormatString="#,##0.00">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LateFilingRecurringFee" VisibleIndex="5">
                <PropertiesTextEdit DisplayFormatString="#,##0.00">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PaymentDueDays" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LatePaymentRate" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CreatedBy" ReadOnly="True" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="CreateDate" ReadOnly="True" VisibleIndex="11">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn FieldName="FillingFrequency" VisibleIndex="3">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="ANNUALLY" Value="ANNUALLY" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="LateFilingRecurringFeeFreq" VisibleIndex="6">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="MONTHLY" Value="MONTHLY" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="InterestRate" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior FilterRowMode="OnClick" />
        <SettingsEditing Mode="Batch">
        </SettingsEditing>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" ShowGroupButtons="False" />
        <SettingsDataSecurity AllowDelete="False" />
    </dx:ASPxGridView>
    <asp:EntityDataSource ID="dsTaxTypes" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="TaxTypes" EntityTypeFilter="TaxType" Include="User">

        <InsertParameters>
            <asp:SessionParameter Name="CreatedBy" Type="String" SessionField="UserName" />
        </InsertParameters>

    </asp:EntityDataSource>
</asp:Content>
