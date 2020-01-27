<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="IAssessmentList.aspx.cs" Inherits="TAAPs.Assessment.IAssessmentList" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Individual Assessment
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Assessment List
</asp:Content>




<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
        <asp:EntityDataSource ID="edsIAssessment" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="IAssessments" Include="ITaxAccount,ITaxAccount.ITaxpayer" OnInserted="edsIAssessment_Inserted">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsITaxpayers" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="ITaxpayers" Select="it.[TIN], it.[TaxpayerName], it.[TaxOfficeID]" Where="it.TaxOfficeId = @TaxOfficeId">
            <WhereParameters>
                <asp:SessionParameter Name="TaxOfficeId" SessionField="TaxOfficeId" Type="String" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsYears" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Years" Select="it.[YearId]">
        </asp:EntityDataSource>
        <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="IAssessmentIncomes" Include="TaxIncome" Where="it.TaxIncome.IncomeTypeId = 'UI' &amp;&amp; it.AssessmentId = @AssessmentId" ID="edsUnearnedIncome">
            <WhereParameters>
                <asp:SessionParameter Name="AssessmentId" SessionField="IAssessmentId" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsIncomes" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxIncomes">
        </asp:EntityDataSource>
        <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EntitySetName="IAssessmentIncomes" Include="TaxIncome" Where="it.TaxIncome.IncomeTypeId = 'TI' &amp;&amp; it.AssessmentId = @AssessmentId" ID="edsAssessmentTradeIncome">
            <WhereParameters>
                <asp:SessionParameter Name="AssessmentId" SessionField="IAssessmentId" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="IAssessmentIncomes" Include="TaxIncome" Where="it.TaxIncome.IncomeTypeId = 'EI' &amp;&amp; it.AssessmentId = @AssessmentId
"
            ID="edsAssessmentIncome" EntityTypeFilter="" Select="">
            <WhereParameters>
                <asp:SessionParameter Name="AssessmentId" SessionField="IAssessmentId" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsTradeIncomes" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxIncomes" EntityTypeFilter="TaxIncome" Include="" Where="it.IncomeTypeId='TI'">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsITaxAccounts" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="ITaxAccounts" EntityTypeFilter="ITaxAccount" Include="ITaxpayer" Where="">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsTaxExclusions" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxExclusions">
        </asp:EntityDataSource>
        <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="IAssessmentExclusions" ID="edsExclusions" Include="TaxExclusion" Where="it.AssessmentId = @AssessmentId">
            <WhereParameters>
                <asp:SessionParameter Name="AssessmentId" SessionField="IAssessmentId" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsAttachments" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EntitySetName="IAssessmentFiles" Where="it.AssessmentId == @AssessmentId" EnableDelete="True">
            <WhereParameters>
                <asp:SessionParameter Name="AssessmentId" SessionField="IAssessmentId" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <dx:ASPxGridView ID="ASPxgvAssessments" runat="server" AutoGenerateColumns="False" DataSourceID="edsIAssessment" KeyFieldName="AssessmentId" OnCustomErrorText="ASPxgvAssessments_CustomErrorText" OnRowInserting="ASPxgvAssessments_RowInserting" OnStartRowEditing="ASPxgvAssessments_StartRowEditing" OnHtmlEditFormCreated="ASPxgvAssessments_HtmlEditFormCreated" OnInitNewRow="ASPxgvAssessments_InitNewRow" OnRowInserted="ASPxgvAssessments_RowInserted" ClientInstanceName="mastergrid" OnAfterPerformCallback="ASPxgvAssessments_AfterPerformCallback" OnCellEditorInitialize="ASPxgvAssessments_CellEditorInitialize" OnDataBound="ASPxgvAssessments_DataBound" Width="100%">
            <ClientSideEvents RowDblClick="function(s, e) {
		s.StartEditRow(e.visibleIndex);
}"
                EndCallback="function(s, e) {
}" />

