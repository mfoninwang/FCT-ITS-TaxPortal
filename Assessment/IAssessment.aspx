<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="IAssessment.aspx.cs" Inherits="TAAPs.Assessment.IAssessment" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Individual Taxpayer Assessment
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Add Assessment
</asp:Content>



<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%" OnTabClick="ASPxPageControl1_TabClick">
            <TabPages>
                <dx:TabPage Text="Individual Assessment Info">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" DataSourceID="edsIAssessment" OnDataBound="ASPxFormLayout1_DataBound" Width="100%" ClientInstanceName="formlayout">
                                <Items>
                                    <dx:LayoutGroup Caption="Individual Assessment Info" ColCount="5">
                                        <Items>
                                            <dx:LayoutItem Caption="Assessment No" FieldName="AssessmentId">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="ASPxTextAssessmentNo" runat="server" Width="100%" ReadOnly="True">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem FieldName="AssessmentYear">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxComboBox ID="ASPxComboBoxAssessmentYear" runat="server" DataSourceID="edsYears" TextField="YearId" ValueField="YearId" ClientInstanceName="year" SelectedIndex="0">
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ColSpan="3" FieldName="TaxAccountNo">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxGridLookup ID="ASPxFormLayout1_E3" runat="server" AutoGenerateColumns="False" DataSourceID="edsITaxAccounts" KeyFieldName="TaxAccountNo" Width="100%">
                                                            <GridViewProperties Caption="Tax Accounts">
                                                                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
                                                            </GridViewProperties>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="TaxAccountNo" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="TIN" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Tax Type" FieldName="TaxTypeId" ShowInCustomizationForm="True" VisibleIndex="3" Width="100px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Taxpayer Name" FieldName="ITaxpayer.TaxpayerName" ShowInCustomizationForm="True" VisibleIndex="2" Width="400px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectButton="True" VisibleIndex="4">
                                                                </dx:GridViewCommandColumn>
                                                            </Columns>
                                                            <ClearButton Visibility="Auto">
                                                            </ClearButton>

                                                            <GridViewStyles AdaptiveDetailButtonWidth="22"></GridViewStyles>
                                                            <ValidationSettings>
                                                                <RequiredField IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxGridLookup>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>

                                            <dx:LayoutItem FieldName="FormNo">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E9" runat="server" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem ColSpan="3" FieldName="FormTitle">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="ASPxFormLayout1_E10" runat="server" Width="100%">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>

                                            <dx:LayoutItem FieldName="AssessmentDate" Caption="Assessment Date">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxDateEdit ID="dtAssessmentDate" runat="server" Width="100%">
                                                            <TimeSectionProperties>
                                                                <TimeEditProperties>
                                                                    <ClearButton Visibility="Auto">
                                                                    </ClearButton>
                                                                </TimeEditProperties>
                                                            </TimeSectionProperties>
                                                            <ClearButton Visibility="Auto">
                                                            </ClearButton>
                                                            <ValidationSettings>
                                                                <RequiredField IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>


                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup ColCount="5" ShowCaption="False">
                                        <Items>
                                            <dx:LayoutItem FieldName="GrossIncome">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="ASPxTextGrossIncome" runat="server" Width="100%" ReadOnly="True" DisplayFormatString="#,##0.00" HorizontalAlign="Right">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem FieldName="ExemptAmount">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="ASPxTextExemptAmount" runat="server" Width="100%" ReadOnly="True" DisplayFormatString="#,##0.00" HorizontalAlign="Right">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem FieldName="AssessableIncome">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="ASPxTextAssesableIncome" runat="server" Width="100%" ReadOnly="True" DisplayFormatString="#,##0.00" HorizontalAlign="Right" ClientInstanceName="AssessibleIncome">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem FieldName="TaxPayable">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxTextBox ID="ASPxTextPayable" runat="server" Width="100%" ReadOnly="True" DisplayFormatString="#,##0.00" HorizontalAlign="Right">
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>

                                            <dx:LayoutItem Caption=" " ShowCaption="true">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer>
                                                        <dx:ASPxButton ID="ASPxButtonTaxDetails" runat="server" RenderMode="Link" Text="View Tax Details" AutoPostBack="False" Height="25px" UseSubmitBehavior="False" VerticalAlign="Bottom">
                                                            <ClientSideEvents Click="function(s, e) {popup.Show(); popup.PerformCallback();}" />
                                                        </dx:ASPxButton>
                                                    </dx:LayoutItemNestedControlContainer>

                                                </LayoutItemNestedControlCollection>

                                            </dx:LayoutItem>

                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup ColCount="2" HorizontalAlign="Right" ShowCaption="False">
                                        <Items>
                                            <dx:LayoutItem Caption="Submit" ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxButton ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" AutoPostBack="False" Width="100%">
                                                            <ClientSideEvents Click="function(s, e) {    ASPxClientEdit.ValidateEditorsInContainer(formlayout); }" />
                                                        </dx:ASPxButton>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Save" HorizontalAlign="Right" ShowCaption="False">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                        <dx:ASPxButton ID="ASPxButtonCancel" runat="server" Text="Cancel" OnClick="ASPxButtonCancel_Click" Width="100%">
                                                        </dx:ASPxButton>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                </Items>
                                <SettingsItemCaptions Location="Top" />
                            </dx:ASPxFormLayout>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Earned Income">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="edsAssessmentIncome" KeyFieldName="AssessmentId;IncomeId" OnRowUpdated="ASPxGridView1_RowUpdated">
                                <ClientSideEvents BatchEditEndEditing="function(s, e) {
    gridExclusion.Refresh();
}" />
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <SettingsEditing Mode="Batch">
                                </SettingsEditing>
                                <SettingsDataSecurity AllowDelete="False" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Assessment No" FieldName="AssessmentId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Amount" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="#,##0.00">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="Description" FieldName="IncomeId" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesComboBox DataSourceID="edsEarnedIncomes" TextField="IncomeDescription" ValueField="IncomeId">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                </Columns>

                                <Styles AdaptiveDetailButtonWidth="22"></Styles>
                            </dx:ASPxGridView>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Unearned Income">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxGridView ID="ASPxgvUnearnedIncome" runat="server" AutoGenerateColumns="False" DataSourceID="edsUnearnedIncome" KeyFieldName="AssessmentId;IncomeId">
                                <ClientSideEvents BatchEditEndEditing="function(s, e) {
    gridExclusion.Refresh();
}" />
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
                                        <PropertiesComboBox DataSourceID="edsUnearnedTaxIncomes" TextField="IncomeDescription" ValueField="IncomeId">
                                            <ClearButton Visibility="Auto">
                                            </ClearButton>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                </Columns>

                                <Styles AdaptiveDetailButtonWidth="22"></Styles>
                            </dx:ASPxGridView>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Trading Income">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxGridView ID="ASPxgvTradeIncome" runat="server" AutoGenerateColumns="False" DataSourceID="edsAssessmentTradeIncome" KeyFieldName="AssessmentId;IncomeId">
                                <ClientSideEvents BatchEditEndEditing="function(s, e) {
    gridExclusion.Refresh();
}" />
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
                                        <PropertiesComboBox DataSourceID="edsTradeIncomes" TextField="IncomeDescription" ValueField="IncomeId">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                </Columns>
                                <Styles AdaptiveDetailButtonWidth="22">
                                </Styles>
                            </dx:ASPxGridView>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Tax Relief">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxGridView ID="ASPxgvExclusions" runat="server" AutoGenerateColumns="False" DataSourceID="edsExclusions" KeyFieldName="AssessmentId;ExclusionId" ClientInstanceName="gridExclusion">
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
                                    <dx:GridViewDataComboBoxColumn Caption="Description" FieldName="ExclusionId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesComboBox DataSourceID="edsTaxExclusions" TextField="ExclusionName" ValueField="ExclusionId">
                                            <ClearButton Visibility="Auto">
                                            </ClearButton>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                </Columns>

                                <Styles AdaptiveDetailButtonWidth="22"></Styles>
                            </dx:ASPxGridView>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Attachments">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxGridView ID="gvAttachment" runat="server" AutoGenerateColumns="False" DataSourceID="edsAttachments" KeyFieldName="FileId" OnCustomErrorText="gvAttachment_CustomErrorText" OnRowInserting="gvAttachment_RowInserting">
                                <SettingsDataSecurity AllowEdit="False" />
                                <EditFormLayoutProperties ColCount="2">
                                    <Items>
                                        <dx:GridViewColumnLayoutItem ColumnName="FileDescription">
                                        </dx:GridViewColumnLayoutItem>
                                        <dx:GridViewColumnLayoutItem ColumnName="FileContent">
                                        </dx:GridViewColumnLayoutItem>
                                        <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
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
        </dx:ASPxPageControl>


        <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="IAssessmentIncomes" Include="TaxIncome" Where="it.TaxIncome.IncomeTypeId = 'EI' &amp;&amp; it.AssessmentId = @AssessmentId
