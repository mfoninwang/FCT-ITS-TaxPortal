<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="ItaxpayerEdit.aspx.cs" Inherits="TAAPs.Registration.ItaxpayerEdit" %>

<%@ PreviousPageType VirtualPath="ItaxpayerList.aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        var state = null;

        function OnStateChanged(control) {
            switch (control) {
                case birthStateCombo:
                    if (birthLgaCombo.InCallback())
                        state = birthStateCombo.GetValue().toString();
                    else
                        birthLgaCombo.PerformCallback(birthStateCombo.GetValue().toString());
                    break;
                case originStateCombo:
                    if (originLgaCombo.InCallback())
                        state = originStateCombo.GetValue().toString();
                    else
                        originLgaCombo.PerformCallback(originStateCombo.GetValue().toString());
                    break;

            }

        }
        function OnLgaEndCallback(s, e) {
            if (state) {
                birthStateCombo.PerformCallback(state);
                state = null;
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Individual Taxpayer
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Individual Taxpayer List
</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">

    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%">
        <TabPages>
            <dx:TabPage Text="Taxpayer Info">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:ASPxFormLayout ID="TaxpayerForm" runat="server" ColCount="3" Width="100%" OnDataBinding="TaxpayerForm_DataBinding">
                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" />
                            <Items>
                                <dx:LayoutItem FieldName="TIN">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E1" runat="server" Width="100%" ReadOnly="True" NullText="Tax Identification Number">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="BVN">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E2" runat="server" Width="100%" NullText="Bank Verification Number">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="JTBTIN" Caption="JTB TIN">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E3" runat="server" Width="100%" NullText="JTB TIN" ReadOnly="True">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="LastName">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E8" runat="server" Width="100%">
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="FirstName">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E9" runat="server" Width="100%" NullText="Firstname">
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="MiddleName">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E10" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="NIN">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E4" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="FIRSTIN" Caption="FIRS TIN">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E5" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="StateTIN">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E6" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="Title">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E7" runat="server" Width="100%" NullText="Title">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="Gender">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ASPxfrmTaxpayer_E4" runat="server" Width="100%">
                                                <Items>
                                                    <dx:ListEditItem Text="F" Value="F" />
                                                    <dx:ListEditItem Text="M" Value="M" />
                                                </Items>
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="MaritalStatus">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ASPxfrmTaxpayer_E2" runat="server" Width="100%">
                                                <Items>
                                                    <dx:ListEditItem Text="Single" Value="Single" />
                                                    <dx:ListEditItem Text="Married" Value="Married" />
                                                    <dx:ListEditItem Text="Widowed" Value="Widowed" />
                                                    <dx:ListEditItem Text="Divorced" Value="Divorced" />
                                                </Items>
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="PreviousLastName">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E13" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="PreviousFirstName">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E14" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="PreviousMiddleName">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E15" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="NationalityId" Caption="Nationality">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ASPxcbNationality" runat="server" Width="100%">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="Height">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxSpinEdit ID="ASPxFormLayout1_E16" runat="server" Number="0" Width="100%" DecimalPlaces="2" NullText="Height">
                                            </dx:ASPxSpinEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="MaidenName">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E12" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="BirthDate">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxDateEdit ID="BirthDateDateEdit" runat="server" Width="100%" MinDate="1920-01-01" NullText="dd/MM/yyyy" DisplayFormatString="dd-MMM-yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="BirthStateId" Caption="Birth State">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="BirthStateCombo" runat="server" ClientInstanceName="birthStateCombo" Width="100%">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	OnStateChanged(s);
}" />
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="BirthCity">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E20" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="BirthLgaId" Caption="Birth Lga">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="BirthLgaCombo" runat="server" ClientInstanceName="birthLgaCombo" OnCallback="BirthLgaCombo_Callback" TextField="LGAName" ValueField="LGAId" Width="100%">
                                                <ClientSideEvents EndCallback="function(s, e) {
	OnLgaEndCallback
}" />
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="BirthCountryId" Caption="Birth Country">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ASPxcbBirthCountry" runat="server" Width="100%">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="OriginStateId" Caption="State of Origin">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="OriginStateCombo" runat="server" ClientInstanceName="originStateCombo" Width="100%">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	OnStateChanged(s);
}" />
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="OriginLgaId" Caption="Lga of Origin">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="OriginLgaCombo" runat="server" OnCallback="OriginLgaCombo_Callback" ClientInstanceName="originLgaCombo" Width="100%">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="Email">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E27" runat="server" Width="100%">
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="Website">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E28" runat="server" Width="100%">
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <RegularExpression ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="Phone1" Caption="Primary Phone">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E31" runat="server" Width="100%" NullText="Primary Phone Number" MaxLength="13">
                                                <ClientSideEvents KeyPress="function(s, e) {
	ValidateNumber(e);
}" />
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="Phone2" Caption="Secondary Phone">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E32" runat="server" Width="100%" NullText="Phone 2" MaxLength="13">
                                                <ClientSideEvents KeyPress="function(s, e) {
	ValidateNumber(e);
}" />
                                                <MaskSettings IncludeLiterals="None" />
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <RegularExpression ValidationExpression="\d" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="Religion">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ASPxfrmTaxpayer_E6" runat="server" Width="100%">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="SpouseNIN">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E17" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="Employer">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E34" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="Profession">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ProfessionCombo" runat="server">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="EmploymentId" Caption="Employment Number">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E36" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="EmploymentStatus">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E37" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="HighestEducation">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E38" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="IdentificationType">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="IdentificationTypeCombo" runat="server" Width="100%">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="IdentificationNumber">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E40" runat="server" Width="100%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="TaxOfficeId" Caption="Tax Office">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ASPxcbTaxOffice" runat="server" Width="100%" ReadOnly="True">
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="RecordSource">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E50" runat="server" Width="100%" ReadOnly="True">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="CreatedBy">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E52" runat="server" Width="100%" ReadOnly="True">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="CreateDate">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox ID="TaxpayerForm_E2" runat="server" DisplayFormatString="dd-MMM-yyyy hh:mm:ss" ReadOnly="True">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                            <SettingsItemCaptions Location="Top" />
                        </dx:ASPxFormLayout>
                        <hr />
                        <div class="text-right">
                            <dx:ASPxButton ID="SendSMSButton" runat="server" Text="Send SMS TIN Notification" OnClick="SendSMSButton_Click"></dx:ASPxButton>

                            <dx:ASPxButton ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click"></dx:ASPxButton>
                            <dx:ASPxButton ID="CancelButton" runat="server" Text="Cancel" AutoPostBack="False" CausesValidation="False"></dx:ASPxButton>
                        </div>

                    </dx:ContentControl>
                </ContentCollection>

            </dx:TabPage>
            <dx:TabPage Text="Addresses">
                <ContentCollection>
                    <dx:ContentControl runat="server">

                        <dx:ASPxCardView ID="AddressCardView" runat="server" AutoGenerateColumns="False" KeyFieldName="AddressId" Width="100%" EnableTheming="True" OnCardInserting="AddressCardView_CardInserting" OnCardUpdating="AddressCardView_CardUpdating" OnDataBinding="AddressCardView_DataBinding">

                            <SettingsPager EnableAdaptivity="True">
                                <SettingsTableLayout ColumnCount="2" RowsPerPage="1" />
                            </SettingsPager>

                            <SettingsBehavior AllowFocusedCard="True" />
                            <SettingsDataSecurity AllowDelete="False" />
                            <SettingsExport ExportSelectedCardsOnly="False">
                            </SettingsExport>
                            <Columns>
                                <dx:CardViewTextColumn FieldName="AddressId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="TIN" ShowInCustomizationForm="True" VisibleIndex="1" ReadOnly="True">
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="StreetNo" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="AddressLine2" ShowInCustomizationForm="True" VisibleIndex="4">
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="City" ShowInCustomizationForm="True" VisibleIndex="5">
                                    <PropertiesTextEdit>
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesTextEdit>
                                </dx:CardViewTextColumn>
                                <dx:CardViewTextColumn FieldName="PostCode" ShowInCustomizationForm="True" VisibleIndex="9">
                                </dx:CardViewTextColumn>
                                <dx:CardViewCheckColumn FieldName="IsPrimary" ShowInCustomizationForm="True" VisibleIndex="10">
                                    <PropertiesCheckEdit>
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesCheckEdit>
                                </dx:CardViewCheckColumn>
                                <dx:CardViewDateColumn FieldName="CreateDate" ShowInCustomizationForm="True" VisibleIndex="11">
                                </dx:CardViewDateColumn>
                                <dx:CardViewTextColumn FieldName="CreatedBy" ShowInCustomizationForm="True" VisibleIndex="12" ReadOnly="True">
                                </dx:CardViewTextColumn>
                                <dx:CardViewComboBoxColumn FieldName="StateId" ShowInCustomizationForm="True" VisibleIndex="6">
                                    <PropertiesComboBox DataSourceID="StateDataSource" TextField="StateName" ValueField="StateId">
                                        <ValidationSettings SetFocusOnError="True">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesComboBox>
                                </dx:CardViewComboBoxColumn>
                                <dx:CardViewComboBoxColumn FieldName="LgaId" ShowInCustomizationForm="True" VisibleIndex="7">
                                    <PropertiesComboBox DataSourceID="LgaDataSource" TextField="LGAName" ValueField="LGAId">
                                    </PropertiesComboBox>
                                </dx:CardViewComboBoxColumn>
                                <dx:CardViewComboBoxColumn FieldName="CountryId" ShowInCustomizationForm="True" VisibleIndex="8">
                                    <PropertiesComboBox DataSourceID="CountryDataSource" TextField="CountryName" ValueField="CountryId">
                                    </PropertiesComboBox>
                                </dx:CardViewComboBoxColumn>
                                <dx:CardViewMemoColumn FieldName="AddressLine1" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <PropertiesMemoEdit>
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesMemoEdit>
                                </dx:CardViewMemoColumn>
                            </Columns>
                            <Toolbars>
                                <dx:CardViewToolbar ItemAlign="Right" Visible="False">
                                    <Items>
                                        <dx:CardViewToolbarItem Command="New" Text="Add New Address">
                                        </dx:CardViewToolbarItem>
                                    </Items>
                                </dx:CardViewToolbar>
                            </Toolbars>
                            <EditFormLayoutProperties>
                                <Items>

                                    <dx:CardViewCommandLayoutItem HorizontalAlign="Right">
                                    </dx:CardViewCommandLayoutItem>

                                    <dx:CardViewColumnLayoutItem ColumnName="Address Id" Visible="False">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>

                                    <dx:CardViewColumnLayoutItem ColumnName="StreetNo">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="Address Line1">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="AddressLine2">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="City">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="StateId" Caption="State">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="LgaId" Caption="Lga">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="CountryId" Caption="Country">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="PostCode">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="IsPrimary">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:EditModeCommandLayoutItem HorizontalAlign="Right">
                                    </dx:EditModeCommandLayoutItem>
                                </Items>
                                <SettingsItemCaptions Location="Left" />
                            </EditFormLayoutProperties>
                            <CardLayoutProperties>
                                <Items>
                                    <dx:CardViewCommandLayoutItem HorizontalAlign="Right">
                                    </dx:CardViewCommandLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="Address Id" Visible="False">
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="StreetNo">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="Address Line1">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="AddressLine2">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="CountryId" Caption="Country">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="StateId" Caption="State">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="City">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="LgaId" Caption="Lga">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="PostCode">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="IsPrimary">
                                        <CaptionSettings Location="Left" />
                                    </dx:CardViewColumnLayoutItem>
                                    <dx:EditModeCommandLayoutItem HorizontalAlign="Right">
                                    </dx:EditModeCommandLayoutItem>
                                </Items>
                                <SettingsItemCaptions Location="Left" />
                            </CardLayoutProperties>
                            <StylesExport>
                                <Card BorderSides="All" BorderSize="1">
                                </Card>
                                <Group BorderSides="All" BorderSize="1">
                                </Group>
                                <TabbedGroup BorderSides="All" BorderSize="1">
                                </TabbedGroup>
                                <Tab BorderSize="1">
                                </Tab>
                            </StylesExport>
                        </dx:ASPxCardView>


                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Attachments">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:ASPxGridView ID="AttachmentGridview" runat="server" AutoGenerateColumns="False" KeyFieldName="FileId" OnDataBinding="AttachmentGridview_DataBinding" OnRowInserting="AttachmentGridview_RowInserting" Width="100%" OnRowDeleting="AttachmentGridview_RowDeleting" OnCustomErrorText="AttachmentGridview_CustomErrorText">
