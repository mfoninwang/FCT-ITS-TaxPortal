<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="UserTransferList.aspx.cs" Inherits="TAAPs.Administration.UserTransferList" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function OnGetSelectedFieldValues(selectedValues) {
            currentTaxOffice.value = selectedValues[0]
        }

        function OnCustomButtonClick(s, e) {
            if (e.buttonID == 'btnTransferHistory')
                mastergrid.GetRowValues(e.visibleIndex, 'UserName;LastName;FirstName', OnTransferClick);
        }

        function OnTransferClick(keyValue) {
            var username = keyValue[0];
            var name = keyValue[1] + ' ' + keyValue[2];
            var headertext = 'Transfer User - ' + name + ' - ' + username;
            var transferpopup = popup.GetWindow(0);

            transferpopup.SetHeaderText(headertext);
            popup.ShowWindow(transferpopup);
            popup.PerformWindowCallback(transferpopup, username);  // This is used only when there's are multiple window in the popoup control

            //transferpopup.PerformCallback(username); // This is used only when there's a single window in the popoup control
        }

        function HidePopUp(index) {
            popup.HideWindow(popup.GetWindow(index));
        }

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Administration
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    User Transfers
</asp:Content>



<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">

    <dx:ASPxGridView ID="ASPxgvUsers" runat="server" AutoGenerateColumns="False" DataSourceID="edsUsers" KeyFieldName="UserName" Width="100%" ClientInstanceName="mastergrid" OnCustomCallback="ASPxgvUsers_CustomCallback">
        <ClientSideEvents CustomButtonClick="OnCustomButtonClick" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="UserName" ReadOnly="True" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Role" FieldName="Role.RoleName" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn VisibleIndex="10" Width="100px">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btnTransferHistory" Text="Transfer History">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataComboBoxColumn Caption="Current Tax Office" FieldName="TaxOfficeId" VisibleIndex="9">
                <PropertiesComboBox DataSourceID="edsTaxOffices" TextField="TaxOfficeName" ValueField="TaxOfficeId">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRow="True" ShowFilterBar="Auto" ShowPreview="True" />
        <SettingsText CommandNew="Add New Transfer" />
        <SettingsLoadingPanel Mode="ShowAsPopup" />
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" Modal="True" VerticalAlign="Middle" />
            <CustomizationWindow HorizontalAlign="Center" VerticalAlign="WindowCenter" />
        </SettingsPopup>
        <SettingsCommandButton>
            <NewButton Text="New Transfer">
            </NewButton>
        </SettingsCommandButton>
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" />
    </dx:ASPxGridView>


    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="popup" Width="100%" HeaderText="" Modal="True" OnWindowCallback="ASPxPopupControl1_WindowCallback" PopupHorizontalAlign="WindowCenter" ShowPinButton="True" AllowDragging="True" AllowResize="True" EnableClientSideAPI="True">
        <Windows>
            <dx:PopupWindow Modal="True" Name="transferpopup" Width="900px">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxGridView ID="ASPxgvTransfers" runat="server" AutoGenerateColumns="False" DataSourceID="edsTransfers" KeyFieldName="TransferId" PreviewFieldName="Reason" Width="100%" OnInitNewRow="ASPxgvTransfers_InitNewRow" OnCustomErrorText="ASPxgvTransfers_CustomErrorText" OnCancelRowEditing="ASPxgvTransfers_CancelRowEditing" OnRowInserted="ASPxgvTransfers_RowInserted">
                            <ClientSideEvents EndCallback="function(s, e) {
	if (s.cpIsInserted == true || s.cpIsCancelled == true) HidePopUp(0);
}" />

<EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="TransferId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="CreatedBy" ShowInCustomizationForm="True" VisibleIndex="8">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="CreateDate" ShowInCustomizationForm="True" VisibleIndex="9">
                                    <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                                    </PropertiesDateEdit>
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataMemoColumn FieldName="Reason" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                    <PropertiesMemoEdit>
                                        <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                            <RequiredField IsRequired="True" ErrorText="Required" />
                                        </ValidationSettings>
                                    </PropertiesMemoEdit>
                                    <EditFormSettings CaptionLocation="Top" ColumnSpan="2" Visible="True" />
                                </dx:GridViewDataMemoColumn>
                                <dx:GridViewDataComboBoxColumn Caption="From Tax Office" FieldName="FromTaxOfficeId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <PropertiesComboBox DataSourceID="edsTaxOffices" TextField="TaxOfficeName" ValueField="TaxOfficeId" EnableFocusedStyle="False" DropDownRows="1" DropDownStyle="DropDown">
                                        <DropDownButton Visible="False">
                                        </DropDownButton>
                                        <ReadOnlyStyle BackColor="#CCCCCC">
                                        </ReadOnlyStyle>
                                    </PropertiesComboBox>
                                    <EditFormSettings Caption="Current Tax Office" CaptionLocation="Top" />
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="To Tax Office" FieldName="ToTaxOfficeId" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <PropertiesComboBox DataSourceID="edsTaxOffices" TextField="TaxOfficeName" ValueField="TaxOfficeId" EnableFocusedStyle="False" IncrementalFilteringMode="Contains">
                                        <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                            <RequiredField IsRequired="True" ErrorText="Required" />
                                        </ValidationSettings>
                                    </PropertiesComboBox>
                                    <EditFormSettings CaptionLocation="Top" />
                                </dx:GridViewDataComboBoxColumn>
                            </Columns>
                            <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />

<SettingsAdaptivity>
<AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
</SettingsAdaptivity>

                            <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterBar="Auto" ShowPreview="True" ShowTitlePanel="True" />
                            <SettingsText CommandNew="New Transfer" EmptyDataRow="No Transfers" />
                            <SettingsLoadingPanel Mode="ShowAsPopup" />
                            <SettingsPopup>
                                <EditForm HorizontalAlign="Center" Modal="True" VerticalAlign="Middle" />
                                <CustomizationWindow HorizontalAlign="Center" VerticalAlign="WindowCenter" />
                            </SettingsPopup>
                            <SettingsCommandButton>
                                <NewButton Text="New Transfer">
                                </NewButton>
                                <UpdateButton Text="Transfer">
                                </UpdateButton>
                            </SettingsCommandButton>
                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" />
                            <Templates>
                            </Templates>
                            <Toolbars>
                                <dx:GridViewToolbar ItemAlign="Right">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="New" Text="Add New Transfer">
                                        </dx:GridViewToolbarItem>
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>
                        </dx:ASPxGridView>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:PopupWindow>
        </Windows>
        <ClientSideEvents EndCallback="function(s, e) {
	//mastergrid.PerformCallback();
}"
            CloseUp="function(s, e) {
	mastergrid.Refresh();
}" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <asp:EntityDataSource ID="edsUsers" runat="server" ConnectionString="name=TAAPsDBContext"
        DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True"
        EntitySetName="Users" Where="it.TaxOfficeId is not null" Include="Role" EntityTypeFilter="" Select="">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsTaxOffices" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxOffices" Select="it.[TaxOfficeId], it.[TaxOfficeName]">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsTransfers" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EntitySetName="UserTransfers" Where="it.UserName = @UserName">
        <WhereParameters>
            <asp:SessionParameter Name="UserName" SessionField="TransferUser" Type="String" />
        </WhereParameters>

        <InsertParameters>
            <asp:SessionParameter Name="UserName" SessionField="TransferUser" Type="String" />
            <asp:Parameter Name="FromTaxOfficeId" Type="String" />
            <asp:Parameter Name="ToTaxOfficeId" Type="String" />
            <asp:Parameter Name="Reason" Type="String" />
            <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
        </InsertParameters>
    </asp:EntityDataSource>
</asp:Content>
