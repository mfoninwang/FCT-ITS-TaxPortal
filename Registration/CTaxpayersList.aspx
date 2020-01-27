<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="CTaxpayersList.aspx.cs" Inherits="TAAPs.Registration.CTaxpayersList" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Xpo.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Xpo" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        var addressState = null;
        var addressCountry = null;

        function OnStateChanged(control) {
            switch (control) {
                case addressStateCombo:
                    if (addressLgaCombo.InCallback())
                        addressState = addressStateCombo.GetValue().toString();
                    else
                        addressLgaCombo.PerformCallback(addressStateCombo.GetValue().toString());
                    break;
                case addressCountryCombo:
                    if (addressStateCombo.InCallback())
                        addressCountry = addressCountryCombo.GetValue().toString();
                    else
                        addressStateCombo.PerformCallback(addressCountryCombo.GetValue().toString());
                    break;
            }
        }

        function OnEndCallback(s) {
            switch (s) {
                case addressLgaCombo:
                    if (addressState) {
                        addressStateCombo.PerformCallback(addressState);
                        addressState = null;
                    }
                case addressStateCombo:
                    if (addressCountry) {
                        addressCountryCombo.PerformCallback(addressCountry);
                        addressCountry = null;
                    }
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Corporate Taxpayer
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Corporate Taxpayers
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">

    <asp:MultiView ID="TaxpayerMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <dx:ASPxGridView ID="TaxpayerGridview" runat="server" AutoGenerateColumns="False" DataSourceID="TaxpayersEntityServerModeDataSource" KeyFieldName="TIN">
                <SettingsAdaptivity>
                    <AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
                </SettingsAdaptivity>

                <Settings ShowFilterRow="True" />

                <SettingsExport EnableClientSideExportAPI="True">
                </SettingsExport>

                <EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
                <Columns>
                    <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="27">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="TIN" VisibleIndex="0">
                        <DataItemTemplate>
                            <dx:ASPxButton ID="TinButton" runat="server" RenderMode="Link" Text='<%# Eval("TIN") %>' OnClick="TinButton_Click">
                            </dx:ASPxButton>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CacNumber" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BNNumber" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="RegistrationDate" VisibleIndex="9">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="CreateDate" SortIndex="0" SortOrder="Descending" VisibleIndex="26">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Business Line" FieldName="BusinessLine.BusinessLineName" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Toolbars>
                    <dx:GridViewToolbar ItemAlign="Right">
                        <Items>
                            <dx:GridViewToolbarItem Command="Refresh" Text="Refresh">
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem BeginGroup="True" Text="Export">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToPdf" Text="PDF">
                                    </dx:GridViewToolbarItem>
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Xlsx">
                                    </dx:GridViewToolbarItem>
                                </Items>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
            </dx:ASPxGridView>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <dx:ASPxFormLayout ID="CTaxpayerForm" runat="server" ColCount="2" Width="100%" ColumnCount="2">
                <Items>
                    <dx:LayoutItem ColSpan="1" FieldName="TIN">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" Width="100%" ReadOnly="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="CacNumber">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E2" runat="server" ReadOnly="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="BNNumber" Caption="Business Name Number">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E3" runat="server" ReadOnly="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="CompanyTypeId" Caption="Company Type">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="CompanyTypeCombo" runat="server" ReadOnly="True">
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="PreviousFCTTin">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E5" runat="server">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="FIRSTIN">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E6" runat="server">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="JTBTIN">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E7" runat="server">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="CompanyName">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E8" runat="server" ReadOnly="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="BusinessLineId" Caption="Business Line">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="BusinessLineCombo" runat="server">
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="TaxOfficeId" Caption="Tax Office">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E10" runat="server" ReadOnly="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="RegistrationDate">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="ASPxFormLayout1_E11" runat="server">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="CommencementDate">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="ASPxFormLayout1_E12" runat="server" ReadOnly="True">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="RegisteredAddressStreetNo">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E13" runat="server">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="RegisteredAddressStreet">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E14" runat="server">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="RegisteredAddressCity">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E15" runat="server">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="RegisteredAddressCountryId" Caption="Registered Address Country">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="AddressCountryCombo" runat="server" ClientInstanceName="addressCountryCombo">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	OnStateChanged(s);
}" />
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="RegisteredAddressStateId" Caption="Registered Address State">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="AddressStateCombo" runat="server" OnCallback="AddressStateCombo_Callback" ClientInstanceName="addressStateCombo">
                                    <ClientSideEvents EndCallback="function(s, e) {
	OnEndCallback(s);
}"
                                        SelectedIndexChanged="function(s, e) {
	OnStateChanged(s);
}" />
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="RegisteredAddressLgaId" Caption="Registered Address Lga">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="AddressLgaCombo" runat="server" OnCallback="AddressLgaCombo_Callback" ClientInstanceName="addressLgaCombo">
                                    <ClientSideEvents EndCallback="function(s, e) {
OnEndCallback(s);	
}" />
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="PrimaryPhone">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E19" runat="server">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="SecondaryPhone">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E20" runat="server">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="Email">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E21" runat="server">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="Website">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E22" runat="server">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="ContactPerson">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E23" runat="server">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="ContactPersonPhone">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E24" runat="server">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="RecordSource">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E25" runat="server" ReadOnly="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="TaxAuthority">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E26" runat="server" ReadOnly="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="CreatedBy">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E27" runat="server" ReadOnly="True">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="1" FieldName="CreateDate">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="ASPxFormLayout1_E28" runat="server" ReadOnly="True">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
                <SettingsItemCaptions Location="Top" />
            </dx:ASPxFormLayout>
            <hr />
            <dx:ASPxButton ID="BackToListButton" runat="server" Text="Back to List" OnClick="BackToListButton_Click" RenderMode="Link"></dx:ASPxButton>
            <div class="text-right">
                <dx:ASPxButton ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click"></dx:ASPxButton>
                <dx:ASPxButton ID="CancelButton" runat="server" Text="Cancel" AutoPostBack="False" CausesValidation="False" OnClick="CancelButton_Click"></dx:ASPxButton>
            </div>
        </asp:View>
    </asp:MultiView>

    <dx:EntityServerModeDataSource ID="TaxpayersEntityServerModeDataSource" runat="server" ContextTypeName="TAAPs.Model.TAAPsDBContext" OnSelecting="TaxpayersEntityServerModeDataSource_Selecting" TableName="CTaxpayers" />

</asp:Content>