"
            ID="edsAssessmentIncome">
            <WhereParameters>
                <asp:Parameter Name="AssessmentId" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>

        <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EntitySetName="IAssessmentIncomes" Include="TaxIncome" Where="it.TaxIncome.IncomeTypeId = 'TI' &amp;&amp; it.AssessmentId = @AssessmentId" ID="edsAssessmentTradeIncome" EntityTypeFilter="" Select="" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:Parameter Name="AssessmentId" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsAttachments" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EntitySetName="IAssessmentFiles" Where="it.AssessmentId == @AssessmentId" EntityTypeFilter="" Select="">
            <WhereParameters>
                <asp:Parameter Name="AssessmentId" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsYears" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Years" Select="it.[YearId]">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsTradeIncomes" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxIncomes" EntityTypeFilter="TaxIncome" Include="" Where="it.IncomeTypeId='TI' &amp;&amp; it.TaxTypeId = @TaxTypeId">
            <WhereParameters>
                <asp:Parameter Name="TaxTypeId" Type="String" />
            </WhereParameters>
        </asp:EntityDataSource>

        <asp:EntityDataSource ID="edsIAssessment" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="IAssessments" EntityTypeFilter="IAssessment" OnInserted="edsIAssessment_Inserted">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsEarnedIncomes" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxIncomes" Where="it.IncomeTypeId = 'EI' &amp;&amp; it.TaxTypeId = @TaxTypeId">
            <WhereParameters>
                <asp:Parameter Name="TaxTypeId" Type="String" />
            </WhereParameters>
        </asp:EntityDataSource>

        <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="IAssessmentExclusions" ID="edsExclusions" Include="TaxExclusion" Where="it.AssessmentId = @AssessmentId">
            <WhereParameters>
                <asp:Parameter Name="AssessmentId" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsTaxExclusions" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxExclusions" Select="it.[ExclusionId], it.[ExclusionName], it.[TaxTypeId]" Where="it.TaxTypeId = @TaxTypeId" EntityTypeFilter="">
            <WhereParameters>
                <asp:Parameter Name="TaxTypeId" Type="String" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsUnearnedTaxIncomes" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxIncomes" Select="" EntityTypeFilter="" Where="it.IncomeTypeId = 'UI' &amp;&amp; it.TaxTypeId = @TaxTypeId">
            <WhereParameters>
                <asp:Parameter Name="TaxTypeId" Type="String" />
            </WhereParameters>
        </asp:EntityDataSource>

        <asp:EntityDataSource ID="edsITaxAccounts" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="ITaxAccounts" EntityTypeFilter="ITaxAccount" Include="ITaxpayer" Where="">
        </asp:EntityDataSource>



        <dx:ASPxGridView ID="ASPxgvIncome" runat="server" AutoGenerateColumns="False" EnableTheming="True" OnCustomUnboundColumnData="ASPxgvIncome_CustomUnboundColumnData" Theme="Default" Width="100%">
            <Settings ShowColumnHeaders="False" ShowFooter="True" ShowGroupButtons="False" ShowHeaderFilterBlankItems="False" ShowTitlePanel="True" />
            <SettingsBehavior ColumnResizeMode="NextColumn" />
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
            <SettingsText Title="Gross Income (a)" />
            <Columns>
                <dx:GridViewDataTextColumn Caption="Description" FieldName="IncomeDescription" ShowInCustomizationForm="True" VisibleIndex="1">
                    <Settings AllowAutoFilter="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Amount" FieldName="Amount" ShowInCustomizationForm="True" VisibleIndex="2" Width="150px">
                    <PropertiesTextEdit DisplayFormatString="#,##0.00">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" />
                    <HeaderStyle HorizontalAlign="Right" />
                    <CellStyle HorizontalAlign="Right">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="SNo" FieldName="SNo" ShowInCustomizationForm="True" VisibleIndex="0" UnboundType="Integer" Width="50px">
                    <Settings AllowAutoFilter="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total: #,##0.00" FieldName="Amount" SummaryType="Sum" />
            </TotalSummary>
            <Styles>
                <Footer Font-Bold="True">
                </Footer>
                <TitlePanel Font-Bold="True" HorizontalAlign="Left">
                </TitlePanel>
            </Styles>
        </dx:ASPxGridView>
        <p>
            <dx:ASPxGridView ID="ASPxgvExempt" runat="server" AutoGenerateColumns="False" OnCustomUnboundColumnData="ASPxgvExempt_CustomUnboundColumnData" Width="100%">
                <Settings ShowColumnHeaders="False" ShowFooter="True" ShowTitlePanel="True" />
                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                <SettingsText Title="Exempt Amount (b)" />
                <Columns>
                    <dx:GridViewDataTextColumn Caption="SNo" FieldName="SNo" ShowInCustomizationForm="True" UnboundType="Integer" VisibleIndex="0" Width="50px">
                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Description" ShowInCustomizationForm="True" VisibleIndex="1">
                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Amount" ShowInCustomizationForm="True" VisibleIndex="2" Width="150px">
                        <PropertiesTextEdit DisplayFormatString="#,##0.00">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                        <HeaderStyle HorizontalAlign="Right" />
                        <CellStyle HorizontalAlign="Right">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="Total: #,##0.00" FieldName="Amount" SummaryType="Sum" />
                </TotalSummary>
                <Styles>
                    <Footer Font-Bold="True">
                    </Footer>
                    <TitlePanel Font-Bold="True" HorizontalAlign="Left">
                    </TitlePanel>
                </Styles>
            </dx:ASPxGridView>
        </p>
        <p>

            <dx:ASPxLabel ID="ASPxLabelAssesableIncome" runat="server" Width="100%" Font-Bold="True" Font-Size="Large">
            </dx:ASPxLabel>

        </p>

        <p>
            <dx:ASPxGridView ID="ASPxgvTaxDetails" runat="server" AutoGenerateColumns="False" OnCustomUnboundColumnData="ASPxgvTaxDetails_CustomUnboundColumnData">
                <SettingsPager Visible="False">
                </SettingsPager>
                <Settings ShowFooter="True" ShowColumnHeaders="False" ShowTitlePanel="True" />
                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                <SettingsText Title="Tax Payable" />
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Rate" FieldName="TaxRateDetail" ShowInCustomizationForm="True" VisibleIndex="1">
                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Amount" FieldName="Amount" ShowInCustomizationForm="True" VisibleIndex="2" Width="150px">
                        <PropertiesTextEdit DisplayFormatString="#,##0.00">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="SNo" FieldName="SNo" ShowInCustomizationForm="True" UnboundType="Integer" VisibleIndex="0" Width="50px">
                        <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="Total: #,##0.00" FieldName="Amount" ShowInColumn="Amount" SummaryType="Sum" />
                </TotalSummary>
                <Styles>
                    <Footer Font-Bold="True">
                    </Footer>
                    <TitlePanel Font-Bold="True" HorizontalAlign="Left">
                    </TitlePanel>
                </Styles>
            </dx:ASPxGridView>


            <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="IAssessmentIncomes" Include="TaxIncome" Where="it.TaxIncome.IncomeTypeId = 'UI' &amp;&amp; it.AssessmentId = @AssessmentId" ID="edsUnearnedIncome" EntityTypeFilter="" Select="">
                <WhereParameters>
                    <asp:Parameter Name="AssessmentId" Type="Int32" />
                </WhereParameters>
            </asp:EntityDataSource>
</asp:Content>
