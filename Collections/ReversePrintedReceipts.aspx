<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ReversePrintedReceipts.aspx.cs" Inherits="TAAPs.Collections.ReversePrintedReceipts" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Xpo.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Xpo" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <script type="text/javascript">
        function OnCustomButtonClick(s, e) {
            OnDetailsClick(masterGrid.GetRowKey(e.visibleIndex))
        }

        function OnDetailsClick(keyValue) {
            popup.Show();
            popup.PerformCallback(keyValue);
        }
    </script>

    <dx:ASPxGridView ID="ASPxgvReceipts" runat="server" AutoGenerateColumns="False" DataSourceID="dsReceipts" KeyFieldName="ReceiptId" Width="100%" ClientInstanceName="masterGrid" OnLoad="ASPxgvReceipts_Load" OnCustomButtonInitialize="ASPxgvReceipts_CustomButtonInitialize" EnableRowsCache="False">

        <ClientSideEvents CustomButtonClick="OnCustomButtonClick" />

        <Columns>
            <dx:GridViewDataTextColumn FieldName="ReceiptId" ReadOnly="True" VisibleIndex="5" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Payment Reference" FieldName="Reference" ReadOnly="true" VisibleIndex="6">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Taxpayer" FieldName="ReceivedFrom" VisibleIndex="10" Width="200px" ReadOnly="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TIN" VisibleIndex="7" ReadOnly="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="PaymentDate" VisibleIndex="12" Width="100px" ReadOnly="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Amount" VisibleIndex="16" ReadOnly="True">
                <PropertiesTextEdit DisplayFormatString="#,##0.00">
                </PropertiesTextEdit>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowApplyFilterButton="True" ShowClearFilterButton="True" VisibleIndex="26" Width="100px">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btnCreditNotes" Text="Credit Notes">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataComboBoxColumn FieldName="PrintStatus" VisibleIndex="17" Width="100px">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="PRINTED" Value="PRINTED" />
                        <dx:ListEditItem Text="NOT PRINTED" Value="NOT PRINTED" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataCheckColumn Caption="Is Printed" FieldName="PrintStatus" VisibleIndex="25" Width="60px" Visible="False">
                <PropertiesCheckEdit DisplayTextChecked="Yes" DisplayTextUnchecked="No" ValueChecked="Printed" ValueType="System.String" ValueUnchecked="Not Printed">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="TaxType" ReadOnly="True" VisibleIndex="13">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="4">
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior AllowSelectByRowClick="True" FilterRowMode="OnClick" />
        <SettingsEditing Mode="Batch">
        </SettingsEditing>
        <Settings ShowFilterBar="Auto" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" ShowTitlePanel="True" />
        <SettingsLoadingPanel Mode="ShowAsPopup" />
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ExportMode="Expanded" ShowDetailRow="True" ShowDetailButtons="False" />
        <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
        <Templates>
            <TitlePanel>
                <div style="padding-bottom: 10px;">
                    <dx:ASPxRadioButtonList ID="AspxrblStatus"  runat="server" RepeatDirection="Horizontal" Caption="Set selected records:" SelectedIndex="1" EnableClientSideAPI="True" OnSelectedIndexChanged="AspxrblStatus_SelectedIndexChanged">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                         if(masterGrid.GetSelectedRowCount() == 0) alert('No grid row is selected.');                         
                             else 
                                {
                                    masterGrid.StartEditRow();
                                    //masterGrid.SetEditValue('PrintStatus','Printed');
                                }                                                    
                            }" />
                        <Items>
                            <dx:ListEditItem Text="Printed" Value="Printed" />
                            <dx:ListEditItem Selected="True" Text="Not Printed" Value="Not Printed" />
                        </Items>
                    </dx:ASPxRadioButtonList>
                </div>
            </TitlePanel>
        </Templates>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsReceipts" runat="server" ConnectionString="<%$ ConnectionStrings:TAAPsCon %>" SelectCommand="SELECT * FROM [RevenueCollectorReceipts] WHERE ([TaxOffice] = @TaxOffice)" UpdateCommand="UPDATE [RevenueCollectorReceipts] SET [Reference] = @Reference, [ReceivedFrom] = @ReceivedFrom, [Address] = @Address, [TIN] = @TIN, [TaxType] = @TaxType, [PaymentDate] = @PaymentDate, [Amount] = @Amount, [PeriodCoveredFrom] = @PeriodCoveredFrom, [PeriodCoveredTo] = @PeriodCoveredTo, [Bank] = @Bank, [BankBranch] = @BankBranch, [TaxOffice] = @TaxOffice, [PrintStatus] = @PrintStatus WHERE [ReceiptId] = @ReceiptId" DeleteCommand="DELETE FROM [RevenueCollectorReceipts] WHERE [ReceiptId] = @ReceiptId" InsertCommand="INSERT INTO [RevenueCollectorReceipts] ([ReceiptId], [Reference], [ReceivedFrom], [Address], [TIN], [TaxType], [PaymentDate], [Amount], [PeriodCoveredFrom], [PeriodCoveredTo], [Bank], [BankBranch], [TaxOffice], [PrintStatus]) VALUES (@ReceiptId, @Reference, @ReceivedFrom, @Address, @TIN, @TaxType, @PaymentDate, @Amount, @PeriodCoveredFrom, @PeriodCoveredTo, @Bank, @BankBranch, @TaxOffice, @PrintStatus)" OnSelecting="dsReceipts_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="ReceiptId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ReceiptId" Type="String" />
            <asp:Parameter Name="Reference" Type="String" />
            <asp:Parameter Name="ReceivedFrom" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="TIN" Type="String" />
            <asp:Parameter Name="TaxType" Type="String" />
            <asp:Parameter Name="PaymentDate" Type="DateTime" />
            <asp:Parameter Name="Amount" Type="Decimal" />
            <asp:Parameter Name="PeriodCoveredFrom" Type="String" />
            <asp:Parameter Name="PeriodCoveredTo" Type="String" />
            <asp:Parameter Name="Bank" Type="String" />
            <asp:Parameter Name="BankBranch" Type="String" />
            <asp:Parameter Name="TaxOffice" Type="String" />
            <asp:Parameter Name="PrintStatus" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="Apapa ITO" Name="TaxOffice" SessionField="TaxOffice" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Reference" Type="String" />
            <asp:Parameter Name="ReceivedFrom" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="TIN" Type="String" />
            <asp:Parameter Name="TaxType" Type="String" />
            <asp:Parameter Name="PaymentDate" Type="DateTime" />
            <asp:Parameter Name="Amount" Type="Decimal" />
            <asp:Parameter Name="PeriodCoveredFrom" Type="String" />
            <asp:Parameter Name="PeriodCoveredTo" Type="String" />
            <asp:Parameter Name="Bank" Type="String" />
            <asp:Parameter Name="BankBranch" Type="String" />
            <asp:Parameter Name="TaxOffice" Type="String" />
            <asp:Parameter Name="PrintStatus" Type="String" />
            <asp:Parameter Name="ReceiptId" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsCreditNotes" runat="server" ConnectionString="<%$ ConnectionStrings:TAAPsCon %>" SelectCommand="SELECT * FROM [WHTCreditNotes] WHERE ([ReceiptId] = @ReceiptId)" UpdateCommand="update [WHTCreditNotes] 
