<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ITaxpayersList.aspx.cs" Inherits="TAAPs.Registration.ITaxpayersList" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <script type="text/javascript">

        var windowId;

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
            popup.PerformWindowCallback(window, tin);
        }

        function HidePopUp(index) {
            popup.HideWindow(popup.GetWindow(index));
        }
    </script>

    <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="edsITaxpayers" KeyFieldName="TIN" ClientInstanceName="mastergrid" OnCustomButtonInitialize="ASPxGridView1_CustomButtonInitialize" OnCustomCallback="ASPxGridView1_CustomCallback" OnRowUpdating="ASPxGridView1_RowUpdating" OnCommandButtonInitialize="ASPxGridView1_CommandButtonInitialize" OnCustomErrorText="ASPxGridView1_CustomErrorText" OnStartRowEditing="ASPxGridView1_StartRowEditing" OnHtmlEditFormCreated="ASPxGridView1_HtmlEditFormCreated">
        <ClientSideEvents CustomButtonClick="OnCustomButtonClick" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="33" Width="150px" ShowApplyFilterButton="True" ShowEditButton="True">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btnTransfer" Text="Transfers" Visibility="AllDataRows">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="TIN" VisibleIndex="2" Width="120px" ReadOnly="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NewTIN" VisibleIndex="3" Width="120px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaxpayerName" VisibleIndex="4">
                <PropertiesTextEdit EnableFocusedStyle="False">
                    <ValidationSettings CausesValidation="True">
                        <RequiredField ErrorText="Taxpayer Name is Required" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="BusinessLine.BusinessLineName" VisibleIndex="24" Caption="Business Line">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaxAuthority" VisibleIndex="27" Width="100px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaxOffice.TaxOfficeName" VisibleIndex="28" Caption="Tax Office">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="CreateDate" VisibleIndex="32" Width="120px" ReadOnly="True">
<PropertiesDateEdit>
<TimeSectionProperties>
<TimeEditProperties>
<ClearButton Visibility="Auto"></ClearButton>
</TimeEditProperties>
</TimeSectionProperties>

