<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="CTINRequestList.aspx.cs" Inherits="TAAPs.Registration.CTINRequestList" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v18.1.Web.WebForms, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
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

        function OnGetCacRowValues(values) {
            companyNameText.SetText(values[1]);
            registrationDateEdit.SetDate(values[2]);
        }

        function OnToolbarItemClick(s, e) {
            if (e.item.name == "AddTINRequest") {
                e.processOnServer = true;
                e.usePostBack = true;
            }
        }


    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Corporate TIN Request
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    TIN Requests
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="panelHeading" runat="server">
    <%--<div class="btn-group">--%>
        <a class="btn btn-info" href="#">
            <i class="glyphicon glyphicon-align-justify"></i>
            Corporate TIN Request List
        </a>
    <%--</div>--%>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">

    <asp:MultiView ID="TinRequestMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="RequestListView" runat="server">

            <dx:ASPxGridView ID="TinRequestGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="mastergrid" DataSourceID="TinRequestEntityServerModeDataSource" KeyFieldName="RequestId" Width="100%" OnToolbarItemClick="TinRequestGrid_ToolbarItemClick">
                <ClientSideEvents ToolbarItemClick="OnToolbarItemClick" />
                <SettingsAdaptivity>
                    <AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
                </SettingsAdaptivity>
                <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
                <Settings ShowFilterRow="True" />
                <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                <SettingsText PopupEditFormCaption="Corporate TIN Request" />
                <EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="RequestId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                        <DataItemTemplate>
                            <dx:ASPxButton ID="RequestIdButton" runat="server" OnClick="RequestIdButton_Click" RenderMode="Link" Text='<%# Eval("RequestId") %>'></dx:ASPxButton>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CompanyName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="CreateDate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="22">
                        <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy hh:mm tt"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Created By" FieldName="CreatedBy" VisibleIndex="20"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="21"></dx:GridViewDataTextColumn>
                </Columns>
                <Toolbars>
                    <dx:GridViewToolbar ItemAlign="Right">
                        <Items>
                            <dx:GridViewToolbarItem Command="Refresh" Text="Refresh">
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem BeginGroup="True" Name="AddTINRequest" Text="Add TIN Request">
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
            </dx:ASPxGridView>
        </asp:View>

        <asp:View ID="RequestView" runat="server">
            <dx:ASPxFormLayout ID="TinRequestForm" runat="server" Width="100%" ColCount="2" ColumnCount="2" OnDataBinding="TinRequestForm_DataBinding">
                <Items>
                    <dx:LayoutItem FieldName="RequestId">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="TinRequestForm_E2" runat="server" Enabled="False" ReadOnly="True"></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="CompanyType" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="CompanyTypeCombo" runat="server" ClientInstanceName="companyTypeCombo" AutoPostBack="True" OnValueChanged="CompanyTypeCombo_ValueChanged">
                                    <Items>
                                        <dx:ListEditItem Text="Corporate" Value="Corporate" />
                                        <dx:ListEditItem Text="Enterprise" Value="Enterprise" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="CacNumber" Caption="CAC Number">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">

                                <dx:ASPxGridLookup ID="CacNumberGridLookup" runat="server" AutoGenerateColumns="False"  Width="100%" KeyFieldName="CacNumber" PopupHorizontalAlign="NotSet" PopupVerticalAlign="WindowCenter" TextFormatString="{0}" OnTextChanged="CacNumberGridLookup_ValueChanged" DataSourceID="CacEntityServerModeDataSource">
                                    <GridViewProperties Caption="Registered Companies">
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                        <Settings ShowFilterRow="True" />
                                        <EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
                                    </GridViewProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="CAC Number" FieldName="CacNumber" ShowInCustomizationForm="True" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="CompanyName" ShowInCustomizationForm="True" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn FieldName="RegistrationDate" ShowInCustomizationForm="True" VisibleIndex="3"></dx:GridViewDataDateColumn>
                                    </Columns>
                                </dx:ASPxGridLookup>

                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="BNNumber" Caption="Business Name Number">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="BNNumberText" runat="server" Width="100%" ClientInstanceName="businessNameText"></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="CompanyName" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="CompanyNameTextBox" runat="server" Width="170px" Enabled="False" ClientInstanceName="companyNameText">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Business Line" FieldName="BusinessLineId" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="BusinessLineCombo" runat="server">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="RegistrationDate" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="RegistrationDateEdit" runat="server" ClientInstanceName="registrationDateEdit" Width="100%">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="TaxOfficeId" Caption="Tax Office" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="TaxOfficeCombo" runat="server"></dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="PreviousFCTTin">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="TinRequestForm_E4" runat="server"></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="CreatedBy">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E20" runat="server" Width="170px" Enabled="False" ReadOnly="True"></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:TabbedLayoutGroup ColSpan="2" ColumnSpan="2" Width="100%">
                        <Items>
                            <dx:LayoutGroup Caption="Registered Address Information" ColCount="2" ColSpan="2" ColumnCount="2" ColumnSpan="2" GroupBoxDecoration="HeadingLine" ShowCaption="False">
                                <Items>
                                    <dx:LayoutItem Caption="Street No" ColSpan="1" FieldName="RegisteredAddressStreetNo">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E22" runat="server" Width="170px"></dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="City" ColSpan="1" FieldName="RegisteredAddressCity">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E11" runat="server" Width="170px">
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Street" ColSpan="2" ColumnSpan="2" FieldName="RegisteredAddressStreet">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E10" runat="server" Width="170px"></dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Country" ColSpan="1" FieldName="RegisteredAddressCountryId">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="CountryCombo" runat="server" ClientInstanceName="addressCountryCombo">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	OnStateChanged(s);
}" />
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="State" ColSpan="1" FieldName="RegisteredAddressStateId">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="AddressStateCombo" runat="server" ClientInstanceName="addressStateCombo" OnCallback="AddressStateCombo_Callback">
                                                    <ClientSideEvents EndCallback="function(s, e) {
	OnEndCallback(s);
}"
                                                        SelectedIndexChanged="function(s, e) {
	OnStateChanged(s);
}" />
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Lga" ColSpan="1" FieldName="RegisteredAddressLgaId">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="LgaCombo" runat="server" ClientInstanceName="addressLgaCombo" OnCallback="LgaCombo_Callback">
                                                    <ClientSideEvents EndCallback="function(s, e) {
	OnEndCallback(s);
}" />
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ColSpan="1" FieldName="Website">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E18" runat="server" Width="170px">
                                                    <ValidationSettings>
                                                        <RegularExpression ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ColSpan="1" FieldName="ContactPerson">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E19" runat="server" Width="170px">
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ColSpan="1" FieldName="ContactPersonPhone">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="TinRequestForm_E7" runat="server">
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ColSpan="1" FieldName="PrimaryPhone">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E15" runat="server" Width="170px" MaxLength="13" NullText="2348033333333">
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ColSpan="1" FieldName="SecondaryPhone">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E16" runat="server" Width="170px" MaxLength="13" NullText="2348033333333"></dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ColSpan="2" ColumnSpan="2" FieldName="Email">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E17" runat="server" Width="170px">
                                                    <ValidationSettings>
                                                        <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                        </Items>
                    </dx:TabbedLayoutGroup>
                </Items>
                <SettingsItemCaptions Location="Top" />
            </dx:ASPxFormLayout>
            <div class="text-right">
                <hr />
                <dx:ASPxButton ID="ApproveButton" runat="server" Text="Approve" CausesValidation="False" OnClick="ApproveButton_Click"></dx:ASPxButton>
                <dx:ASPxButton ID="RejectButton" runat="server" Text="Reject" OnClick="RejectButton_Click" CausesValidation="False"></dx:ASPxButton>
                <dx:ASPxButton ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click"></dx:ASPxButton>
                <dx:ASPxButton ID="CancelButton" runat="server" Text="Cancel" AutoPostBack="False" CausesValidation="False" OnClick="CancelButton_Click"></dx:ASPxButton>
            </div>
        </asp:View>

    </asp:MultiView>

    <dx:EntityServerModeDataSource ID="TinRequestEntityServerModeDataSource" runat="server" ContextTypeName="TAAPs.Model.TAAPsDBContext" OnSelecting="TinRequestEntityServerModeDataSource_Selecting" TableName="CTINRequests" />
    <dx:EntityServerModeDataSource ID="CacEntityServerModeDataSource" runat="server" ContextTypeName="TAAPs.Model.TAAPsDBContext" OnSelecting="CacEntityServerModeDataSource_Selecting" TableName="RegisteredCompanies" />

</asp:Content>
