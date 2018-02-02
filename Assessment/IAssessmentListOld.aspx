﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="IAssessmentListOld.aspx.cs" Inherits="TAAPs.Assessment.IAssessmentListOld" %>
<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <dx:ASPxGridView ID="ASPxgvAssessments" runat="server" AutoGenerateColumns="False" DataSourceID="edsIAssessment" KeyFieldName="AssessmentId" OnCustomErrorText="ASPxgvAssessments_CustomErrorText" OnRowInserting="ASPxgvAssessments_RowInserting" OnStartRowEditing="ASPxgvAssessments_StartRowEditing" OnHtmlEditFormCreated="ASPxgvAssessments_HtmlEditFormCreated" OnInitNewRow="ASPxgvAssessments_InitNewRow" OnRowInserted="ASPxgvAssessments_RowInserted" OnAfterPerformCallback="ASPxgvAssessments_AfterPerformCallback">
		<ClientSideEvents RowDblClick="function(s, e) {
		s.StartEditRow(e.visibleIndex);
}" EndCallback="function(s, e) {
}" />
		<Templates>
			<EditForm>
				<dx:ASPxFormLayout ID="formLayout" runat="server" Width="100%">
					<Items>
						<dx:TabbedLayoutGroup Width="100%">
							<Items>
								<dx:LayoutGroup Caption="Assessment Info" ShowCaption="True">
                                    <Items>
                                        <dx:LayoutGroup Caption="Assessment Info" ColCount="6">
                                            <Items>
                                                <dx:LayoutItem Caption="Assessment #" FieldName="AssessmentId">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement1" runat="server" ColumnID="AssessmentId" ReplacementType="EditFormCellEditor" />
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Form No">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement10" runat="server" ColumnID="FormNo" ReplacementType="EditFormCellEditor" />
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Form Title" ColSpan="2">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement11" runat="server" ColumnID="FormTitle" ReplacementType="EditFormCellEditor" />
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
                                                <dx:LayoutItem FieldName="AssessmentDate">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement12" runat="server" ColumnID="AssessmentDate" ReplacementType="EditFormCellEditor" />
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem FieldName="TaxAccountNo" ColSpan="6">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxGridLookup ID="ASPxFormLayout1_E1" runat="server"  AutoGenerateColumns="False" ClientInstanceName="comboTin" DataSourceID="edsITaxAccounts" KeyFieldName="TaxAccountNo" Width="100%" Value='<%# Bind("TaxAccountNo") %>'>
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
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                            </Items>
                                        </dx:LayoutGroup>
                                        <dx:LayoutGroup Caption="Financial Details" ColCount="4">
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
                                                <dx:LayoutItem Caption="Assessable Income" FieldName="AssesableIncome">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer runat="server">
                                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement5" runat="server" ColumnID="AssessableIncome" ReplacementType="EditFormCellEditor" />
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
                                            </Items>
                                        </dx:LayoutGroup>
                                        <dx:LayoutGroup Caption="Record Control" ShowCaption="False" GroupBoxDecoration="HeadingLine" HorizontalAlign="Right" Width="100%">
                                            <Items>
                                                <dx:LayoutItem Caption="Save or Cancel" ShowCaption="False" HorizontalAlign="Right">
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
                                </dx:LayoutGroup>
								<dx:LayoutGroup Caption="Earned Income">
									<Items>
										<dx:LayoutItem Caption="Earned" ShowCaption="False">
											<LayoutItemNestedControlCollection>
												<dx:LayoutItemNestedControlContainer runat="server">
													<dx:ASPxGridView ID="ASPxgvEarnedIncome" runat="server" AutoGenerateColumns="False" DataSourceID="edsAssessmentIncome" KeyFieldName="AssessmentId;IncomeId" ClientInstanceName="gridEarnedIncome">
														<SettingsPager Mode="ShowAllRecords">
														</SettingsPager>
														<SettingsEditing Mode="Inline">
														</SettingsEditing>
														<Settings ShowFooter="True" />
														<Columns>
															<dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="3">
															</dx:GridViewCommandColumn>
															<dx:GridViewDataTextColumn FieldName="AssessmentId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
															</dx:GridViewDataTextColumn>
															<dx:GridViewDataTextColumn FieldName="Amount" ShowInCustomizationForm="True" VisibleIndex="2">
																<PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
																</PropertiesTextEdit>
															</dx:GridViewDataTextColumn>
															<dx:GridViewDataComboBoxColumn Caption="Description" FieldName="IncomeId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
																<PropertiesComboBox DataSourceID="edsIncomes" TextField="IncomeDescription" ValueField="IncomeId">
																	<ClearButton Visibility="Auto">
																	</ClearButton>
																</PropertiesComboBox>
															</dx:GridViewDataComboBoxColumn>
														</Columns>
														<TotalSummary>
															<dx:ASPxSummaryItem DisplayFormat="Earned Income From Employment:#,##0.00" FieldName="Amount" ShowInColumn="Amount" SummaryType="Sum" />
														</TotalSummary>
														<Styles AdaptiveDetailButtonWidth="22">
														</Styles>
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
															<dx:GridViewDataComboBoxColumn Caption="Description" FieldName="IncomeId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
																<PropertiesComboBox DataSourceID="edsIncomes" TextField="IncomeDescription" ValueField="IncomeId">
																	<ClearButton Visibility="Auto">
																	</ClearButton>
																</PropertiesComboBox>
															</dx:GridViewDataComboBoxColumn>
														</Columns>
														<Styles AdaptiveDetailButtonWidth="22">
														</Styles>
													</dx:ASPxGridView>
												</dx:LayoutItemNestedControlContainer>
											</LayoutItemNestedControlCollection>
										</dx:LayoutItem>
									</Items>
								</dx:LayoutGroup>
								<dx:LayoutGroup Caption="Trade Income">
									<Items>
										<dx:LayoutItem ShowCaption="False">
											<LayoutItemNestedControlCollection>
												<dx:LayoutItemNestedControlContainer runat="server">
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
														<Styles AdaptiveDetailButtonWidth="22">
														</Styles>
													</dx:ASPxGridView>
												</dx:LayoutItemNestedControlContainer>
											</LayoutItemNestedControlCollection>
										</dx:LayoutItem>
									</Items>
								</dx:LayoutGroup>
								<dx:LayoutGroup Caption="Tax Relief">
									<Items>
										<dx:LayoutItem Caption="Exempt Items" ShowCaption="False">
											<LayoutItemNestedControlCollection>
												<dx:LayoutItemNestedControlContainer runat="server">
													<dx:ASPxGridView ID="ASPxgvExclusions" runat="server" AutoGenerateColumns="False" DataSourceID="edsExclusions" KeyFieldName="AssessmentId;ExclusionId" OnHtmlRowPrepared="ASPxgvExclusions_HtmlRowPrepared" OnCellEditorInitialize="ASPxgvExclusions_CellEditorInitialize">
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
																	<ClearButton Visibility="Auto">
																	</ClearButton>
																</PropertiesComboBox>
															</dx:GridViewDataComboBoxColumn>
															<dx:GridViewDataTextColumn FieldName="TaxExclusion.IsComputed" ShowInCustomizationForm="True" VisibleIndex="3">
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
							    <dx:LayoutGroup Caption="Attachments">
                                    <Items>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
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
		<EditFormLayoutProperties ColCount="2">
        </EditFormLayoutProperties>
		<Columns>
			<dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="13" ShowNewButtonInHeader="True">
			</dx:GridViewCommandColumn>
			<dx:GridViewDataTextColumn Caption="Assessment #" FieldName="AssessmentId" ReadOnly="True" VisibleIndex="0" Width="100px">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="ITaxAccount.TIN" VisibleIndex="3" Caption="TIN" Width="100px" ReadOnly="True">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="GrossIncome" VisibleIndex="8" ReadOnly="True">
				<PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
				</PropertiesTextEdit>
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="ExemptAmount" VisibleIndex="9" ReadOnly="True">
				<PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
				</PropertiesTextEdit>
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
			<dx:GridViewDataTextColumn Caption="Taxpayer Name" FieldName="ITaxAccount.ITaxpayer.TaxpayerName" VisibleIndex="4" ReadOnly="True">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="FormNo" Visible="False" VisibleIndex="6">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="FormTitle" Visible="False" VisibleIndex="7">
			</dx:GridViewDataTextColumn>
		    <dx:GridViewDataComboBoxColumn Caption="Year" FieldName="AssessmentYear" VisibleIndex="1" Width="50px">
                <PropertiesComboBox DataSourceID="edsYears" ImageUrlField="YearId" TextField="YearId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="AssessmentDate" Visible="False" VisibleIndex="10">
                <PropertiesDateEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesDateEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataDateColumn>
		    <dx:GridViewDataTextColumn Caption="Tax Account #" FieldName="TaxAccountNo" VisibleIndex="2" Width="100px">
            </dx:GridViewDataTextColumn>
		</Columns>

