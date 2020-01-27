<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="IAssessmentList.aspx.cs" Inherits="FIRSTAAPs.Assessment.IAssessmentList" %>
<%@ Register assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

        <script type="text/javascript">

            var lastTIN = null;
            function OnTINChanged(tin) {

                comboTaxtype.ClearItems();

                if (comboTaxtype.InCallback())
                    lastTIN = comboTin.GetValue().toString();
                else {
                    lga.PerformCallback(comboTin.GetValue().toString());
                }
            }

            function OnEndCallback(s, e) {
                if (lastTIN) {
                    comboTaxtype.PerformCallback(lastTIN);
                    lastTIN = null;
                }
            }
    </script>

    <dx:ASPxGridView ID="ASPxgvAssessments" runat="server" AutoGenerateColumns="False" DataSourceID="edsIAssessment" KeyFieldName="AssessmentId" OnCustomErrorText="ASPxgvAssessments_CustomErrorText" OnRowInserting="ASPxgvAssessments_RowInserting" OnStartRowEditing="ASPxgvAssessments_StartRowEditing" OnRowUpdating="ASPxgvAssessments_RowUpdating">
        <ClientSideEvents RowDblClick="function(s, e) {
		s.StartEditRow(e.visibleIndex);
}" />
        <Templates>
            <EditForm>
                <dx:ASPxFormLayout ID="formLayout" runat="server" Width="100%">
                    <Items>
                        <dx:LayoutGroup Caption="Assessment Details" ColCount="3">
                            <Items>
                                <dx:LayoutItem Caption="Assessment #" FieldName="AssessmentId">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement1" runat="server" ColumnID="AssessmentId" ReplacementType="EditFormCellEditor" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="AssessmentYear">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement2" runat="server" ColumnID="AssessmentYear" ReplacementType="EditFormCellEditor" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="Currency">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox ID="ASPxFormLayout1_E13" runat="server" Value='<%# Eval("Currency") %>'>
                                                <Items>
                                                    <dx:ListEditItem Text="NGN" Value="NGN" />
                                                </Items>
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ColSpan="3" FieldName="TIN">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridLookup ID="ASPxTextTIN" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="edsITaxAccounts" KeyFieldName="TaxAccountNo" Value='<%# Eval("TaxAccountNo") %>' ClientInstanceName="comboTin">
                                                <GridViewProperties>
                                                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                    <SettingsSearchPanel Visible="True" />
                                                </GridViewProperties>
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="TaxAccountNo" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="TIN" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Tax Type" FieldName="TaxTypeId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Taxpayer Name" FieldName="ITaxpayer.TaxpayerName" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:ASPxGridLookup>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Form No" FieldName="FormNo">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement10" runat="server" ColumnID="FormNo" ReplacementType="EditFormCellEditor" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Form Title" ColSpan="2" FieldName="FormTitle">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement11" runat="server" ColumnID="FormTitle" ReplacementType="EditFormCellEditor" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Financial Details" ColCount="3">
                            <Items>
                                <dx:LayoutItem FieldName="GrossIncome">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement3" runat="server" ColumnID="GrossIncome" ReplacementType="EditFormCellEditor" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="ExemptAmount">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement4" runat="server" ColumnID="ExemptAmount" ReplacementType="EditFormCellEditor" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="AssesableIncome">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement5" runat="server" ColumnID="AssesableIncome" ReplacementType="EditFormCellEditor" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="TaxPayable">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement6" runat="server" ColumnID="TaxPayable" ReplacementType="EditFormCellEditor" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Payment Due Date" FieldName="PaymentDueDate">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement12" runat="server" ColumnID="PaymentDueDate" ReplacementType="EditFormCellEditor" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                        <dx:TabbedLayoutGroup>
                            <Items>
                                <dx:LayoutGroup Caption="Earned Income">
                                    <Items>
                                        <dx:LayoutItem Caption="Earned" ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxGridView ID="ASPxgvEarnedIncome" runat="server" AutoGenerateColumns="False" DataSourceID="edsAssessmentIncome" KeyFieldName="AssessmentId;IncomeId">
                                                        <SettingsPager Mode="ShowAllRecords">
                                                        </SettingsPager>
                                                        <SettingsEditing Mode="Batch">
                                                        </SettingsEditing>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="AssessmentId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Amount" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                                                                </PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataComboBoxColumn Caption="Income Description" FieldName="IncomeId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                <PropertiesComboBox DataSourceID="edsIncomes" TextField="IncomeName" ValueField="IncomeId">
                                                                </PropertiesComboBox>
                                                            </dx:GridViewDataComboBoxColumn>
                                                        </Columns>
                                                    </dx:ASPxGridView>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Unearned Income">
                                    <Items>
                                        <dx:LayoutItem Caption="Unearned" ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxGridView ID="ASPxgvUnearnedIncome" runat="server" AutoGenerateColumns="False" DataSourceID="edsUnearnedIncome" KeyFieldName="AssessmentId;IncomeId">
                                                        <SettingsPager Mode="ShowAllRecords">
                                                        </SettingsPager>
                                                        <SettingsEditing Mode="Batch">
                                                        </SettingsEditing>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="AssessmentId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Amount" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                                                                </PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataComboBoxColumn Caption="Income Description" FieldName="IncomeId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                <PropertiesComboBox DataSourceID="edsIncomes" TextField="IncomeName" ValueField="IncomeId">
                                                                </PropertiesComboBox>
                                                            </dx:GridViewDataComboBoxColumn>
                                                        </Columns>
                                                    </dx:ASPxGridView>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="Exclusions">
                                    <Items>
                                        <dx:LayoutItem Caption="Exempt Items" ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxGridView ID="ASPxgvExclusions" runat="server" AutoGenerateColumns="False" DataSourceID="edsExclusions" KeyFieldName="AssessmentId;ExemptItemId">
                                                        <SettingsPager Mode="ShowAllRecords">
                                                        </SettingsPager>
                                                        <SettingsEditing Mode="Batch">
                                                        </SettingsEditing>
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="AssessmentId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Amount" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                                                                </PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataComboBoxColumn Caption="Exempt Item Description" FieldName="ExemptItemId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                <PropertiesComboBox DataSourceID="edsTaxExclusions" TextField="ExemptItemName" ValueField="ExemptItemId">
                                                                </PropertiesComboBox>
                                                            </dx:GridViewDataComboBoxColumn>
                                                        </Columns>
                                                    </dx:ASPxGridView>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                            </Items>
                        </dx:TabbedLayoutGroup>
                        <dx:LayoutGroup Caption="Record Control" ShowCaption="False">
                            <Items>
                                <dx:LayoutItem Caption="Save or Cancel" ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement8" runat="server" ColumnID="" ReplacementType="EditFormUpdateButton" />
                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement9" runat="server" ColumnID="" ReplacementType="EditFormCancelButton" />
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
    <SettingsDataSecurity AllowDelete="False" />
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" Modal="True" VerticalAlign="Middle" Height="75%" MinWidth="800px" />
        </SettingsPopup>
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="14">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Assessment #" FieldName="AssessmentId" ReadOnly="True" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Year" FieldName="AssessmentYear" VisibleIndex="2">
                <PropertiesTextEdit Width="100%">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ITaxAccount.TIN" VisibleIndex="3" Caption="TIN">
                <PropertiesTextEdit Width="100%">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="GrossIncome" VisibleIndex="7" ReadOnly="True">
                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00" Width="100%">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ExemptAmount" VisibleIndex="8" ReadOnly="True">
                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00" Width="100%">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssesableIncome" VisibleIndex="9" ReadOnly="True">
                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00" Width="100%">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaxPayable" VisibleIndex="10" ReadOnly="True">
                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00" Width="100%">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="ITaxAccount.TaxTypeId" VisibleIndex="5" Caption="Tax Type">
                <PropertiesComboBox Width="100%">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Currency" VisibleIndex="6" Visible="False">
                <PropertiesComboBox Width="100%">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Taxpayer Name" FieldName="ITaxAccount.ITaxpayer.TaxpayerName" VisibleIndex="4">
                <PropertiesTextEdit Width="100%">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tax Account #" FieldName="TaxAccountNo" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FormNo" Visible="False" VisibleIndex="11">
                <PropertiesTextEdit Width="100%">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FormTitle" Visible="False" VisibleIndex="12">
                <PropertiesTextEdit Width="100%">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="PaymentDueDate" Visible="False" VisibleIndex="13">
                <PropertiesDateEdit Width="100%">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
        </Columns>
