<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="ITINRequestList.aspx.cs" Inherits="TAAPs.Registration.ITINRequestList" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v19.2.Web.WebForms, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        var birthState = null;
        var originState = null;
        var addressState = null;

        function OnStateChanged(control) {
            switch (control) {
                case birthStateCombo:
                    if (birthLgaCombo.InCallback())
                        birthState = birthStateCombo.GetValue().toString();
                    else
                        birthLgaCombo.PerformCallback(birthStateCombo.GetValue().toString());
                    break;
                case originStateCombo:
                    if (originLgaCombo.InCallback())
                        originState = originStateCombo.GetValue().toString();
                    else
                        originLgaCombo.PerformCallback(originStateCombo.GetValue().toString());
                    break;

                case addressStateCombo:
                    if (addressLgaCombo.InCallback())
                        addressState = addressStateCombo.GetValue().toString();
                    else
                        addressLgaCombo.PerformCallback(addressStateCombo.GetValue().toString());
                    break;
            }
        }

        function OnEndCallback(s) {
            switch (s) {
                case birthLgaCombo:
                    if (birthState) {
                        birthStateCombo.PerformCallback(birthState);
                        birthState = null;
                    }
                case originLgaCombo:
                    if (originState) {
                        originStateCombo.PerformCallback(originState);
                        originState = null;
                    }
                case addressLgaCombo:
                    if (addressState) {
                        addressStateCombo.PerformCallback(addressState);
                        addressState = null;
                    }
            }
        }

        function OnToolbarItemClick(s, e)
        {
            if (e.item.name == "AddTINRequest") {
                e.processOnServer = true;
                e.usePostBack = true;
            }
        }

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Individual TIN Request

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    TIN Requests
</asp:Content>




