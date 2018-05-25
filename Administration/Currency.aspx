<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="Currency.aspx.cs" Inherits="TAAPs.Administration.Currency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Administration
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Currencies
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="panelHeading" runat="server">
    <div class="btn-group">
        <a class="btn btn-primary" href="#">
            <i class="glyphicon glyphicon-align-justify"></i>
            Currency List
        </a>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">

        
        <dx:ASPxGridView ID="gvCurrency" runat="server" AutoGenerateColumns="False" DataSourceID="edsCurrency" KeyFieldName="CurrencyCode">
            <SettingsEditing Mode="Batch">
            </SettingsEditing>
            <SettingsDataSecurity AllowDelete="False" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CurrencyCode" ReadOnly="True" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Toolbars>
                <dx:GridViewToolbar ItemAlign="Right">
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Text="Add New Currency">
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
        </dx:ASPxGridView>
    <asp:EntityDataSource ID="edsCurrency" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Currencies">
        </asp:EntityDataSource>

</asp:Content>