<Styles AdaptiveDetailButtonWidth="22"></Styles>
</dx:ASPxGridView>
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
" ID="edsAssessmentIncome" EntityTypeFilter="" Select="">
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
    <dx:ASPxGridView ID="ASPxgvAssessments0" runat="server" AutoGenerateColumns="False" DataSourceID="edsIAssessment" KeyFieldName="AssessmentId" OnCustomErrorText="ASPxgvAssessments0_CustomErrorText" OnRowInserting="ASPxgvAssessments0_RowInserting" OnStartRowEditing="ASPxgvAssessments0_StartRowEditing" OnHtmlEditFormCreated="ASPxgvAssessments_HtmlEditFormCreated" OnInitNewRow="ASPxgvAssessments0_InitNewRow" OnRowInserted="ASPxgvAssessments0_RowInserted" OnAfterPerformCallback="ASPxgvAssessments0_AfterPerformCallback" OnDataBound="ASPxgvAssessments0_DataBound">
		<ClientSideEvents RowDblClick="function(s, e) {
		s.StartEditRow(e.visibleIndex);
}" EndCallback="function(s, e) {
}" />
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
                                            <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                            </dx:GridViewCommandColumn>
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
                <dx:GridViewLayoutGroup Caption="Assessment Info" ColCount="2">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="AssessmentYear">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="AssessmentId">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="TaxAccountNo">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="AssessmentDate">
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </dx:GridViewLayoutGroup>
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
                <dx:EditModeCommandLayoutItem HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
            <SettingsItemCaptions Location="Top" />
        </EditFormLayoutProperties>
		<Columns>
			<dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="13" ShowNewButtonInHeader="True">
			</dx:GridViewCommandColumn>
			<dx:GridViewDataTextColumn Caption="Assessment #" FieldName="AssessmentId" ReadOnly="True" VisibleIndex="0" Width="100px">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="ITaxAccount.TIN" VisibleIndex="3" Caption="TIN" Width="100px" ReadOnly="True">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="GrossIncome" VisibleIndex="8" ReadOnly="True">
				<PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
				</PropertiesTextEdit>
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="ExemptAmount" VisibleIndex="9" ReadOnly="True">
				<PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0.00">
				</PropertiesTextEdit>
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
			<dx:GridViewDataTextColumn Caption="Taxpayer Name" FieldName="ITaxAccount.ITaxpayer.TaxpayerName" VisibleIndex="4" ReadOnly="True">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="FormNo" Visible="False" VisibleIndex="6">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="FormTitle" Visible="False" VisibleIndex="7">
			</dx:GridViewDataTextColumn>
		    <dx:GridViewDataComboBoxColumn Caption="Year" FieldName="AssessmentYear" VisibleIndex="1" Width="50px">
                <PropertiesComboBox DataSourceID="edsYears" ImageUrlField="YearId" TextField="YearId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="AssessmentDate" Visible="False" VisibleIndex="10">
                <PropertiesDateEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesDateEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataDateColumn>
		    <dx:GridViewDataTextColumn Caption="Tax Account #" FieldName="TaxAccountNo" VisibleIndex="2" Width="100px">
            </dx:GridViewDataTextColumn>
		</Columns>

<Styles AdaptiveDetailButtonWidth="22"></Styles>
</dx:ASPxGridView>
    </asp:Content>