<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
    <div>
    </div>

    <dx:EntityServerModeDataSource ID="TinRequestEntityServerDataSource" runat="server" ContextTypeName="TAAPs.Model.TAAPsDBContext" OnSelecting="TinRequestEntityServerDataSource_Selecting" TableName="ITINRequests" EnableInsert="True" EnableUpdate="True" />
    <asp:MultiView ID="TinRequestMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="RequestListView" runat="server">

            <dx:ASPxGridView ID="TinRequestGridview" runat="server" AutoGenerateColumns="False" ClientInstanceName="mastergrid" DataSourceID="TinRequestEntityServerDataSource" KeyFieldName="RequestId" Width="100%" OnToolbarItemClick="TinRequestGridview_ToolbarItemClick">
                <ClientSideEvents CustomButtonClick="function(s, e) { s.StartEditRow(e.visibleIndex);}" ToolbarItemClick="OnToolbarItemClick" />
                <SettingsAdaptivity>
                    <AdaptiveDetailLayoutProperties ColCount="1">
                    </AdaptiveDetailLayoutProperties>
                </SettingsAdaptivity>
                <SettingsEditing Mode="EditForm">
                </SettingsEditing>
                <Settings ShowFilterRow="True" />
                <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                <SettingsDataSecurity AllowDelete="False" />
                <SettingsText CommandCancel="Reject" CommandEdit="View" CommandUpdate="Register" PopupEditFormCaption="Individual TIN Request Approval" />
                <EditFormLayoutProperties>
                    <SettingsItemCaptions Location="Top" />
                </EditFormLayoutProperties>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="MiddleName" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="CreateDate" SortIndex="0" SortOrder="Descending" VisibleIndex="7">
                        <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataHyperLinkColumn FieldName="RequestId" ReadOnly="True" VisibleIndex="0">
                        <PropertiesHyperLinkEdit NavigateUrlFormatString="" TextField="RequestId">
                        </PropertiesHyperLinkEdit>
                        <DataItemTemplate>
                            <dx:ASPxButton ID="RequestIdButton" runat="server" OnClick="RequestIdButton_Click" RenderMode="Link" Text='<%# Eval("RequestId") %>'>
                            </dx:ASPxButton>
                        </DataItemTemplate>
                    </dx:GridViewDataHyperLinkColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="Status" VisibleIndex="8">
                        <PropertiesComboBox>
                            <Items>
                                <dx:ListEditItem Text="Submitted" Value="Submitted" />
                                <dx:ListEditItem Text="Approved" Value="Approved" />
                                <dx:ListEditItem Text="Rejected" Value="Rejected" />
                            </Items>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="CreatedBy" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
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

        <asp:View ID="RequestUpdateView" runat="server">

            <dx:ASPxFormLayout ID="TinRequestForm" runat="server" OnDataBinding="TinRequestForm_DataBinding" Width="100%" ColCount="1">
                <Items>
                    <dx:TabbedLayoutGroup Width="100%">
                        <Items>
                            <dx:LayoutGroup Caption="Taxpayer Info" ColCount="3">
                                <Items>
                                    <dx:LayoutItem FieldName="LastName">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E4" runat="server" Width="100%">
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
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E5" runat="server" Width="100%">
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
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E6" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem FieldName="BVN">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E11" runat="server" Width="100%" MaxLength="11">
                                                    <ClientSideEvents KeyPress="function(s, e) {
	ValidateNumber(e);
}" />
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem FieldName="NIN">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E12" runat="server" Width="100%" MaxLength="11">
                                                    <ClientSideEvents KeyPress="function(s, e) {
	ValidateNumber(e);
}" />
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="JTB TIN" FieldName="JTBTIN">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E13" runat="server" Width="100%" MaxLength="10">
                                                    <ClientSideEvents KeyPress="function(s, e) {
	ValidateNumber(e);
}" />
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem FieldName="Title">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="ASPxFormLayout1_E3" runat="server" Width="100%">
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem FieldName="MaritalStatus">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="ASPxFormLayout1_E8" runat="server" Width="100%">
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
                                    <dx:LayoutItem FieldName="Gender">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="ASPxFormLayout1_E10" runat="server" Width="100%">
                                                    <Items>
                                                        <dx:ListEditItem Text="Female" Value="F" />
                                                        <dx:ListEditItem Text="Male" Value="M" />
                                                    </Items>
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Nationality" FieldName="NationalityId">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="NationalityCombo" runat="server" Width="100%">
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem FieldName="BirthDate">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxDateEdit ID="BirthDateDateEdit" runat="server" Width="100%" EditFormat="Custom" EditFormatString="dd/MM/yyyy" NullText="dd/mm/yyyy">
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxDateEdit>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Country of Birth " FieldName="BirthCountryId">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="BirthCountryCombo" runat="server" Width="100%">
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="State of Birth" FieldName="BirthStateId">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="BirthStateCombo" runat="server" ClientInstanceName="birthStateCombo" Width="100%" AllowNull="True">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	OnStateChanged(s);
}" />
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="City of Birth" FieldName="BirthCity">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E54" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="State of Origin" FieldName="OriginStateId">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="OriginStateCombo" runat="server" ClientInstanceName="originStateCombo" Width="100%">
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
                                    <dx:LayoutItem Caption="Origin Lga" FieldName="OriginLgaId">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="OriginLgaCombo" runat="server" ClientInstanceName="originLgaCombo" OnCallback="OriginLgaCombo_Callback" Width="100%" AllowNull="True">
                                                    <ClientSideEvents EndCallback="function(s, e) {
	OnEndCallback(s);
}" />
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem FieldName="Profession">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="ProfessionCombo" runat="server" Width="100%">
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Staff ID" FieldName="EmploymentId">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E28" runat="server" Width="100%">
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Employment Category" FieldName="EmploymentStatus">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="EmpCategoryCombo" runat="server" Width="100%">
                                                    <Items>
                                                        <dx:ListEditItem Text="Employed" Value="Employed" />
                                                        <dx:ListEditItem Text="Self Employed" Value="Self Employed" />
                                                        <dx:ListEditItem Text="Foreign" Value="Foreign" />
                                                        <dx:ListEditItem Text="Others" Value="Others" />
                                                    </Items>
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ColSpan="2" FieldName="Employer">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="TinRequestForm_E2" runat="server">
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
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E32" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Tax Office" FieldName="TaxOfficeId">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="TaxOfficeCombo" runat="server" Width="100%">
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Primary Phone" FieldName="Phone1">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxSpinEdit ID="TinRequestForm_E3" runat="server" MaxLength="13" NumberType="Integer" MaxValue="9999999999999" NullText="Enter phone number">
                                                    <SpinButtons ClientVisible="False">
                                                    </SpinButtons>
                                                </dx:ASPxSpinEdit>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Secondary Phone" FieldName="Phone2">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E50" runat="server" Width="100%" MaxLength="13">
                                                    <ClientSideEvents KeyPress="function(s, e) {
	ValidateNumber(e);
}" />
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem FieldName="Website">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E48" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ColSpan="3" FieldName="Email">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E47" runat="server" Width="100%">
                                                    <ValidationSettings>
                                                        <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            <dx:LayoutGroup Caption="Address" ColCount="2">
                                <Items>
                                    <dx:LayoutItem ColSpan="1" FieldName="StreetNo">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E41" runat="server" Width="100%">
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ColSpan="1" FieldName="AddressCity">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E44" runat="server" Width="100%">
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ColSpan="2" FieldName="AddressLine1">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E42" runat="server" Width="100%">
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ColSpan="2" FieldName="AddressLine2">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="ASPxFormLayout1_E43" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Address State" FieldName="AddressStateId">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="AddressStateCombo" runat="server" ClientInstanceName="addressStateCombo" Width="100%">
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
                                    <dx:LayoutItem Caption="Address Lga" FieldName="AddressLgaId">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxComboBox ID="AddressLgaCombo" runat="server" ClientInstanceName="addressLgaCombo" OnCallback="AddressLgaCombo_Callback" Width="100%">
                                                    <ClientSideEvents BeginCallback="function(s, e) {
}"
                                                        EndCallback="function(s, e) {
	OnEndCallback(s);
}" />
                                                    <ValidationSettings>
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
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


            <hr />
            <div class="text-right">

                <dx:ASPxButton ID="ApproveButton" runat="server" Text="Approve" CausesValidation="False" OnClick="ApproveButton_Click"></dx:ASPxButton>
                <dx:ASPxButton ID="RejectButton" runat="server" Text="Reject" OnClick="RejectButton_Click" CausesValidation="False"></dx:ASPxButton>
                <dx:ASPxButton ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click"></dx:ASPxButton>
                <dx:ASPxButton ID="CancelButton" runat="server" Text="Cancel" AutoPostBack="False" CausesValidation="False" OnClick="CancelButton_Click"></dx:ASPxButton>
            </div>

        </asp:View>
    </asp:MultiView>
</asp:Content>