</dx:ASPxGridView>
<asp:EntityDataSource ID="edsIAssessment" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="IAssessments" Include="ITaxAccount,ItaxAccount.ITaxpayer">
</asp:EntityDataSource>
    <asp:EntityDataSource ID="edsITaxpayers" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="ITaxpayers" Select="it.[TIN], it.[TaxpayerName], it.[TaxOfficeID]" Where="it.TaxOfficeId = @TaxOfficeId">
        <WhereParameters>
            <asp:SessionParameter Name="TaxOfficeId" SessionField="TaxOfficeId" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>
<asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="IAssessmentIncomes" Include="Income" Where="it.Income.IncomeClassificationId = 'UI' &amp;&amp; it.AssessmentId = @AssessmentId" ID="edsUnearnedIncome" EntityTypeFilter="" Select="">
    <WhereParameters>
        <asp:SessionParameter Name="AssessmentId" SessionField="IAssessmentId" Type="Int32" />
    </WhereParameters>
</asp:EntityDataSource>

                            <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EntitySetName="ITaxAccounts" Include="ITaxpayer" Where="" ID="edsITaxAccounts" EntityTypeFilter="ITaxAccount">
</asp:EntityDataSource>

    <asp:EntityDataSource ID="edsIncomes" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Incomes" Select="it.[IncomeId], it.[IncomeName]">
    </asp:EntityDataSource>
<asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="IAssessmentIncomes" Include="Income" Where="it.Income.IncomeClassificationId = 'EI' &amp;&amp; it.AssessmentId = @AssessmentId
" ID="edsAssessmentIncome">
    <WhereParameters>
        <asp:SessionParameter Name="AssessmentId" SessionField="IAssessmentId" Type="Int32" />
    </WhereParameters>
</asp:EntityDataSource>
    <asp:EntityDataSource ID="edsTaxExclusions" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxExclusions" Select="it.[ExemptItemId], it.[ExemptItemName]">
    </asp:EntityDataSource>
    <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="IAssessmentExclusions" ID="edsExclusions" EntityTypeFilter="" Include="TaxExclusion" Select="" Where="it.AssessmentId = @AssessmentId">
        <WhereParameters>
            <asp:SessionParameter Name="AssessmentId" SessionField="IAssessmentId" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
