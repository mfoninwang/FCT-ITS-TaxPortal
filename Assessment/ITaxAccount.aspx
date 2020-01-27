
<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="ITaxAccount.aspx.cs" Inherits="TAAPs.Assessment.ITaxAccount" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Assessment
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Tax Accounts
</asp:Content>



<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
        <dx:ASPxGridView ID="ASPxgvTaxAccounts" runat="server" AutoGenerateColumns="False" DataSourceID="edsITaxAccounts" KeyFieldName="TaxAccountNo" OnStartRowEditing="ASPxgvTaxAccounts_StartRowEditing" OnCustomErrorText="ASPxgvTaxAccounts_CustomErrorText" OnHtmlEditFormCreated="ASPxgvTaxAccounts_HtmlEditFormCreated" OnInitNewRow="ASPxgvTaxAccounts_InitNewRow" OnCellEditorInitialize="ASPxgvTaxAccounts_CellEditorInitialize" Width="100%">
            <ClientSideEvents RowDblClick="function(s, e) {	s.StartEditRow(e.visibleIndex);}" />
            <Templates>
                <EditForm>
                    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="3">
                        <Items>
                            <dx:LayoutItem FieldName="TaxAccountNo">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement3" runat="server" ColumnID="TaxAccountNo" ReplacementType="EditFormCellEditor" />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Tax Type" FieldName="TaxTypeId">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement4" runat="server" ColumnID="TaxTypeId" ReplacementType="EditFormCellEditor" />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem FieldName="Currency">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement5" runat="server" ColumnID="Currency" ReplacementType="EditFormCellEditor" />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="2" FieldName="TIN">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement14" runat="server" ColumnID="TIN" ReplacementType="EditFormCellEditor" />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem FieldName="Status">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement6" runat="server" ColumnID="Status" ReplacementType="EditFormCellEditor" />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="3" FieldName="Description">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement13" runat="server" ColumnID="Description" ReplacementType="EditFormCellEditor" />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:TabbedLayoutGroup ColSpan="3">
                                <Items>
                                    <dx:LayoutGroup Caption="Account Summary" ColCount="5">
                                        <Items>
                                            <dx:LayoutItem Caption="Total Tax payable">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" DisplayFormatString="#,##0.00" HorizontalAlign="Right" ReadOnly="True" Text='<%# Eval("TotalTaxPayable") %>' Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Total Penalty">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E2" runat="server" DisplayFormatString="#,##0.00" HorizontalAlign="Right" ReadOnly="True" Text='<%# Eval("TotalPenalty") %>' Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Total Interest">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E3" runat="server" DisplayFormatString="#,##0.00" HorizontalAlign="Right" ReadOnly="True" Text='<%# Eval("TotalInterest") %>' Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Total Payments">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" DisplayFormatString="#,##0.00" HorizontalAlign="Right" ReadOnly="True" Text='<%# Eval("TotalPayment") %>' Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Account Balance">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="ASPxTextBox3" runat="server" DisplayFormatString="#,##0.00" HorizontalAlign="Right" ReadOnly="True" Text='<%# Eval("Balance") %>' Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Assessment History">
                                        <Items>
                                            <dx:LayoutItem Caption="">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="edsIAssessments" KeyFieldName="AssessmentId">
                                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="AssessmentId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Assessment #">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="AssessmentYear" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="GrossIncome" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00"></PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="ExemptAmount" ShowInCustomizationForm="True" VisibleIndex="6">
                                                                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00"></PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="AssessableIncome" ShowInCustomizationForm="True" VisibleIndex="7">
                                                                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00"></PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="TaxPayable" ShowInCustomizationForm="True" VisibleIndex="8">
                                                                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00"></PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <Styles AdaptiveDetailButtonWidth="22">
                                                            </Styles>
                                                        </dx:ASPxGridView>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Payment History">
                                        <Items>
                                            <dx:LayoutItem Caption="">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="edsPayments" KeyFieldName="PaymentReference">
                                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="PaymentReference" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="TIN" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="AssessmentId" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Assessment #">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Amount" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00"></PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn FieldName="PaymentDate" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                </dx:GridViewDataDateColumn>
                                                            </Columns>
                                                            <Styles AdaptiveDetailButtonWidth="22">
                                                            </Styles>
                                                        </dx:ASPxGridView>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Penalty History">
                                        <Items>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridView ID="gvPenalty" runat="server" AutoGenerateColumns="False" DataSourceID="edsPenalty" KeyFieldName="AssessmentId">
                                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="AssessmentId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="120px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Description" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Rate" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="PenaltyAmount" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatString="#,##0.00"></PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="TaxPayable" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <PropertiesTextEdit DisplayFormatString="#,##0.00"></PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn FieldName="CreateDate" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataTextColumn FieldName="CreatedBy" ShowInCustomizationForm="True" VisibleIndex="6" Width="100px">
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:ASPxGridView>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Interests">
                                        <Items>
                                            <dx:LayoutItem ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" DataSourceID="edsInterest" KeyFieldName="InterestId">
                                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="InterestId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="TaxAccountNo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Description" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="InterestRate" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="InterestAmount" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <PropertiesTextEdit DisplayFormatString="#,##0.00"></PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="ComputedBalance" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <PropertiesTextEdit DisplayFormatString="#,##0.00"></PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn FieldName="CreateDate" ShowInCustomizationForm="True" VisibleIndex="6">
                                                                </dx:GridViewDataDateColumn>
                                                            </Columns>
                                                        </dx:ASPxGridView>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                </Items>
                            </dx:TabbedLayoutGroup>
                            <dx:LayoutGroup ColCount="2" ShowCaption="False" GroupBoxDecoration="HeadingLine" HorizontalAlign="Right" Width="100%" ColSpan="3">
                                <Items>
                                    <dx:LayoutItem HorizontalAlign="Right" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <div class="text-right">
                                                    <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement11" runat="server" ColumnID="" ReplacementType="EditFormUpdateButton" />
                                                    <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement10" runat="server" ColumnID="" ReplacementType="EditFormCancelButton" />
                                                </div>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                        </Items>
                        <SettingsItemCaptions Location="Top" />
                    </dx:ASPxFormLayout>
                </EditForm>
            </Templates>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior AllowSelectSingleRowOnly="True" AllowSelectByRowClick="True" />
            <SettingsDataSecurity AllowDelete="False" />
            <SettingsPopup>
                <EditForm Modal="True" />
            </SettingsPopup>
            <SettingsText CommandEdit="View" PopupEditFormCaption="Edit Tax Account" />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="14" Width="80px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="TaxAccountNo" ReadOnly="True" VisibleIndex="0" Width="100px" Caption="Account #">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CreatedBy" Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="CreateDate" VisibleIndex="13">
                    <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Balance" ReadOnly="True" VisibleIndex="12">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalPayment" ReadOnly="True" VisibleIndex="11" Caption="Payments">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalTaxPayable" VisibleIndex="8" ReadOnly="True" Caption="Tax Payable">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ITaxpayer.TaxpayerName" VisibleIndex="2" Caption="Taxpayer Name" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tax Type" FieldName="TaxTypeId" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="edsTaxTypes" TextField="TaxTypeName" ValueField="TaxTypeId">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TIN" VisibleIndex="1" Caption="Taxpayer">
                    <PropertiesComboBox DataSourceID="edsITaxpayers" TextField="TaxpayerName" ValueField="TIN" DropDownWidth="100%" Spacing="2" Width="100%">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" ErrorText="Required" />
                        </ValidationSettings>
                        <Columns>
                            <dx:ListBoxColumn FieldName="TIN" />
                            <dx:ListBoxColumn FieldName="TaxpayerName" />
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn FieldName="Description" Visible="False" VisibleIndex="5">
                    <PropertiesTextEdit Width="100%">
                    </PropertiesTextEdit>
                    <EditFormSettings ColumnSpan="3" Visible="True" />
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataComboBoxColumn FieldName="Currency" VisibleIndex="4" Width="100px" Visible="False">
                    <PropertiesComboBox DataSourceID="edsCurrency" TextField="CurrencyCode" ValueField="CurrencyCode">
                        <Items>
                            <dx:ListEditItem Selected="True" Text="NGN" Value="NGN" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Status" Visible="False" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Active" Value="Active" />
                            <dx:ListEditItem Text="Dormant" Value="Dormant" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField ErrorText="Required" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn FieldName="TotalPenalty" ReadOnly="True" VisibleIndex="9" Caption="Penalty">
                    <PropertiesTextEdit DisplayFormatString="#,##0.00">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalInterest" ReadOnly="True" VisibleIndex="10" Caption="Interest">
                    <PropertiesTextEdit DisplayFormatString="#,##0.00">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>

            </Columns>
            <Toolbars>
                <dx:GridViewToolbar ItemAlign="Right">
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Text="Add New Tax Account">
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <FormatConditions>
                <dx:GridViewFormatConditionHighlight Expression="[Balance] &lt; 0" FieldName="Balance" Format="RedText">
                </dx:GridViewFormatConditionHighlight>
            </FormatConditions>

            <Styles AdaptiveDetailButtonWidth="22"></Styles>
        </dx:ASPxGridView>
        <asp:EntityDataSource ID="edsITaxAccounts" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="ITaxAccounts" Include="ITaxpayer">
            <InsertParameters>
                <%--            <asp:Parameter Name="TIN" Type="String" />
            <asp:Parameter Name="TaxTypeId" Type="String" />
            <asp:Parameter Name="Currency" Type="String" />
            <asp:Parameter Name="Status" Type="String" />--%>
                <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
            </InsertParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsITaxpayers" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="ITaxpayers" EntityTypeFilter="" Select="it.[TIN], it.[TaxpayerName], it.[TaxOfficeID]" Where="">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsInterest" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="IInterests" Include="ItaxAccount" Where="it.TaxAccountNo==@TaxAccountNo">
            <WhereParameters>
                <asp:SessionParameter Name="TaxAccountNo" SessionField="TaxAccountNo" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsPayments" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Payments" EntityTypeFilter="Payment" Where="it.TIN=@TIN">
            <WhereParameters>
                <asp:SessionParameter Name="TIN" SessionField="AccountTIN" Type="String" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsPenalty" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="IPenalties" EntityTypeFilter="IPenalty" Include="IAssessment" Where="it.IAssessment.TaxAccountNo=@TaxAccountNo">
            <WhereParameters>
                <asp:SessionParameter Name="TaxAccountNo" SessionField="TaxAccountNo" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxTypes" ID="edsTaxTypes" Select="it.[TaxTypeId], it.[TaxTypeName]">
        </asp:EntityDataSource>
        <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EntitySetName="Currencies" ID="edsCurrency">
        </asp:EntityDataSource>
        <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EntitySetName="IAssessments" EntityTypeFilter="IAssessment" ID="edsIAssessments" Where="it.TaxAccountNo=@TaxAccountNo" Include="ITaxAccount" Select="">
            <WhereParameters>
                <asp:SessionParameter Name="TaxAccountNo" SessionField="TaxAccountNo" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
</asp:Content>