<SettingsAdaptivity>
<AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
</SettingsAdaptivity>

                            <SettingsEditing Mode="PopupEditForm">
                            </SettingsEditing>
                            <SettingsDataSecurity AllowEdit="False" />
                            <SettingsPopup>
                                <EditForm Modal="True" VerticalAlign="Above" HorizontalAlign="Center">
                                </EditForm>
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
                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="7" Width="100px">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="FileId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="FileName" ShowInCustomizationForm="True" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="FileDescription" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <PropertiesTextEdit>
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </PropertiesTextEdit>
                                    <Settings AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowFilterRowMenuLikeItem="False" ShowInFilterControl="False" />
                                    <EditFormSettings Caption="File Name" CaptionLocation="Top" />
                                    <DataItemTemplate>
                                        <dx:ASPxButton ID="DownloadButton" runat="server" CommandArgument='<%# Eval("FileId") %>' CommandName="Download" OnClick="DownloadButton_Click" RenderMode="Link" Text='<%# Eval("FileDescription") %>' UseSubmitBehavior="False">
                                        </dx:ASPxButton>
                                    </DataItemTemplate>
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
                                        <dx:ASPxUploadControl ID="FileUploadControl" runat="server" OnFileUploadComplete="FileUploadControl_FileUploadComplete" ShowUploadButton="True" AutoStartUpload="True">
                                            <ValidationSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png, .doc, .docx, .xls, .xlsx, .pdf">
                                            </ValidationSettings>
                                            <BrowseButton Text="Select a file for upload..">
                                            </BrowseButton>
                                            <AdvancedModeSettings EnableDragAndDrop="True" EnableFileList="True">
                                            </AdvancedModeSettings>
                                        </dx:ASPxUploadControl>
                                    </EditItemTemplate>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Created By" FieldName="CreatedBy" ShowInCustomizationForm="True" VisibleIndex="6">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <Toolbars>
                                <dx:GridViewToolbar ItemAlign="Right">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="New" Text="Add New Attachment">
                                        </dx:GridViewToolbarItem>
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>
                        </dx:ASPxGridView>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
    <p>
        <a href="ITaxpayerList.aspx">Back to list</a>
    </p>


    <asp:EntityDataSource ID="StateDataSource" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="States">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="CountryDataSource" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Countries">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="LgaDataSource" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="LGAs">
    </asp:EntityDataSource>
</asp:Content>
