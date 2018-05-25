<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="CTaxpayersList.aspx.cs" Inherits="TAAPs.Registration.CTaxpayersList" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Xpo.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Xpo" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        var windowId;
        var lastState = null;

        function OnCustomButtonClick(s, e) {

            if (e.buttonID == 'btnTransfer') {
                windowId = 0;
                mastergrid.GetRowValues(e.visibleIndex, 'TIN;CompanyName', OnGetRowValues);
            }
            else if (e.buttonID == 'btnBranches') {
                windowId = 1;
                mastergrid.GetRowValues(e.visibleIndex, 'TIN;CompanyName', OnGetRowValues);
            }
        }

        function OnGetRowValues(keyValue) {
            var tin = keyValue[0];
            var taxpayername = keyValue[1];

            if (windowId == 0) var headertext = 'Transfer Taxpayer - ' + taxpayername + ' - ' + tin;
            else if (windowId == 1) var headertext = 'Branches for - ' + taxpayername + ' - ' + tin;

            var window = popup.GetWindow(windowId);
            window.SetHeaderText(headertext);

            popup.ShowWindow(window);
            popup.PerformWindowCallback(window, tin); // This is used only when there's are multiple window in the popoup control
        }

        function HidePopUp(index) {
            popup.HideWindow(popup.GetWindow(index));
        }

        function OnStateChanged(state) {
            if (lga.InCallback())
                lastState = state.GetValue().toString();
            else lga.PerformCallback(state.GetValue().toString());
        }

        function OnEndLGACallback(s, e) {
            if (lastState) {
                lga.PerformCallback(lastState);
                lastState = null;
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Corporate Taxpayer
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Corporate Taxpayers
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="panelHeading" runat="server">
    <div class="btn-group">
        <a class="btn btn-primary" href="#">
            <i class="fa fa-list"></i>
            Corporate Taxpayer List
        </a>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
        <dx:ASPxGridView ID="TaxpayerGridview" runat="server" AutoGenerateColumns="False" KeyFieldName="TIN" Width="100%" ClientInstanceName="mastergrid" DataSourceID="TaxpayersEntityServerModeDataSource">
            <ClientSideEvents
                CustomButtonClick="OnCustomButtonClick" />

            <SettingsExport EnableClientSideExportAPI="True">
            </SettingsExport>

<EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
            <Columns>
                <dx1:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="6">
                </dx1:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="TIN" ReadOnly="True" VisibleIndex="0" Width="100px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CacNumber" VisibleIndex="1" Caption="CAC Number">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx1:GridViewDataTextColumn Caption="Business Line" FieldName="BusinessLine.BusinessLineName" VisibleIndex="4">
                </dx1:GridViewDataTextColumn>
                <dx1:GridViewDataDateColumn FieldName="CreateDate" VisibleIndex="5">
                </dx1:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="BNNumber" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" EnableCustomizationWindow="True" />
            <SettingsEditing Mode="EditForm">
                <BatchEditSettings StartEditAction="DblClick" />
            </SettingsEditing>
            <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
            <SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="Middle" />
            </SettingsPopup>
            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" AllowEdit="False" />

<SettingsAdaptivity>
<AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
</SettingsAdaptivity>

            <Templates>
                <EditForm>

                    <div style="text-align: right; padding: 10px 10px 10px 10px;">
                    </div>

                </EditForm>
            </Templates>
            <Toolbars>
                <dx1:GridViewToolbar ItemAlign="Right">
                    <Items>
                        <dx1:GridViewToolbarItem Command="Refresh" Text="Refresh">
                        </dx1:GridViewToolbarItem>
                        <dx1:GridViewToolbarItem BeginGroup="True" Text="Export">
                            <Items>
                                <dx1:GridViewToolbarItem Command="ExportToPdf" Text="PDF">
                                </dx1:GridViewToolbarItem>
                                <dx1:GridViewToolbarItem Command="ExportToXlsx" Text="Xlsx">
                                </dx1:GridViewToolbarItem>
                            </Items>
                        </dx1:GridViewToolbarItem>
                    </Items>
                </dx1:GridViewToolbar>
            </Toolbars>
        </dx:ASPxGridView>

        <dx:EntityServerModeDataSource ID="TaxpayersEntityServerModeDataSource" runat="server" ContextTypeName="TAAPs.Model.TAAPsDBContext" OnSelecting="TaxpayersEntityServerModeDataSource_Selecting" TableName="CTaxpayers" />

</asp:Content>
