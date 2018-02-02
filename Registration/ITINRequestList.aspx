<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ITINRequestList.aspx.cs" Inherits="TAAPs.Registration.ITINRequestList" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>







<%@ Register Assembly="DevExpress.XtraReports.v15.2.Web, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <script type="text/javascript">

    </script>
    <div style="height: 90%; width: 100%">
                                        <dx:ASPxGridView runat="server" ClientInstanceName="mastergrid" KeyFieldName="RequestId" AutoGenerateColumns="False" DataSourceID="edsTINRequestList" ID="ASPxGridView1">
                                            <ClientSideEvents CustomButtonClick="function(s, e) {
	 s.StartEditRow(e.visibleIndex);
}" />
                                            <Templates>
                                                <EditForm>
                                                    <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement1" runat="server" ReplacementType="EditFormEditors" />
                                                    <div style="padding: 20px; text-align: right; border-top-style: inset; border-top-width: 2px; border-top-color: #C0C0C0;">
                                                        <dx:ASPxButton ID="btnApprove" runat="server" OnClick="btnApprove_Click" Text="Approve">
                                                        </dx:ASPxButton>
                                                        <dx:ASPxButton ID="btnReject" runat="server" OnClick="btnReject_Click" Text="Reject">
                                                        </dx:ASPxButton>
                                                    </div>
                                                </EditForm>
                                            </Templates>
                                            <SettingsEditing Mode="PopupEditForm">
                                            </SettingsEditing>

<Settings ShowFilterRow="True"></Settings>

<SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>

<SettingsDataSecurity AllowInsert="False" AllowDelete="False"></SettingsDataSecurity>
                                            <SettingsText CommandCancel="Reject" CommandEdit="View" CommandUpdate="Register" PopupEditFormCaption="Individual TIN Request Approval" />
                                            <EditFormLayoutProperties>
                                                <Items>
                                                    <dx:GridViewLayoutGroup Caption="Request Info" ColCount="3">
                                                        <Items>
                                                            <dx:GridViewColumnLayoutItem ColumnName="RequestId">
                                                            </dx:GridViewColumnLayoutItem>
                                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="TaxOffice.TaxOfficeName">
                                                            </dx:GridViewColumnLayoutItem>
                                                            <dx:GridViewColumnLayoutItem ColSpan="3" ColumnName="TaxpayerName">
                                                            </dx:GridViewColumnLayoutItem>
                                                            <dx:GridViewColumnLayoutItem ColSpan="3" ColumnName="Business Line">
                                                            </dx:GridViewColumnLayoutItem>
                                                        </Items>
                                                    </dx:GridViewLayoutGroup>
                                                    <dx:GridViewLayoutGroup Caption="Contact Information" ColCount="2">
                                                        <Items>
                                                            <dx:GridViewColumnLayoutItem ColumnName="Phone1">
                                                            </dx:GridViewColumnLayoutItem>
                                                            <dx:GridViewColumnLayoutItem Caption="Phone 2" ColumnName="Phone2">
                                                            </dx:GridViewColumnLayoutItem>
                                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="Email">
                                                            </dx:GridViewColumnLayoutItem>
                                                        </Items>
                                                    </dx:GridViewLayoutGroup>
                                                    <dx:GridViewLayoutGroup Caption="Address" ColCount="3">
                                                        <Items>
                                                            <dx:GridViewColumnLayoutItem ColumnName="Street No">
                                                            </dx:GridViewColumnLayoutItem>
                                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="City">
                                                            </dx:GridViewColumnLayoutItem>
                                                            <dx:GridViewColumnLayoutItem ColSpan="3" ColumnName="Street">
                                                            </dx:GridViewColumnLayoutItem>
                                                            <dx:GridViewColumnLayoutItem ColumnName="State.StateName">
                                                            </dx:GridViewColumnLayoutItem>
                                                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="Business Lga">
                                                            </dx:GridViewColumnLayoutItem>
                                                        </Items>
                                                    </dx:GridViewLayoutGroup>
                                                </Items>
                                                <SettingsItemCaptions Location="Top" />
                                            </EditFormLayoutProperties>
<Columns>
<dx:GridViewCommandColumn ShowClearFilterButton="True" Width="100px" VisibleIndex="39" ShowUpdateButton="True">
    <CustomButtons>
        <dx:GridViewCommandColumnCustomButton ID="View" Text="View Details">
        </dx:GridViewCommandColumnCustomButton>
    </CustomButtons>
    </dx:GridViewCommandColumn>
<dx:GridViewDataTextColumn FieldName="RequestId" ReadOnly="True" Width="80px" VisibleIndex="0"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="TaxpayerName" VisibleIndex="1" ReadOnly="True"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="StreetNo" Visible="False" VisibleIndex="26" ReadOnly="True">
    <EditFormSettings Visible="True" />
    </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Street" Visible="False" VisibleIndex="27" ReadOnly="True">
    <EditFormSettings Visible="True" />
    </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="City" Visible="False" VisibleIndex="28" ReadOnly="True">
    <EditFormSettings Visible="True" />
    </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Phone1" Visible="False" VisibleIndex="29" ReadOnly="True">
    <EditFormSettings Visible="True" />
    </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Email" Visible="False" VisibleIndex="33" ReadOnly="True">
    <EditFormSettings Visible="True" />
    </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="LGA.LGAName" Caption="Business Lga" Visible="False" VisibleIndex="38" ReadOnly="True">
    <EditFormSettings Visible="True" />
    </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="State.StateName" Caption="State" VisibleIndex="36" ReadOnly="True"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="TaxOffice.TaxOfficeName" Caption="Tax Office" Visible="False" VisibleIndex="8" ReadOnly="True">
    <EditFormSettings Visible="True" />
    </dx:GridViewDataTextColumn>
<dx:GridViewDataDateColumn FieldName="CreateDate" Caption="Create Date" VisibleIndex="37" ReadOnly="True"></dx:GridViewDataDateColumn>
    <dx:GridViewDataTextColumn FieldName="Phone2" ReadOnly="True" VisibleIndex="32">
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="Business Line" FieldName="BusinessLine.BusinessLineName" ReadOnly="True" VisibleIndex="7">
    </dx:GridViewDataTextColumn>
</Columns>
</dx:ASPxGridView>


    </div>
    <asp:EntityDataSource ID="edsTINRequestList" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="ITINRequests" Include="BusinessLine,TaxOffice,LGA,State" Where="it.TaxOfficeId == @TaxOfficeId">
        <WhereParameters>
            <asp:SessionParameter Name="TaxOfficeId" SessionField="TaxOfficeId" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>

    </asp:Content>