<ClearButton Visibility="Auto"></ClearButton>
</PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
        </Columns>
        <SettingsBehavior AllowSelectByRowClick="True" ColumnResizeMode="Control" AllowSelectSingleRowOnly="True" FilterRowMode="OnClick" />
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
        <SettingsText PopupEditFormCaption="Edit Individual Taxpayer" />
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" VerticalAlign="Middle" />
        </SettingsPopup>
        <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
        <Templates>

            <EditForm>
                    <dx:ASPxFormLayout  ID="formLayout" runat="server" Width="100%">
                        <Items>
                            <dx:LayoutGroup Caption="Taxpayer Data" ColCount="4">
                                <Items>
                                    <dx:LayoutItem ColSpan="4" FieldName="TaxpayerName" RequiredMarkDisplayMode="Required">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="TextBoxTaxpayerName" runat="server" Text='<%# Eval("TaxpayerName") %>' Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem FieldName="TIN" RequiredMarkDisplayMode="Required">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="ASPxTextboxTIN" runat="server" ReadOnly="True" Width="100%" Text='<%# Eval("TIN") %>' BackColor="#CCCCCC">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="JTB TIN" FieldName="NewTIN">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E3" runat="server" ReadOnly="True" Width="100%" Text='<%# Eval("NewTIN") %>' BackColor="#CCCCCC">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem FieldName="TaxAuthority">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E28" runat="server" ReadOnly="True" Width="100%" Text='<%# Eval("TaxAuthority") %>' BackColor="#CCCCCC">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem FieldName="RegNo">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E4" runat="server" Width="100%" Text='<%# Eval("RegNo") %>'>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            <dx:LayoutGroup ColCount="4" ShowCaption="False">
                                <Items>
                                    <dx:LayoutItem Caption="Business Line" ColSpan="2" FieldName="BusLine" RequiredMarkDisplayMode="Required">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="edsBusLines" TextField="BusinessLineName" ValueField="BusinessLineId" Width="100%" Value='<%# Eval("BusLine") %>'>
                                                    <ClearButton Visibility="Auto">
                                                    </ClearButton>
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Tax Office" ColSpan="2" FieldName="TaxOfficeID" RequiredMarkDisplayMode="Required">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" ReadOnly="True" Width="100%" Text='<%# Eval("TaxOfficeID") %>' BackColor="#CCCCCC">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Registration Date" FieldName="RegDate">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxDateEdit ID="ASPxFormLayout1_E5" runat="server" Width="100%" Value='<%# Eval("RegDate") %>'>
                                                    <TimeSectionProperties>
                                                        <TimeEditProperties>
                                                            <ClearButton Visibility="Auto">
                                                            </ClearButton>
                                                        </TimeEditProperties>
                                                    </TimeSectionProperties>
                                                    <ClearButton Visibility="Auto">
                                                    </ClearButton>
                                                </dx:ASPxDateEdit>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Commencement Date" FieldName="DateOfCommencement">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxDateEdit ID="ASPxFormLayout1_E26" runat="server" Width="100%" Value='<%# Eval("DateOfCommencement") %>'>
                                                    <TimeSectionProperties>
                                                        <TimeEditProperties>
                                                            <ClearButton Visibility="Auto">
                                                            </ClearButton>
                                                        </TimeEditProperties>
                                                    </TimeSectionProperties>
                                                    <ClearButton Visibility="Auto">
                                                    </ClearButton>
                                                </dx:ASPxDateEdit>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Accounting Year End" FieldName="AcctYearEnd">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E27" runat="server" Width="100%" Text='<%# Eval("AcctYearEnd") %>'>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            <dx:TabbedLayoutGroup Width="100%">
                                <Items>
                                    <dx:LayoutGroup Caption="Address" ColCount="2" Name="Address">
                                        <Items>
                                            <dx:LayoutGroup Caption="Business Address" ColCount="2">
                                                <Items>
                                                    <dx:LayoutItem Caption="Street Number" FieldName="BusAddNo" RequiredMarkDisplayMode="Required">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E7" runat="server" Width="100%" Text='<%# Eval("BusAddNo") %>'>
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="City" FieldName="BusAddCity">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E9" runat="server" Width="100%" Text='<%# Eval("BusAddCity") %>'>
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Street" ColSpan="2" FieldName="BusAddStreet" RequiredMarkDisplayMode="Required">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="71px" Width="100%" Text='<%# Eval("BusAddStreet") %>'>
                                                                </dx:ASPxMemo>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="State" FieldName="BusAddState" RequiredMarkDisplayMode="Required">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxComboBox ID="ASPxComboBox3" runat="server" Width="100%" Value='<%# Eval("BusAddState") %>'>
                                                                    <ClearButton Visibility="Auto">
                                                                    </ClearButton>
                                                                </dx:ASPxComboBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="LGA" FieldName="BusAddLGA">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxComboBox ID="ASPxComboBox5" runat="server" Width="100%" Value='<%# Eval("BusAddLGA") %>'>
                                                                    <ClearButton Visibility="Auto">
                                                                    </ClearButton>
                                                                </dx:ASPxComboBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                            <dx:LayoutGroup Caption="Employment Address" ColCount="2">
                                                <Items>
                                                    <dx:LayoutItem Caption="Street Number" FieldName="EmpAddNo">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E17" runat="server" Width="100%" Text='<%# Eval("EmpAddNo") %>'>
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="City" FieldName="EmpAddCity">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E19" runat="server" Width="100%" Text='<%# Eval("EmpAddCity") %>'>
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="Street" ColSpan="2" FieldName="EmpAddStreet">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxMemo ID="ASPxMemo3" runat="server" Height="71px" Width="100%" Text='<%# Eval("EmpAddStreet") %>'>
                                                                </dx:ASPxMemo>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="State" FieldName="EmpAddState">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxComboBox ID="ASPxComboBox4" runat="server" Width="100%" Value='<%# Eval("EmpAddState") %>'>
                                                                    <ClearButton Visibility="Auto">
                                                                    </ClearButton>
                                                                </dx:ASPxComboBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="LGA" FieldName="EmpAddLGA">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxComboBox ID="ASPxComboBox6" runat="server" Width="100%" Value='<%# Eval("EmpAddLGA") %>'>
                                                                    <ClearButton Visibility="Auto">
                                                                    </ClearButton>
                                                                </dx:ASPxComboBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                            <dx:LayoutItem ColSpan="2" FieldName="MailingAddress">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="formLayout_E3" runat="server" Width="100%" Text='<%# Eval("MailingAddress") %>'>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Other Details" ColCount="2">
                                        <Items>
                                            <dx:LayoutGroup Caption="Contact Information" ColCount="2">
                                                <Items>
                                                    <dx:LayoutItem ColSpan="2" FieldName="Email">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E13" runat="server" Width="100%" Text='<%# Eval("Email") %>'>
                                                                    <ValidationSettings CausesValidation="True" SetFocusOnError="True">
                                                                        <RegularExpression ErrorText="Invalid Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem ColSpan="2" FieldName="Phone1">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E14" runat="server" Width="100%" Text='<%# Eval("Phone1") %>'>
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem FieldName="Phone2">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E15" runat="server" Width="100%" Text='<%# Eval("Phone2") %>'>
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem FieldName="Phone3">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E16" runat="server" Width="100%" Text='<%# Eval("Phone3") %>'>
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                            <dx:LayoutGroup ColCount="2" ShowCaption="False">
                                                <Items>
                                                    <dx:LayoutItem FieldName="EmploymentType" ColSpan="2">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E23" runat="server" Width="170px">
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:LayoutGroup>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Banks">
                                        <Items>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxGridView ID="ASPxGridViewBanks" runat="server" AutoGenerateColumns="False" DataSourceID="edsIBanks" KeyFieldName="TIN;BankCode" Width="100%">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="TIN" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="AccountNumber" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                    <EditFormSettings CaptionLocation="Top" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="CreatedBy" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <EditFormSettings CaptionLocation="Top" Visible="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn FieldName="CreateDate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                                                                        <TimeSectionProperties>
                                                                            <TimeEditProperties>
                                                                                <ClearButton Visibility="Auto">
                                                                                </ClearButton>
                                                                            </TimeEditProperties>
                                                                        </TimeSectionProperties>
                                                                        <ClearButton Visibility="Auto">
                                                                        </ClearButton>
                                                                    </PropertiesDateEdit>
                                                                    <EditFormSettings CaptionLocation="Top" Visible="False" />
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="6">
                                                                </dx:GridViewCommandColumn>
                                                                <dx:GridViewDataComboBoxColumn Caption="Bank" FieldName="BankCode" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <PropertiesComboBox DataSourceID="edsBankList" TextField="BankName" ValueField="BankCode">
                                                                        <ClearButton Visibility="Auto">
                                                                        </ClearButton>
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings CaptionLocation="Top" />
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
                                    <dx:LayoutGroup Caption="Other Income Sources">
                                        <Items>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxGridView ID="ASPxGridViewIncomeSources" runat="server" AutoGenerateColumns="False" DataSourceID="edsIncome" KeyFieldName="TIN;IncomeSource" Width="100%">
                                                            <Columns>
                                                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="5">
                                                                </dx:GridViewCommandColumn>
                                                                <dx:GridViewDataTextColumn FieldName="TIN" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="IncomeSource" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <EditFormSettings CaptionLocation="Top" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="CreatedBy" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                    <EditFormSettings Visible="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn FieldName="CreateDate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <PropertiesDateEdit>
                                                                        <TimeSectionProperties>
                                                                            <TimeEditProperties>
                                                                                <ClearButton Visibility="Auto">
                                                                                </ClearButton>
                                                                            </TimeEditProperties>
                                                                        </TimeSectionProperties>
                                                                        <ClearButton Visibility="Auto">
                                                                        </ClearButton>
                                                                    </PropertiesDateEdit>
                                                                    <EditFormSettings Visible="False" />
                                                                </dx:GridViewDataDateColumn>
                                                            </Columns>
                                                            <SettingsBehavior AllowSelectByRowClick="True" ConfirmDelete="True" />
                                                            <SettingsEditing Mode="Batch" NewItemRowPosition="Bottom">
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
                                                                    <EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="CreatedBy" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <EditFormSettings Visible="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn FieldName="CreateDate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <PropertiesDateEdit>
                                                                        <TimeSectionProperties>
                                                                            <TimeEditProperties>
                                                                                <ClearButton Visibility="Auto">
                                                                                </ClearButton>
                                                                            </TimeEditProperties>
                                                                        </TimeSectionProperties>
                                                                        <ClearButton Visibility="Auto">
                                                                        </ClearButton>
                                                                    </PropertiesDateEdit>
                                                                    <EditFormSettings Visible="False" />
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataMemoColumn FieldName="CompanyAddress" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
                                                                </dx:GridViewDataMemoColumn>
                                                            </Columns>
                                                            <SettingsBehavior AllowSelectSingleRowOnly="True" ConfirmDelete="True" />
                                                            <SettingsEditing Mode="Batch" NewItemRowPosition="Bottom">
                                                            </SettingsEditing>
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
                                                                    <EditFormSettings CaptionLocation="Top" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="RepresentativeType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="CreatedBy" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <EditFormSettings Visible="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn FieldName="CreateDate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6">
                                                                    <PropertiesDateEdit>
                                                                        <TimeSectionProperties>
                                                                            <TimeEditProperties>
                                                                                <ClearButton Visibility="Auto">
                                                                                </ClearButton>
                                                                            </TimeEditProperties>
                                                                        </TimeSectionProperties>
                                                                        <ClearButton Visibility="Auto">
                                                                        </ClearButton>
                                                                    </PropertiesDateEdit>
                                                                    <EditFormSettings Visible="False" />
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataMemoColumn FieldName="RepresentativeAddress" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <EditFormSettings CaptionLocation="Top" />
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
                                    <dx:LayoutGroup Caption="Attachments">
                                        <Items>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridView ID="gridAttachments" runat="server" AutoGenerateColumns="False" DataSourceID="edsAttachments" KeyFieldName="FileId" OnCustomErrorText="gridAttachments_CustomErrorText" OnRowInserting="gridAttachments_RowInserting">
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
                                                                    <dx:GridViewColumnLayoutItem ColumnName="File Description">
                                                                    </dx:GridViewColumnLayoutItem>
                                                                    <dx:GridViewColumnLayoutItem ColumnName="File Content">
                                                                    </dx:GridViewColumnLayoutItem>
                                                                    <dx:EditModeCommandLayoutItem HorizontalAlign="Right">
                                                                    </dx:EditModeCommandLayoutItem>
                                                                </Items>
                                                                <SettingsItemCaptions Location="Top" />
                                                                <SettingsItems VerticalAlign="Top" />
                                                            </EditFormLayoutProperties>
                                                            <Columns>
                                                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="6" Width="100px" ShowNewButtonInHeader="True">
                                                                </dx:GridViewCommandColumn>
                                                                <dx:GridViewDataTextColumn FieldName="FileId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="FileName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="FileDescription" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <Settings AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowFilterRowMenuLikeItem="False" ShowInFilterControl="False" />
                                                                    <EditFormSettings Caption="File Name" CaptionLocation="Top" />
                                                                    <DataItemTemplate>
                                                                        <dx:ASPxButton ID="btnButtton0" runat="server" CommandArgument='<%# Eval("FileId") %>' CommandName="Download" OnClick="btnButtton_Click" RenderMode="Link" Text='<%# Eval("FileName") %>' UseSubmitBehavior="False">
                                                                        </dx:ASPxButton>
                                                                    </DataItemTemplate>
                                                                    <PropertiesTextEdit>
                                                                        <ValidationSettings>
                                                                            <RequiredField IsRequired="True" />
                                                                        </ValidationSettings>
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn FieldName="CreateDate" ShowInCustomizationForm="True" VisibleIndex="5" Width="100px">
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataTextColumn FieldName="FileType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                                                    <PropertiesTextEdit>
                                                                        <ValidationSettings>
                                                                            <RequiredField IsRequired="True" />
                                                                        </ValidationSettings>
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="FileContent" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                                                    <EditItemTemplate>
                                                                        <dx:ASPxUploadControl ID="ucUploadFile" runat="server" OnFileUploadComplete="ucUploadFile_FileUploadComplete" ShowUploadButton="True">
                                                                            <ValidationSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png, .doc, .docx, .xls, .xlsx, .pdf">
                                                                            </ValidationSettings>
                                                                        </dx:ASPxUploadControl>
                                                                    </EditItemTemplate>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:ASPxGridView>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                </Items>
                                <SettingsItemCaptions Location="Top" />
                            </dx:TabbedLayoutGroup>
                        </Items>
                        <SettingsItemCaptions Location="Top" />
                    </dx:ASPxFormLayout>

                    <div style="text-align: right; padding: 10px 10px 10px 10px;" >
                        <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                            runat="server" ColumnID=""></dx:ASPxGridViewTemplateReplacement>
                        <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                    </div>
            </EditForm>
        </Templates>
    </dx:ASPxGridView>


    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="popup" Width="100%" HeaderText="" Modal="True" OnWindowCallback="ASPxPopupControl1_WindowCallback" PopupHorizontalAlign="Center" PopupVerticalAlign="Middle" ShowPinButton="True" AllowDragging="True" AllowResize="True">
        <Windows>
            <dx:PopupWindow Modal="True" Name="transferpopup" Width="900px">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxGridView ID="ASPxGridViewTransfers" runat="server" AutoGenerateColumns="False" DataSourceID="edsTransfers" KeyFieldName="TransferId" PreviewFieldName="Reason" Width="100%" OnCustomErrorText="ASPxGridViewTransfers_CustomErrorText" OnInitNewRow="ASPxGridViewTransfers_InitNewRow" OnRowInserted="ASPxGridViewTransfers_RowInserted" OnCancelRowEditing="ASPxGridViewTransfers_CancelRowEditing">
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
                                    <PropertiesComboBox DataSourceID="edsTaxOffices" TextField="TaxOfficeName" ValueField="TaxOfficeId" EnableFocusedStyle="False" IncrementalFilteringMode="Contains">
                                        
                                        <ValidationSettings CausesValidation="True" EnableCustomValidation="True" ErrorDisplayMode="ImageWithText">
                                            
                                            <RequiredField ErrorText="Required" IsRequired="True" />
                                            
                                        </ValidationSettings>
                                        
                                    </PropertiesComboBox>
                                    <EditFormSettings Caption="Transfer To Tax Office" CaptionLocation="Top" />
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataMemoColumn Caption="Reason for Transfer" FieldName="Reason" ShowInCustomizationForm="True" VisibleIndex="14" Visible="False">
                                    <PropertiesMemoEdit>
                                        
                                        <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText">
                                            
                                            <RequiredField IsRequired="True" ErrorText="Required" />
                                            
                                        </ValidationSettings>
                                        
                                    </PropertiesMemoEdit>
                                    <EditFormSettings CaptionLocation="Top" ColumnSpan="3" RowSpan="4" Visible="True" />
                                </dx:GridViewDataMemoColumn>
                                <dx:GridViewDataComboBoxColumn Caption="From Tax Office" FieldName="FromTaxOfficeId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <PropertiesComboBox DataSourceID="edsTaxOffices" DropDownRows="1" DropDownStyle="DropDown" TextField="TaxOfficeName" ValueField="TaxOfficeId">
                                        
                                        <DropDownButton Enabled="False" Visible="False">
                                        </DropDownButton>
                                        

                                        <ReadOnlyStyle BackColor="#CCCCCC">
                                        </ReadOnlyStyle>
                                        
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
        </Windows>
        <ClientSideEvents EndCallback="function(s, e) {
	                                                        mastergrid.PerformCallback();
                                                        }" CloseUp="function(s, e) {
	                                                        mastergrid.Refresh();
                                                        }" />
        
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
            </dx:PopupControlContentControl>
        </ContentCollection>
        
    </dx:ASPxPopupControl>

    <asp:EntityDataSource ID="edsCompanies" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="ITaxpayerAssociates" Where="it.TIN = @TIN">
        <InsertParameters>
            <asp:SessionParameter Name="TIN" SessionField="ITIN" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="CompanyAddress" Type="String" />
            <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
        </InsertParameters>

        <WhereParameters>
            <asp:SessionParameter Name="TIN" SessionField="ITIN" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="edsIBanks" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="ITaxpayerBanks" EntityTypeFilter="" Select="" Where="it.TIN = @TIN" Include="Bank">
        <InsertParameters>
            <asp:SessionParameter Name="TIN" SessionField="ITIN" Type="String" />
            <asp:Parameter Name="BankCode" Type="String" />
            <asp:Parameter Name="AccountNumber" Type="String" />
            <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" DefaultValue="sfw" />
        </InsertParameters>

        <WhereParameters>
            <asp:SessionParameter Name="TIN" SessionField="ITIN" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="edsIncome" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="ITaxpayerOtherIncomes" EntityTypeFilter="ITaxpayerOtherIncome" Where="it.TIN = @TIN">
        <InsertParameters>
            <asp:SessionParameter Name="TIN" SessionField="ITIN" Type="String" />
            <asp:Parameter Name="IncomeSource" Type="String" />
            <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
        </InsertParameters>

        <WhereParameters>
            <asp:SessionParameter Name="TIN" SessionField="ITIN" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="edsRepresentatives" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="ITaxpayerRepresentatives" Where="it.TIN = @TIN" EntityTypeFilter="" Select="">

        <InsertParameters>
            <asp:SessionParameter Name="TIN" SessionField="ITIN" Type="String" />
            <asp:Parameter Name="RepresentativeName" Type="String" />
            <asp:Parameter Name="RepresentativeAddress" Type="String" />
            <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
        </InsertParameters>
        <WhereParameters>
            <asp:SessionParameter Name="TIN" SessionField="ITIN" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>

        <asp:EntityDataSource ID="edsAttachments" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntitySetName="ITaxpayerFiles" EntityTypeFilter="" Select="" Where="it.TIN = @TIN">
            <WhereParameters>
                <asp:SessionParameter Name="TIN" SessionField="ITIN" Type="String" />
            </WhereParameters>
        </asp:EntityDataSource>
    
    <asp:EntityDataSource ID="edsITaxpayers" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableUpdate="True" EntitySetName="ITaxpayers" EntityTypeFilter="ITaxpayer" Include="TaxOffice,BusinessLine" Where="it.TaxOfficeId = @TaxOfficeId" OnSelecting="edsITaxpayers_Selecting" Select="">
        <WhereParameters>
            <asp:SessionParameter DefaultValue="" Name="TaxOfficeId" SessionField="TaxOfficeId" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>


    <asp:EntityDataSource ID="edsTransfers" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EntitySetName="ITaxpayerTransfers" EntityTypeFilter="ITaxpayerTransfer" Where="it.TIN = @TIN" Include="TaxOffice,TaxOffice1">
        <WhereParameters>
            <asp:SessionParameter Name="TIN" SessionField="ITIN" Type="String" />
        </WhereParameters>

        <InsertParameters>
            <asp:SessionParameter Name="TIN" SessionField="ITIN" Type="String" />
            <asp:Parameter Name="FromTaxOfficeId" Type="String" />
            <asp:Parameter Name="ToTaxOfficeId" Type="String" />
            <asp:Parameter Name="Reason" Type="String" />
            <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
        </InsertParameters>

    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsBusLines" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="BusinessLines" Select="it.[BusinessLineId], it.[BusinessLineName]">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsTaxOffices" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxOffices" Select="it.[TaxOfficeId], it.[TaxOfficeName]">
    </asp:EntityDataSource>
    <dx:EntityServerModeDataSource ID="esmdsItaxpayers" runat="server" ContextTypeName="TAAPs.Model.TAAPsDBContext" EnableUpdate="True" OnSelecting="esmdsItaxpayers_Selecting" TableName="ITaxpayers" />
    <asp:EntityDataSource ID="edsStates" runat="server">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsBankList" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Banks" EntityTypeFilter="Bank" Select="it.[BankCode], it.[BankName]">
    </asp:EntityDataSource>
</asp:Content>