Set PrintStatus = @PrintStatus
WHERE ([CreditNoteId] = @CreditNoteId)">
        <SelectParameters>
            <asp:SessionParameter Name="ReceiptId" SessionField="ReceiptId" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="PrintStatus" />
            <asp:Parameter Name="CreditNoteId" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:EntityDataSource ID="edsTaxTypes" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxTypes" Select="it.[TaxTypeId], it.[TaxTypeName]">
    </asp:EntityDataSource>
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="popup" HeaderText="Credit Notes" Width="800px" Modal="True" PopupHorizontalAlign="Center" PopupVerticalAlign="Middle" ShowFooter="True" OnWindowCallback="ASPxPopupControl1_WindowCallback" AllowDragging="True" AppearAfter="200" ShowPageScrollbarWhenModal="True" ShowPinButton="True" FooterText="">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                <dx:ASPxGridView ID="ASPxgvCreditNotes" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxgvCreditNotes" DataSourceID="dsCreditNotes" KeyFieldName="CreditNoteId" Width="100%">
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="#,##0.00" FieldName="WHTAmt" ShowInColumn="WHT Amt" SummaryType="Sum" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="10" ShowApplyFilterButton="True">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="CreditNoteId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="BeneficiaryName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Beneficiary TIN" FieldName="BeneficiaryTaxNumber" ShowInCustomizationForm="True" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TransactionDescription" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="WHTAmt" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Width="150px">
                            <PropertiesTextEdit DisplayFormatString="#,##0.00">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ReceiptId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="PrintStatus" ShowInCustomizationForm="True" VisibleIndex="8" Width="110px">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="PRINTED" Value="PRINTED" />
                                    <dx:ListEditItem Text="NOT PRINTED" Value="NOT PRINTED" />
                                </Items>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                    </Columns>
                    <SettingsBehavior FilterRowMode="OnClick" />
                    <SettingsEditing Mode="Batch">
                        <BatchEditSettings EditMode="Row" />
                    </SettingsEditing>
                    <Settings ShowFilterRow="True" ShowTitlePanel="True" ShowFilterBar="Auto" ShowFilterRowMenu="True" ShowFooter="True" />
                    <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                </dx:ASPxGridView>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