<SettingsAdaptivity>
<AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
</SettingsAdaptivity>

            <Templates>
                <EditForm>
                    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0">
                        <TabPages>
                            <dx:TabPage Text="Assessment Info">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement13" runat="server" ColumnID="" ReplacementType="EditFormContent" />
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Earned Income">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="ASPxgvEarnedIncome" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridEarnedIncome" DataSourceID="edsAssessmentIncome" KeyFieldName="AssessmentId;IncomeId">
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <SettingsEditing Mode="Inline">
                                            </SettingsEditing>
                                            <Settings ShowFooter="True" />
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="100px">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="AssessmentId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Amount" ShowInCustomizationForm="True" VisibleIndex="2">
                                                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Description" FieldName="IncomeId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    <PropertiesComboBox DataSourceID="edsIncomes" TextField="IncomeDescription" ValueField="IncomeId">
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                            </Columns>
                                            <TotalSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="Earned Income From Employment:#,##0.00" FieldName="Amount" ShowInColumn="Amount" SummaryType="Sum" />
                                            </TotalSummary>
                                        </dx:ASPxGridView>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Unearned Income">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
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
                                                <dx:GridViewDataComboBoxColumn Caption="Description" FieldName="IncomeId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    <PropertiesComboBox DataSourceID="edsIncomes" TextField="IncomeDescription" ValueField="IncomeId">
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Trade Income">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="ASPxgvTradeIncome" runat="server" AutoGenerateColumns="False" DataSourceID="edsAssessmentTradeIncome" KeyFieldName="AssessmentId;IncomeId">
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
                                                <dx:GridViewDataComboBoxColumn Caption="Description" FieldName="IncomeId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    <PropertiesComboBox DataSourceID="edsTradeIncomes" TextField="IncomeDescription" ValueField="IncomeId">
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Reliefs">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="ASPxgvExclusions" runat="server" AutoGenerateColumns="False" DataSourceID="edsExclusions" KeyFieldName="AssessmentId;ExclusionId" OnCellEditorInitialize="ASPxgvExclusions_CellEditorInitialize" OnHtmlRowPrepared="ASPxgvExclusions_HtmlRowPrepared">
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <SettingsEditing Mode="Inline">
                                            </SettingsEditing>
                                            <SettingsDataSecurity AllowDelete="False" />
                                            <Columns>
                                                <dx:GridViewCommandColumn Caption="Actions" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="AssessmentId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Amount" ShowInCustomizationForm="True" VisibleIndex="2">
                                                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Description" FieldName="ExclusionId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    <PropertiesComboBox DataSourceID="edsTaxExclusions" TextField="ExclusionName" ValueField="ExclusionId">
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn FieldName="TaxExclusion.IsComputed" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Attachments">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView ID="gvAttachment" runat="server" AutoGenerateColumns="False" DataSourceID="edsAttachments" KeyFieldName="FileId" OnCustomErrorText="gvAttachment_CustomErrorText" OnRowInserting="gvAttachment_RowInserting">
                                            <SettingsEditing Mode="PopupEditForm">
                                            </SettingsEditing>
                                            <SettingsDataSecurity AllowEdit="False" />
                                            <SettingsText PopupEditFormCaption="Add Attachment" />
                                            <EditFormLayoutProperties>
                                                <Items>
                                                    <dx:GridViewColumnLayoutItem ColumnName="FileDescription">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="FileContent">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:EditModeCommandLayoutItem HorizontalAlign="Right">
                                                    </dx:EditModeCommandLayoutItem>
                                                </Items>
                                            </EditFormLayoutProperties>
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="8" Width="100px">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="FileId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="AssessmentId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="FileName" ShowInCustomizationForm="True" VisibleIndex="2">
                                                    <DataItemTemplate>
                                                        <dx:ASPxButton ID="btnFileDownload" runat="server" CommandArgument='<%# Eval("FileId") %>' CommandName="Download" OnClick="btnFileDownload_Click" RenderMode="Link" Text='<%# Eval("FileName") %>' UseSubmitBehavior="False">
                                                        </dx:ASPxButton>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="FileDescription" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="FileType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="CreatedBy" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6" Width="100px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="CreateDate" ShowInCustomizationForm="True" VisibleIndex="7" Width="100px">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="FileContent" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                                    <EditFormSettings Visible="True" />
                                                    <EditItemTemplate>
                                                        <dx:ASPxUploadControl ID="ucAttachFile" runat="server" OnFileUploadComplete="ucAttachFile_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" Width="300px">
                                                            <ValidationSettings AllowedFileExtensions=".rtf, .pdf, .doc, .docx, .odt, .txt, .pdf, .xls, .xlsx, .ppt, .pptx, .jpeg, .jpg, .gif, .png">
                                                            </ValidationSettings>
                                                        </dx:ASPxUploadControl>
                                                    </EditItemTemplate>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                        <ClientSideEvents ActiveTabChanged="function(s, e) {
}" />
                    </dx:ASPxPageControl>
                </EditForm>
            </Templates>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsDataSecurity AllowDelete="False" />
            <SettingsPopup>
                <EditForm Modal="True" />
            </SettingsPopup>
            <SettingsText PopupEditFormCaption="Edit Assessment" />
            <EditFormLayoutProperties>
                <Items>
                    <dx:GridViewLayoutGroup Caption="Assessment Info" ColCount="3">
                        <Items>
                            <dx:GridViewColumnLayoutItem Caption="Assessment No." ColumnName="AssessmentId">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="AssessmentYear">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="AssessmentDate">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="Form No">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="Form Title">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem Caption="Tax Account" ColSpan="3" ColumnName="TaxAccountNo">
                            </dx:GridViewColumnLayoutItem>
                        </Items>
                    </dx:GridViewLayoutGroup>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:GridViewLayoutGroup Caption="Financial Details" ColCount="4">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColumnName="GrossIncome">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="ExemptAmount">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="AssessableIncome">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="TaxPayable">
                            </dx:GridViewColumnLayoutItem>
                        </Items>
                    </dx:GridViewLayoutGroup>
                    <dx:EmptyLayoutItem>
                    </dx:EmptyLayoutItem>
                    <dx:GridViewLayoutGroup GroupBoxDecoration="HeadingLine" HorizontalAlign="Right" ShowCaption="False" Width="100%">
                        <Items>
                            <dx:EditModeCommandLayoutItem HorizontalAlign="Right">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                    </dx:GridViewLayoutGroup>
                </Items>
                <SettingsItemCaptions Location="Top" />
            </EditFormLayoutProperties>
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="13" ShowApplyFilterButton="True" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Assessment #" FieldName="AssessmentId" ReadOnly="True" VisibleIndex="0" Width="100px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ITaxAccount.TIN" VisibleIndex="3" Caption="TIN" Width="100px" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GrossIncome" VisibleIndex="8" ReadOnly="True" Visible="False">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ExemptAmount" VisibleIndex="9" ReadOnly="True" Visible="False">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AssessableIncome" VisibleIndex="11" ReadOnly="True">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TaxPayable" VisibleIndex="12" ReadOnly="True">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="ITaxAccount.TaxTypeId" VisibleIndex="5" Caption="Tax Type">
                    <PropertiesComboBox>
                        <ClearButton Visibility="Auto"></ClearButton>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="Taxpayer" FieldName="ITaxAccount.ITaxpayer.TaxpayerName" VisibleIndex="4" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FormNo" Visible="False" VisibleIndex="6">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FormTitle" Visible="False" VisibleIndex="7">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="AssessmentDate" Visible="False" VisibleIndex="10">
                    <PropertiesDateEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Tax Account #" FieldName="TaxAccountNo" VisibleIndex="2" Width="100px">
                    <EditItemTemplate>
                        <dx:ASPxGridLookup ID="ASPxFormLayout1_E1" runat="server" AutoGenerateColumns="False" ClientInstanceName="comboTin" DataSourceID="edsITaxAccounts" KeyFieldName="TaxAccountNo" Value='<%# Bind("TaxAccountNo") %>' Width="100%">
                            <GridViewProperties Caption="Tax Accounts">
                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                <SettingsSearchPanel Visible="True" />
                            </GridViewProperties>
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="TaxAccountNo" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Tax Type" FieldName="TaxTypeId" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Taxpayer Name" FieldName="ITaxpayer.TaxpayerName" ShowInCustomizationForm="True" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridLookup>
                    </EditItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Year" FieldName="AssessmentYear" VisibleIndex="1" Width="50px">
                    <PropertiesComboBox DataSourceID="edsYears" TextField="YearId" ValueField="YearId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>

            <Styles AdaptiveDetailButtonWidth="22"></Styles>
            <Toolbars>
                <dx:GridViewToolbar ItemAlign="Right">
                    <Items>
                        <dx:GridViewToolbarItem Command="Refresh" Text="Refresh">
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem BeginGroup="True" Text="Grid Options">
                            <Items>
                                <dx:GridViewToolbarItem Command="ShowFilterRow" Text="Show Filter">
                                </dx:GridViewToolbarItem>
                                <dx:GridViewToolbarItem Command="ShowFilterRowMenu" Text="Show FIlter Menu">
                                </dx:GridViewToolbarItem>
                            </Items>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem BeginGroup="True" Text="Export">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToPdf" Text="PDF">
                                </dx:GridViewToolbarItem>
                                <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Excel">
                                </dx:GridViewToolbarItem>
                            </Items>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem BeginGroup="True" Command="New" Text="Add New Assessment">
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
        </dx:ASPxGridView>
</asp:Content>
