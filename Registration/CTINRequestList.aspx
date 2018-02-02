<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CTINRequestList.aspx.cs" Inherits="TAAPs.Registration.CTINRequestList" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v15.2.Web, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <div>
        <dx:ASPxGridView runat="server" ClientInstanceName="mastergrid" KeyFieldName="RequestId" AutoGenerateColumns="False" DataSourceID="edsTINRequestList" ID="ASPxGridView1">
            <ClientSideEvents SelectionChanged="function(s, e) {
}"
                CustomButtonClick="function(s, e) {
	 s.StartEditRow(e.visibleIndex);
}"></ClientSideEvents>

            <Templates>
                <EditForm>
                    <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement1" runat="server" ReplacementType="EditFormContent" />
                    <div style="padding: 20px; text-align: right; border-top-style: inset; border-top-width: 2px; border-top-color: #C0C0C0;">
                        <dx:ASPxButton ID="btnApprove" runat="server" OnClick="btnApprove_Click" Text="Approve">
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="btnReject" runat="server" OnClick="btnReject_Click" Text="Reject">
                        </dx:ASPxButton>
                    </div>
                </EditForm>
            </Templates>

            <SettingsEditing Mode="PopupEditForm"></SettingsEditing>

            <Settings ShowFilterRow="True"></Settings>

            <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>

            <SettingsDataSecurity AllowInsert="False" AllowDelete="False"></SettingsDataSecurity>
            <SettingsText PopupEditFormCaption="Corporate TIN Request" />
            <EditFormLayoutProperties ColCount="2">
                <Items>
                    <dx:GridViewLayoutGroup Caption="Company Info" ColCount="4" ColSpan="2">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColumnName="RequestId">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="3" ColumnName="CompanyName">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="RCNo">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="CompanyType">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="BusinessLineId">
                            </dx:GridViewColumnLayoutItem>
                        </Items>
                    </dx:GridViewLayoutGroup>
                    <dx:GridViewLayoutGroup Caption="Financial Info" ColCount="4" ColSpan="2">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColumnName="DateOfIncorporation">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="DateOfCommencement">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="FinancialYearBegin">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="FinancialYearEnd">
                            </dx:GridViewColumnLayoutItem>
                        </Items>
                    </dx:GridViewLayoutGroup>
                    <dx:GridViewLayoutGroup Caption="Address" ColCount="2">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColumnName="BusinessStreetNo">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="BusinessCity">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="BusinessStreet">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="State.StateName">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="LGA.LGAName">
                            </dx:GridViewColumnLayoutItem>
                        </Items>
                    </dx:GridViewLayoutGroup>
                    <dx:GridViewLayoutGroup Caption="Contact Information" ColCount="2">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="Phone1">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="Phone2">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="Phone3">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="Email">
                            </dx:GridViewColumnLayoutItem>
                        </Items>
                    </dx:GridViewLayoutGroup>
                </Items>
                <SettingsItemCaptions Location="Top" />
            </EditFormLayoutProperties>
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowInCustomizationForm="True" VisibleIndex="38" Width="100px">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="View" Text="View Details">
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="RequestId" ReadOnly="True" ShowInCustomizationForm="True" Width="80px" VisibleIndex="1"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RCNo" ShowInCustomizationForm="True" Width="80px" VisibleIndex="2" ReadOnly="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CompanyName" ShowInCustomizationForm="True" VisibleIndex="3" ReadOnly="True" Width="50%"></dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DateOfIncorporation" ShowInCustomizationForm="True" VisibleIndex="10" ReadOnly="True" Width="150px">
                    <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy"></PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="CompanyType" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4" ReadOnly="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="CreateDate" ShowInCustomizationForm="True" VisibleIndex="21" ReadOnly="True" Width="150px">
                    <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy hh:mm tt"></PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="DateOfCommencement" ShowInCustomizationForm="True" Visible="False" VisibleIndex="24" ReadOnly="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="FinancialYearBegin" ShowInCustomizationForm="True" Visible="False" VisibleIndex="25" ReadOnly="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FinancialYearEnd" ShowInCustomizationForm="True" Visible="False" VisibleIndex="26" ReadOnly="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BusinessStreetNo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="27" ReadOnly="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BusinessStreet" ShowInCustomizationForm="True" Visible="False" VisibleIndex="28" ReadOnly="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BusinessCity" ShowInCustomizationForm="True" Visible="False" VisibleIndex="29" ReadOnly="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Phone1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="30" ReadOnly="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Phone2" ShowInCustomizationForm="True" Visible="False" VisibleIndex="31" ReadOnly="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Phone3" ShowInCustomizationForm="True" Visible="False" VisibleIndex="32" ReadOnly="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Email" ShowInCustomizationForm="True" Visible="False" VisibleIndex="33" ReadOnly="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LGA.LGAName" ShowInCustomizationForm="True" Caption="Business Lga" Visible="False" VisibleIndex="37" ReadOnly="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="BusinessLineId" ShowInCustomizationForm="True" Caption="Business Line" VisibleIndex="6" ReadOnly="True">
                    <PropertiesComboBox DataSourceID="edsBusinessLines" TextField="BusinessLineName" ValueField="BusinessLineId"></PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="State.StateName" ShowInCustomizationForm="True" Caption="Business State" Visible="False" VisibleIndex="36" ReadOnly="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TaxOffice.TaxOfficeName" ShowInCustomizationForm="True" Caption="Tax Office" Visible="False" VisibleIndex="9" ReadOnly="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>


    </div>
    <asp:EntityDataSource ID="edsBusinessLines" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="BusinessLines" OrderBy="it.BusinessLineName" Select="it.[BusinessLineId], it.[BusinessLineName]">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="edsTINRequestList" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="CTINRequests" Include="BusinessLine,TaxOffice,LGA,State" Where="it.TaxOfficeId == @TaxOfficeId">
        <WhereParameters>
            <asp:SessionParameter Name="TaxOfficeId" SessionField="TaxOfficeId" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>


</asp:Content>
