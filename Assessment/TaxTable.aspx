﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TaxTable.aspx.cs" Inherits="TAAPs.Assessment.TaxTable" %>
<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <dx:ASPxGridView ID="ASPxgvTaxTable" runat="server" AutoGenerateColumns="False" DataSourceID="edsTaxTable" KeyFieldName="TaxTableId">
        <SettingsEditing Mode="Batch">
        </SettingsEditing>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="TaxYear" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LowerBound" VisibleIndex="3">
                <PropertiesTextEdit DisplayFormatString="#,##0.00">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="UpperBound" VisibleIndex="4">
                <PropertiesTextEdit DisplayFormatString="#,##0.00">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaxRate" VisibleIndex="5" Caption="Rate (%)">
                <PropertiesTextEdit DisplayFormatString="D">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="TaxTypeId" VisibleIndex="2" Caption="Tax Type">
                <PropertiesComboBox DataSourceID="edsTaxTypes" TextField="TaxTypeName" ValueField="TaxTypeId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="TaxTableId" Visible="False" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
        </Columns>

<Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>
    <asp:EntityDataSource ID="edsTaxTable" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="TaxTables">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsTaxTypes" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxTypes" Select="it.[TaxTypeId], it.[TaxTypeName]">
    </asp:EntityDataSource>
</asp:Content>
