<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CTaxpayersList.aspx.cs" Inherits="TAAPs.Registration.CTaxpayersList" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Xpo.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Xpo" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>







<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <script type="text/javascript">

        var windowId;
        var lastState = null;

        function OnCustomButtonClick(s, e) {

            if (e.buttonID == 'btnTransfer') {
                windowId = 0;
                mastergrid.GetRowValues(e.visibleIndex, 'TIN;CompanyName', OnGetRowValues);
            }
            else if (e.buttonID == 'btnBranches') {
                windowId = 1;
                mastergrid.GetRowValues(e.visibleIndex, 'TIN;CompanyName', OnGetRowValues);
            }
        }

        function OnGetRowValues(keyValue) {
            var tin = keyValue[0];
            var taxpayername = keyValue[1];

            if (windowId == 0) var headertext = 'Transfer Taxpayer - ' + taxpayername + ' - ' + tin;
            else if (windowId == 1) var headertext = 'Branches for - ' + taxpayername + ' - ' + tin;

            var window = popup.GetWindow(windowId);
            window.SetHeaderText(headertext);

            popup.ShowWindow(window);
            popup.PerformWindowCallback(window, tin); // This is used only when there's are multiple window in the popoup control
        }

        function HidePopUp(index) {
            popup.HideWindow(popup.GetWindow(index));
        }

        function OnStateChanged(state) {
            if (lga.InCallback())
                lastState = state.GetValue().toString();
            else lga.PerformCallback(state.GetValue().toString());
        }

        function OnEndLGACallback(s, e) {
            if (lastState) {
                lga.PerformCallback(lastState);
                lastState = null;
            }
        }
    </script>


    <dx:ASPxGridView ID="ASPxgvCTaxpayers" runat="server" AutoGenerateColumns="False" DataSourceID="edsCTaxpayers" KeyFieldName="TIN" Width="100%" ClientInstanceName="mastergrid" OnCustomButtonInitialize="ASPxgvCTaxpayers_CustomButtonInitialize" OnCommandButtonInitialize="ASPxgvCTaxpayers_CommandButtonInitialize" OnRowUpdating="ASPxgvCTaxpayers_RowUpdating" OnCustomErrorText="ASPxgvCTaxpayers_CustomErrorText" OnStartRowEditing="ASPxgvCTaxpayers_StartRowEditing" OnHtmlEditFormCreated="ASPxgvCTaxpayers_HtmlEditFormCreated">
        <ClientSideEvents
            CustomButtonClick="OnCustomButtonClick" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="TIN" ReadOnly="True" VisibleIndex="0" Width="150px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NewTIN" VisibleIndex="1" Width="150px" Caption="JTB TIN">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="RCNo" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowApplyFilterButton="True" ShowCancelButton="True" ShowClearFilterButton="True" ShowEditButton="True" VisibleIndex="24" Width="150px">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btnTransfer" Text="Transfers">
                    </dx:GridViewCommandColumnCustomButton>
                    <dx:GridViewCommandColumnCustomButton ID="btnBranches" Text="Branches">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataComboBoxColumn FieldName="BusLine" VisibleIndex="5" Caption="Business Line">
                <PropertiesComboBox DataSourceID="dsBusinessLines" TextField="BusinessLineName" ValueField="BusinessLineId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Tax Office " FieldName="TaxOfficeName" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" EnableCustomizationWindow="True" FilterRowMode="OnClick" />
        <SettingsPager PageSize="15" ShowSeparators="True">
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm">
            <BatchEditSettings StartEditAction="DblClick" />
        </SettingsEditing>
        <Settings ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" UseFixedTableLayout="True" />
        <SettingsText CommandEdit="Edit" PopupEditFormCaption="Edit Corporate Taxpayer" />
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
        <SettingsPopup>
            <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="Middle" />
        </SettingsPopup>
        <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
        <Templates>
            <EditForm>
                <dx:ASPxFormLayout ID="formLayout" runat="server" AlignItemCaptions="False" ShowItemCaptionColon="False" Width="100%">
                    <Items>
                        <dx:LayoutGroup Caption="General Information" ColCount="3">
                            <Items>
                                <dx:LayoutItem FieldName="TIN">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" BackColor="#CCCCCC" ReadOnly="True" Text='<%# Eval("TIN") %>' Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="NewTIN" Caption="JTB TIN">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E2" runat="server" BackColor="#CCCCCC" ReadOnly="True" Text='<%# Eval("NewTIN") %>' Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="RCNo">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E3" runat="server" Text='<%# Eval("RCNo") %>' Width="100%" ReadOnly="True">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ColSpan="3" FieldName="CompanyName">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E5" runat="server" Text='<%# Eval("CompanyName") %>' Width="100%" ReadOnly="True">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Business Line" ColSpan="3" FieldName="BusLine">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ASPxFormLayout1_E13" runat="server" DataSourceID="dsBusinessLines" TextField="BusinessLineName" Value='<%# Eval("BusLine") %>' ValueField="BusinessLineId" Width="100%">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Other Details" ColCount="4">
                            <Items>
                                <dx:LayoutItem FieldName="DateOfIncorporation">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxDateEdit ID="ASPxFormLayout1_E6" runat="server" Value='<%# Eval("DateOfIncorporation") %>' Width="100%">
                                            </dx:ASPxDateEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="DateOfCommencement">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxDateEdit ID="ASPxFormLayout1_E7" runat="server" Value='<%# Eval("DateOfCommencement") %>' Width="100%">
                                            </dx:ASPxDateEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="FinancialYearBegin">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ASPxFormLayout1_E10" runat="server" Value='<%# Eval("FinancialYearBegin") %>' Width="100%">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="FinancialYearEnd">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ASPxFormLayout1_E20" runat="server" Value='<%# Eval("FinancialYearEnd") %>' Width="100%">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:TabbedLayoutGroup Width="100%" ActiveTabIndex="5">
                            <Items>
                                <dx:LayoutGroup Caption="Banks">
                                    <Items>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxGridView ID="ASPxGridViewBanks" runat="server" AutoGenerateColumns="False" DataSourceID="edsCBanks" KeyFieldName="TIN;BankCode" Width="100%" OnCustomErrorText="ASPxGridViewBanks_CustomErrorText">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="TIN" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="AccountNumber" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                <PropertiesTextEdit>
                                                                    <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                                <EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="CreatedBy" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                <EditFormSettings CaptionLocation="Top" Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="CreateDate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy"></PropertiesDateEdit>
                                                                <EditFormSettings CaptionLocation="Top" Visible="False" />
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="6">
                                                            </dx:GridViewCommandColumn>
                                                            <dx:GridViewDataComboBoxColumn Caption="Bank" FieldName="BankCode" ShowInCustomizationForm="True" VisibleIndex="1" Width="200px">
                                                                <PropertiesComboBox DataSourceID="edsBankList" TextField="BankName" ValueField="BankCode">
                                                                    <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </PropertiesComboBox>
                                                                <EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
                                                            </dx:GridViewDataComboBoxColumn>
                                                        </Columns>
                                                        <SettingsEditing Mode="Batch">
                                                        </SettingsEditing>
                                                    </dx:ASPxGridView>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Directors">
                                    <Items>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxGridView ID="ASPxGridViewIncomeSources" runat="server" AutoGenerateColumns="False" DataSourceID="edsCDirectors" KeyFieldName="TIN;DirectorName" Width="100%">
                                                        <Columns>
                                                            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="6">
                                                            </dx:GridViewCommandColumn>
                                                            <dx:GridViewDataTextColumn FieldName="TIN" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="DirectorName" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                <PropertiesTextEdit>
                                                                    <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                                <EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="CreatedBy" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="CreateDate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataMemoColumn FieldName="DirectorAddress" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                <EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
                                                            </dx:GridViewDataMemoColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowSelectByRowClick="True" ConfirmDelete="True" />
                                                        <SettingsEditing NewItemRowPosition="Bottom">
                                                        </SettingsEditing>
                                                        <SettingsDataSecurity AllowEdit="False" />
                                                    </dx:ASPxGridView>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Associated Companies">
                                    <Items>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxGridView ID="ASPxGridViewCompanies" runat="server" AutoGenerateColumns="False" DataSourceID="edsCompanies" KeyFieldName="TIN;CompanyName" Width="100%">
                                                        <Columns>
                                                            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="6">
                                                            </dx:GridViewCommandColumn>
                                                            <dx:GridViewDataTextColumn FieldName="TIN" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="CompanyName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                <PropertiesTextEdit>
                                                                    <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                                <EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="CreatedBy" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="CreateDate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                                                                </PropertiesDateEdit>
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataMemoColumn FieldName="CompanyAddress" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                <EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
                                                            </dx:GridViewDataMemoColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowSelectSingleRowOnly="True" ConfirmDelete="True" />
                                                        <SettingsEditing NewItemRowPosition="Bottom">
                                                        </SettingsEditing>
                                                        <SettingsDataSecurity AllowEdit="False" />
                                                    </dx:ASPxGridView>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Representatives">
                                    <Items>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxGridView ID="ASPxGridViewRepresentatives" runat="server" AutoGenerateColumns="False" DataSourceID="edsRepresentatives" KeyFieldName="TIN;RepresentativeName" Width="100%" OnCustomErrorText="ASPxGridViewRepresentatives_CustomErrorText">
                                                        <Columns>
                                                            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="7">
                                                            </dx:GridViewCommandColumn>
                                                            <dx:GridViewDataTextColumn FieldName="TIN" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="RepresentativeName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                <PropertiesTextEdit>
                                                                    <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                                <EditFormSettings CaptionLocation="Top" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="RepresentativeType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="CreatedBy" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="CreateDate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6">
                                                                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                                                                </PropertiesDateEdit>
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataMemoColumn FieldName="Address" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                <EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
                                                            </dx:GridViewDataMemoColumn>
                                                        </Columns>
                                                        <SettingsBehavior ConfirmDelete="True" />
                                                        <SettingsEditing EditFormColumnCount="1">
                                                        </SettingsEditing>
                                                        <SettingsDataSecurity AllowEdit="False" />
                                                    </dx:ASPxGridView>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Shareholders">
                                    <Items>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxGridView ID="ASPxGridViewRepresentatives0" runat="server" AutoGenerateColumns="False" DataSourceID="edsCShareholders" KeyFieldName="TIN;ShareHolderName" OnCustomErrorText="ASPxGridViewRepresentatives_CustomErrorText" Width="100%">
                                                        <Columns>
                                                            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="7">
                                                            </dx:GridViewCommandColumn>
                                                            <dx:GridViewDataTextColumn FieldName="TIN" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Shareholder Name" FieldName="ShareHolderName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                <PropertiesTextEdit>
                                                                    <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                                <EditFormSettings CaptionLocation="Top" ColumnSpan="1" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="ShareVolume" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                <PropertiesTextEdit>
                                                                    <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                                <EditFormSettings CaptionLocation="Top" ColumnSpan="1" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="CreatedBy" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="CreateDate" ShowInCustomizationForm="True" VisibleIndex="6">
                                                                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                                                                </PropertiesDateEdit>
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataMemoColumn Caption="Address" FieldName="ShareHolderAddress" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                <EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
                                                            </dx:GridViewDataMemoColumn>
                                                        </Columns>
                                                        <SettingsBehavior ConfirmDelete="True" />
                                                        <SettingsEditing EditFormColumnCount="1">
                                                        </SettingsEditing>
                                                        <SettingsDataSecurity AllowEdit="False" />
                                                    </dx:ASPxGridView>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx1:LayoutGroup Caption="Attachments">
                                    <Items>
                                        <dx1:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx1:LayoutItemNestedControlContainer runat="server">
                                                    <dx1:ASPxGridView ID="gridAttachments" runat="server" AutoGenerateColumns="False" DataSourceID="edsAttachments" KeyFieldName="FileId" OnCustomErrorText="gridAttachments_CustomErrorText" OnRowInserting="gridAttachments_RowInserting">
                                                        <SettingsEditing Mode="PopupEditForm">
                                                        </SettingsEditing>
                                                        <SettingsDataSecurity AllowEdit="False" />
                                                        <SettingsPopup>
                                                            <EditForm Modal="True" VerticalAlign="TopSides" />
                                                        </SettingsPopup>
                                                        <SettingsText PopupEditFormCaption="Add Attachment" />
                                                        <StylesPopup>
                                                            <EditForm>
                                                                <PopupControl Spacing="10px" VerticalAlign="Top">
                                                                    <Paddings PaddingTop="100px" />
                                                                </PopupControl>
                                                                <MainArea>
                                                                    <Paddings Padding="20px" />
                                                                </MainArea>
                                                                <ControlStyle Spacing="10px" VerticalAlign="Top">
                                                                <Paddings PaddingTop="100px" />
                                                                </ControlStyle>
                                                                <Footer>
                                                                    <Paddings PaddingBottom="20px" PaddingTop="10px" />
                                                                </Footer>
                                                                <Header Font-Bold="True" Font-Size="16pt">
                                                                    <Paddings PaddingBottom="5px" PaddingTop="20px" />
                                                                </Header>
                                                            </EditForm>
                                                        </StylesPopup>
                                                        <EditFormLayoutProperties>
                                                            <Items>
                                                                <dx1:GridViewColumnLayoutItem ColumnName="FileDescription">
                                                                </dx1:GridViewColumnLayoutItem>
                                                                <dx1:GridViewColumnLayoutItem ColumnName="FileContent">
                                                                </dx1:GridViewColumnLayoutItem>
                                                                <dx1:EditModeCommandLayoutItem HorizontalAlign="Right">
                                                                </dx1:EditModeCommandLayoutItem>
                                                            </Items>
                                                            <SettingsItemCaptions Location="Top" />
                                                            <SettingsItems VerticalAlign="Top" />
                                                        </EditFormLayoutProperties>
                                                        <Columns>
                                                            <dx1:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="6" Width="100px">
                                                            </dx1:GridViewCommandColumn>
                                                            <dx1:GridViewDataTextColumn FieldName="FileId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                            </dx1:GridViewDataTextColumn>
                                                            <dx1:GridViewDataTextColumn FieldName="FileName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                <Settings AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowFilterRowMenuLikeItem="False" ShowInFilterControl="False" />
                                                                <EditFormSettings Caption="File Name" CaptionLocation="Top" />
                                                                <DataItemTemplate>
                                                                    <dx1:ASPxButton ID="btnButtton" runat="server" CommandArgument='<%# Eval("FileId") %>' CommandName="Download" OnClick="btnButtton_Click" RenderMode="Link" Text='<%# Eval("FileName") %>' UseSubmitBehavior="False">
                                                                    </dx1:ASPxButton>
                                                                </DataItemTemplate>
                                                            </dx1:GridViewDataTextColumn>
                                                            <dx1:GridViewDataTextColumn FieldName="FileDescription" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                <PropertiesTextEdit>
                                                                    <ValidationSettings>
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                            </dx1:GridViewDataTextColumn>
                                                            <dx1:GridViewDataDateColumn FieldName="CreateDate" ShowInCustomizationForm="True" VisibleIndex="5" Width="100px">
                                                            </dx1:GridViewDataDateColumn>
                                                            <dx1:GridViewDataTextColumn FieldName="FileType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                                            </dx1:GridViewDataTextColumn>
                                                            <dx1:GridViewDataTextColumn FieldName="FileContent" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                                                <EditFormSettings Visible="True" />
                                                                <EditItemTemplate>
                                                                    <dx1:ASPxUploadControl ID="ucUploadFile" runat="server" OnFileUploadComplete="ucUploadFile_FileUploadComplete" ShowUploadButton="True">
                                                                        <ValidationSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png, .doc, .docx, .xls, .xlsx, .pdf">
                                                                        </ValidationSettings>
                                                                    </dx1:ASPxUploadControl>
                                                                </EditItemTemplate>
                                                            </dx1:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx1:ASPxGridView>
                                                </dx1:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx1:LayoutItem>
                                    </Items>
                                </dx1:LayoutGroup>
                            </Items>
                            <SettingsItemCaptions Location="Top" />
                        </dx:TabbedLayoutGroup>

                    </Items>
                    <SettingsItemCaptions Location="Top" />
                </dx:ASPxFormLayout>

                <div style="text-align: right; padding: 10px 10px 10px 10px;">
                    <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                        runat="server" ColumnID=""></dx:ASPxGridViewTemplateReplacement>
                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                        runat="server"></dx:ASPxGridViewTemplateReplacement>
                </div>

            </EditForm>
        </Templates>
    </dx:ASPxGridView>
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" AllowDragging="True" ClientInstanceName="popup" FooterText="" HeaderText="" Modal="True" OnWindowCallback="ASPxPopupControl1_WindowCallback" ShowPinButton="True" Width="900px" CloseAction="CloseButton" PopupHorizontalAlign="Center" PopupVerticalAlign="Middle" ShowFooter="True">
        <Windows>
            <dx:PopupWindow Modal="True" Name="transferpopup" MinWidth="900px" Width="100%">
                <HeaderStyle Font-Bold="True"></HeaderStyle>
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxGridView ID="ASPxGridViewTransfers" runat="server" AutoGenerateColumns="False" DataSourceID="edsTransfers" KeyFieldName="TransferId" OnCustomErrorText="ASPxGridViewTransfers_CustomErrorText" OnInitNewRow="ASPxGridViewTransfers_InitNewRow" PreviewFieldName="Reason" Width="100%" OnRowInserted="ASPxGridViewTransfers_RowInserted" OnCancelRowEditing="ASPxGridViewTransfers_CancelRowEditing">
                            <ClientSideEvents EndCallback="function(s, e) {
	if (s.cpIsInserted == true || s.cpIsCancelled == true) HidePopUp(0);
}" />
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="TransferId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="TIN" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <EditFormSettings CaptionLocation="Top" Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="CreatedBy" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="17">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="CreateDate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="18">
                                    <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                                    </PropertiesDateEdit>
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="19">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataComboBoxColumn Caption="To Tax Office" FieldName="ToTaxOfficeId" ShowInCustomizationForm="True" VisibleIndex="13">
                                    <PropertiesComboBox DataSourceID="edsTaxOffices" EnableFocusedStyle="False" IncrementalFilteringMode="Contains" TextField="TaxOfficeName" ValueField="TaxOfficeId">
                                        <ValidationSettings CausesValidation="True" EnableCustomValidation="True" ErrorDisplayMode="ImageWithText">
                                            <RequiredField ErrorText="Required" IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesComboBox>
                                    <EditFormSettings Caption="Transfer To Tax Office" CaptionLocation="Top" />
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataMemoColumn Caption="Reason for Transfer" FieldName="Reason" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                    <PropertiesMemoEdit>
                                        <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText">
                                            <RequiredField ErrorText="Required" IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesMemoEdit>
                                    <EditFormSettings CaptionLocation="Top" ColumnSpan="3" RowSpan="4" Visible="True" />
                                </dx:GridViewDataMemoColumn>
                                <dx:GridViewDataComboBoxColumn Caption="From Tax Office" FieldName="FromTaxOfficeId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <PropertiesComboBox DataSourceID="edsTaxOffices" DropDownRows="1" DropDownStyle="DropDown" TextField="TaxOfficeName" ValueField="TaxOfficeId">
                                        <DropDownButton Enabled="False" Visible="False">
                                        </DropDownButton>
                                    </PropertiesComboBox>
                                    <EditFormSettings CaptionLocation="Top" Visible="True" />
                                </dx:GridViewDataComboBoxColumn>
                            </Columns>
                            <SettingsBehavior AllowSelectByRowClick="True" />
                            <Settings ShowPreview="True" />
                            <SettingsPopup>
                                <EditForm HorizontalAlign="Center" Modal="True" VerticalAlign="WindowCenter" />
                            </SettingsPopup>
                            <SettingsCommandButton>
                                <UpdateButton Text="Transfer">
                                </UpdateButton>
                            </SettingsCommandButton>
                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" />
                        </dx:ASPxGridView>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:PopupWindow>
            <dx:PopupWindow MinWidth="900px" Modal="True" Name="Branchespopup" ShowPageScrollbarWhenModal="True" Width="100%">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxGridView ID="ASPxgvBranches" runat="server" AutoGenerateColumns="False" DataSourceID="edsBranches" KeyFieldName="BranchTIN" Width="100%" OnRowUpdating="ASPxgvBranches_RowUpdating" OnCustomErrorText="ASPxgvBranches_CustomErrorText">
                            <Columns>
                                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="9">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="BranchTIN" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="NewTIN" ShowInCustomizationForm="True" VisibleIndex="1" ReadOnly="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="BranchName" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="OfficeStatus" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Type">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Tax Office" FieldName="TaxOffice.TaxOfficeName" ShowInCustomizationForm="True" VisibleIndex="6" ReadOnly="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Email" FieldName="Email" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                    <PropertiesTextEdit>
                                        <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                            <RegularExpression ErrorText="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                            <RequiredField ErrorText="Required" IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesTextEdit>
                                    <EditFormSettings ColumnSpan="2" Visible="True" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                            <SettingsEditing Mode="PopupEditForm">
                            </SettingsEditing>
                            <SettingsPopup>
                                <EditForm HorizontalAlign="Center" Modal="True" VerticalAlign="WindowCenter" />
                            </SettingsPopup>
                            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                            <Templates>
                                <EditForm>
                                    <dx:ASPxFormLayout ID="BranchFormLayout" runat="server" Width="900px">
                                        <Items>
                                            <dx:LayoutGroup ColCount="4" Caption="Branch Detail" Width="100%">
                                                <Items>
                                                    <dx:LayoutItem FieldName="BranchTIN">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" Text='<%# Eval("BranchTIN") %>' ReadOnly="True" Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem FieldName="NewTIN">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E2" runat="server" Width="100%" Text='<%# Eval("NewTIN") %>' ReadOnly="True">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem FieldName="CorporateTIN">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E4" runat="server" Width="100%" Text='<%# Eval("CorporateTIN") %>' ReadOnly="True">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Office Type" FieldName="OfficeStatus">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" Value='<%# Eval("OfficeStatus") %>'>
                                                                    <Items>
                                                                        <dx:ListEditItem Text="Head Office" Value="HQ" />
                                                                        <dx:ListEditItem Text="Branch Office" Value="BR" />
                                                                    </Items>
                                                                    <ValidationSettings CausesValidation="True" SetFocusOnError="True">
                                                                        <RequiredField ErrorText="Required" IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxComboBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem ColSpan="4" FieldName="BranchName" RequiredMarkDisplayMode="Required">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E5" runat="server" Width="100%" ValidationSettings-ValidationGroup="<%# (Container.NamingContainer as GridViewEditFormTemplateContainer).ValidationGroup %>" Text='<%# Eval("BranchName") %>'>
                                                                    <ValidationSettings CausesValidation="True" SetFocusOnError="True">
                                                                        <RequiredField ErrorText="Required" IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Tax Office" ColSpan="2" FieldName="TaxOfficeId">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E6" runat="server" Width="100%" Text='<%# Eval("TaxOfficeId") %>' ReadOnly="True">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem FieldName="RegDate">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxDateEdit ID="ASPxFormLayout1_E19" runat="server" Value='<%# Eval("RegDate") %>'>
                                                                </dx:ASPxDateEdit>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem FieldName="Status">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxCheckBox ID="ASPxFormLayout1_E20" runat="server" CheckState="Unchecked" Width="100%">
                                                                </dx:ASPxCheckBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                            <dx:LayoutGroup Caption="Address" ColCount="2">
                                                <Items>
                                                    <dx:LayoutGroup ColCount="2" ShowCaption="False">
                                                        <Items>
                                                            <dx:LayoutItem FieldName="StreetNo">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E8" runat="server" Width="100%" Text='<%# Eval("StreetNo") %>'>
                                                                        </dx:ASPxTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem FieldName="City">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E10" runat="server" Width="100%" Text='<%# Eval("City") %>'>
                                                                        </dx:ASPxTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem ColSpan="2" FieldName="Street" RequiredMarkDisplayMode="Required">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E9" runat="server" ValidationSettings-ValidationGroup="<%# (Container.NamingContainer as GridViewEditFormTemplateContainer).ValidationGroup %>" Width="100%" Text='<%# Eval("Street") %>'>
                                                                            <ValidationSettings CausesValidation="True">
                                                                                <RequiredField ErrorText="Required" IsRequired="True" />
                                                                            </ValidationSettings>
                                                                        </dx:ASPxTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="State" FieldName="State" RequiredMarkDisplayMode="Required">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxComboBox ID="BranchFormLayout_E1" runat="server" DataSourceID="edsStates" ValidationSettings-ValidationGroup="<%# (Container.NamingContainer as GridViewEditFormTemplateContainer).ValidationGroup %>"
                                                                            TextField="StateName" Value='<%# Eval("State") %>' ValueField="StateName" ClientInstanceName="state">
                                                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	OnStateChanged(s);
}" />
                                                                            <ValidationSettings CausesValidation="True">
                                                                                <RequiredField ErrorText="Required" IsRequired="True" />
                                                                            </ValidationSettings>
                                                                        </dx:ASPxComboBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem Caption="LGA" FieldName="LGA" RequiredMarkDisplayMode="Required">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxComboBox ID="ASPxComboBoxLga" runat="server" OnCallback="ASPxComboBoxLga_Callback" OnLoad="ASPxComboBoxLga_Load" ClientInstanceName="lga" Value='<%# Eval("LGA") %>' DataSourceID="edsLgas" TextField="LGAName" ValueField="LGAName">
                                                                            <ClientSideEvents EndCallback="function(s, e) {
	OnEndLGACallback
}" />
                                                                            <ValidationSettings CausesValidation="True">
                                                                                <RequiredField ErrorText="Required" IsRequired="True" />
                                                                            </ValidationSettings>
                                                                        </dx:ASPxComboBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                        </Items>
                                                    </dx:LayoutGroup>
                                                    <dx:LayoutGroup ShowCaption="False" ColCount="2">
                                                        <Items>
                                                            <dx:LayoutItem FieldName="Email" ColSpan="2" RequiredMarkDisplayMode="Required">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement1" runat="server" ColumnID="Email" ReplacementType="EditFormCellEditor" />
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem FieldName="Phone1" ColSpan="2" RequiredMarkDisplayMode="Required">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E14" ValidationSettings-ValidationGroup="<%# (Container.NamingContainer as GridViewEditFormTemplateContainer).ValidationGroup %>" runat="server" Width="100%" Text='<%# Eval("Phone1") %>'>
                                                                            <ValidationSettings CausesValidation="True" ValidationGroup="EditForm">
                                                                                <RequiredField ErrorText="Required" IsRequired="True" />
                                                                            </ValidationSettings>
                                                                        </dx:ASPxTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem FieldName="Phone2">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E15" runat="server" Width="100%" Text='<%# Eval("Phone2") %>'>
                                                                        </dx:ASPxTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                            <dx:LayoutItem FieldName="Phone3">
                                                                <LayoutItemNestedControlCollection>
                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E16" runat="server" Width="100%" Text='<%# Eval("Phone3") %>'>
                                                                        </dx:ASPxTextBox>
                                                                    </dx:LayoutItemNestedControlContainer>
                                                                </LayoutItemNestedControlCollection>
                                                            </dx:LayoutItem>
                                                        </Items>
                                                    </dx:LayoutGroup>
                                                    <dx:LayoutItem ColSpan="2" FieldName="MailingAddress">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E17" runat="server" Text='<%# Eval("MailingAddress") %>' Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                        </Items>
                                        <SettingsItemCaptions Location="Top" />
                                    </dx:ASPxFormLayout>

                                    <div style="text-align: right; padding: 10px 10px 10px 10px;">
                                        <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                            runat="server" ColumnID=""></dx:ASPxGridViewTemplateReplacement>
                                        <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                                    </div>

                                </EditForm>
                            </Templates>
                        </dx:ASPxGridView>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:PopupWindow>
        </Windows>
        <ClientSideEvents CloseUp="function(s, e) {
	mastergrid.Refresh();
}" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <asp:EntityDataSource ID="edsCTaxpayers" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableUpdate="True" EntitySetName="CorporateTaxpayers" EntityTypeFilter="CorporateTaxpayer" Include="Branches" OnSelecting="edsCTaxpayers_Selecting" Where="exists(select value b from it.Branches as b where b.TaxOfficeId = @TaxOfficeId)">
        <WhereParameters>
            <asp:SessionParameter Name="TaxOfficeId" SessionField="TaxOfficeId" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsBranches" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableUpdate="True" EntitySetName="CorporateBranches" EntityTypeFilter="CorporateBranch" Where="it.CorporateTIN = @TIN &amp;&amp; it.TaxOfficeId = @TaxOfficeId" Include="TaxOffice">
        <WhereParameters>
            <asp:SessionParameter Name="TIN" SessionField="CTIN" Type="String" />
            <asp:SessionParameter Name="TaxOfficeId" SessionField="TaxOfficeId" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>

        <asp:EntityDataSource ID="edsAttachments" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableDelete="True" EnableInsert="True" EntitySetName="CTaxpayerFiles" Where="it.TIN = @TIN" EnableFlattening="False">
            <WhereParameters>
                <asp:SessionParameter Name="TIN" SessionField="CTIN" Type="String" />
            </WhereParameters>
        </asp:EntityDataSource>
    
    <asp:EntityDataSource ID="edsCompanies" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="CAssociates" Where="it.TIN = @TIN">
        <InsertParameters>
            <asp:SessionParameter Name="TIN" SessionField="CTIN" Type="String" />
            <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
        </InsertParameters>

        <WhereParameters>
            <asp:SessionParameter Name="TIN" SessionField="CTIN" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="edsBankList" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Banks" EntityTypeFilter="Bank" Select="it.[BankCode], it.[BankName]">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="edsCBanks" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="CBanks" Where="it.TIN = @TIN" Include="Bank">
        <InsertParameters>
            <asp:SessionParameter Name="TIN" SessionField="CTIN" Type="String" />
            <asp:Parameter Name="BankCode" Type="String" />
            <asp:Parameter Name="AccountNumber" Type="String" />
            <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
        </InsertParameters>

        <WhereParameters>
            <asp:SessionParameter Name="TIN" SessionField="CTIN" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="edsCShareholders" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="CShareHolders" Where="it.TIN = @TIN" Include="">
        <InsertParameters>
            <asp:SessionParameter Name="TIN" SessionField="CTIN" Type="String" />
            <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
        </InsertParameters>

        <WhereParameters>
            <asp:SessionParameter Name="TIN" SessionField="CTIN" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="edsLgas" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="LGAs" Select="it.[LGAId], it.[LGAName], it.State.StateName" Where="it.State.StateName = @StateName">
        <WhereParameters>
            <asp:Parameter Name="StateName" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="edsCDirectors" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="CDirectors" Where="it.TIN = @TIN" Include="">
        <InsertParameters>
            <asp:SessionParameter Name="TIN" SessionField="CTIN" Type="String" />
            <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
        </InsertParameters>

        <WhereParameters>
            <asp:SessionParameter Name="TIN" SessionField="CTIN" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="edsRepresentatives" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="CRepresentatives" Where="it.TIN = @TIN">

        <InsertParameters>
            <asp:SessionParameter Name="TIN" SessionField="CTIN" Type="String" />
            <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
        </InsertParameters>
        <WhereParameters>
            <asp:SessionParameter Name="TIN" SessionField="CTIN" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsBusinessLines" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="BusinessLines" OrderBy="">
    </asp:EntityDataSource>
    <dx:EntityServerModeDataSource ID="esmdsCTaxpayers" runat="server" ContextTypeName="TAAPs.ModelDBContext" OnSelecting="esmdsCTaxpayers_Selecting" TableName="CorporateBranches" />
    <asp:EntityDataSource ID="edsTransfers" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EntitySetName="CorporateTransfers" EntityTypeFilter="CorporateTransfer" Include="TaxOffice,TaxOffice1" Where="it.TIN = @TIN">
        <InsertParameters>
            <asp:SessionParameter Name="TIN" SessionField="CTIN" Type="String" />
            <asp:Parameter Name="FromTaxOfficeId" Type="String" />
            <asp:Parameter Name="ToTaxOfficeId" Type="String" />
            <asp:Parameter Name="Reason" Type="String" />
            <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
        </InsertParameters>
        <WhereParameters>
            <asp:SessionParameter Name="TIN" SessionField="CTIN" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="edsStates" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="States">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="edsTaxOffices" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxOffices" Select="it.[TaxOfficeId], it.[TaxOfficeName]">
    </asp:EntityDataSource>

</asp:Content>
