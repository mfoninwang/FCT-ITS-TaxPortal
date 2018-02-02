<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Currency.aspx.cs" Inherits="TAAPs.Administration.Currency" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <asp:EntityDataSource ID="edsCurrency" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Currencies">
    </asp:EntityDataSource>
    <dx:ASPxGridView ID="gvCurrency" runat="server" AutoGenerateColumns="False" DataSourceID="edsCurrency" KeyFieldName="CurrencyCode">
        <SettingsEditing Mode="Batch">
        </SettingsEditing>
        <SettingsDataSecurity AllowDelete="False" />
        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="2" Width="100px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="CurrencyCode" ReadOnly="True" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
</asp:Content>
