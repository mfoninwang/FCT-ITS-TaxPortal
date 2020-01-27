<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="TaxTypeList.aspx.cs" Inherits="TAAPs.Administration.TaxTypeList" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Administration
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Tax Types
</asp:Content>



<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
        <dx:ASPxGridView ID="TaxTypeGridView" runat="server" AutoGenerateColumns="False" DataSourceID="TaxTypeEntityDataSource" KeyFieldName="TaxTypeId" Width="100%" OnHtmlDataCellPrepared="TaxTypeGridView_HtmlDataCellPrepared" OnCustomErrorText="TaxTypeGridView_CustomErrorText" ClientInstanceName="grid">
            <SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" Modal="True" ShowMaximizeButton="True" ShowShadow="True">
                </EditForm>
            </SettingsPopup>
            <SettingsText PopupEditFormCaption="Edit Tax Type" />
            <EditFormLayoutProperties ColCount="2">
                <SettingsItemCaptions Location="Top" />
            </EditFormLayoutProperties>
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="12">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="TaxTypeName" VisibleIndex="1">
                    <PropertiesTextEdit>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FillingDueDate" VisibleIndex="2">
                    <PropertiesDateEdit>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="LateFilingFlatFee" VisibleIndex="4" Visible="False">
                    <PropertiesTextEdit DisplayFormatString="#,##0.00">
                        <ValidationSettings ErrorDisplayMode="Text" SetFocusOnError="True" ValidateOnLeave="False">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LateFilingRecurringFee" VisibleIndex="5" Visible="False">
                    <PropertiesTextEdit DisplayFormatString="#,##0.00">
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PaymentDueDays" VisibleIndex="7" Visible="False">
                    <PropertiesTextEdit>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LatePaymentRate" VisibleIndex="8" Visible="False">
                    <PropertiesTextEdit>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CreatedBy" ReadOnly="True" VisibleIndex="10" Visible="False">
                    <PropertiesTextEdit>
                        <ValidationSettings ErrorDisplayMode="None">
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="CreateDate" ReadOnly="True" VisibleIndex="11" Visible="False">
                    <PropertiesDateEdit>
                        <ValidationSettings ErrorDisplayMode="None">
                        </ValidationSettings>
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn FieldName="FillingFrequency" VisibleIndex="3">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="ANNUALLY" Value="ANNUALLY" />
                        </Items>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="LateFilingRecurringFeeFreq" VisibleIndex="6" Visible="False">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="MONTHLY" Value="MONTHLY" />
                        </Items>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="InterestRate" VisibleIndex="9" Visible="False">
                    <PropertiesTextEdit>
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TaxTypeId" ReadOnly="True" VisibleIndex="0">
                    <PropertiesTextEdit DisplayFormatString="{0}">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
<SettingsAdaptivity>
<AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
</SettingsAdaptivity>

            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowGroupButtons="False" />
            <SettingsDataSecurity AllowDelete="False" />
            <Toolbars>
                <dx:GridViewToolbar ItemAlign="Right">
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Text="Add New Tax Type">
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
        </dx:ASPxGridView>
        <asp:EntityDataSource ID="TaxTypeEntityDataSource" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="TaxTypes" EntityTypeFilter="TaxType" Include="User">

            <InsertParameters>
                <asp:SessionParameter Name="CreatedBy" Type="String" SessionField="UserName" />
            </InsertParameters>

        </asp:EntityDataSource>
&nbsp;
</asp:Content>
