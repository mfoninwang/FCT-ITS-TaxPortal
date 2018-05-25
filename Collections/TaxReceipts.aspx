<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="TaxReceipts.aspx.cs" Inherits="TAAPs.Collections.TaxReceipts" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Tax Receipts
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Tax Receipt List
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="panelHeading" runat="server">
       <div class="btn-group">
        <a class="btn btn-primary" href="#">
            <i class="fa fa-plus"></i>
            Generate Receipt
        </a>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
    <script type="text/javascript">
    </script>

    <div></div>
    <dx:ASPxButton ID="ASPxbtnGenerate" runat="server" OnClick="ASPxbtnGenerate_Click" Text="Generate Receipts for Selected Payments" ClientInstanceName="btnGenerate">
        <ClientSideEvents Click="function(s, e) {
	LoadingPanel.Show();
}" Init="function(s, e) {
	s.SetEnabled(false);
}" />
    </dx:ASPxButton>
    <p>
        <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="LoadingPanel" Text="Please wait while receipts are generating&amp;hellip;">
        </dx:ASPxLoadingPanel>
    </p>
    <dx:ASPxGridView ID="ASPxgvPayments" ClientInstanceName="mastergrid" runat="server" AutoGenerateColumns="False" DataSourceID="sqldsPayments" KeyFieldName="sno" Width="100%" OnCustomUnboundColumnData="ASPxgvPayments_CustomUnboundColumnData">
        <ClientSideEvents SelectionChanged="function(s, e) {
	if (s.GetSelectedRowCount() == 0) 
	{
		btnGenerate.SetEnabled(false);
	}else{btnGenerate.SetEnabled(true);}
}

" />
        <Columns>
            <dx:GridViewCommandColumn ShowApplyFilterButton="True" ShowClearFilterButton="True" VisibleIndex="23" Width="70px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="SNo" VisibleIndex="1" Width="50px" FieldName="SNo" UnboundType="Integer">
                <Settings AllowAutoFilter="False" ShowInFilterControl="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Payment Reference" FieldName="payment_reference" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="TIN" FieldName="cust_number" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Taxpayer Name" FieldName="cust_name" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Amount" FieldName="payment_amount" VisibleIndex="12">
                <PropertiesTextEdit DisplayFormatString="#,##0.00">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width="30px" SelectAllCheckboxMode="AllPages">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataDateColumn Caption="Payment Date" FieldName="payment_log_date" VisibleIndex="2">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Tax Type" FieldName="Type" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Bank" FieldName="BankName" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Service Provider" FieldName="service_provider_code" VisibleIndex="21">
                <PropertiesComboBox DataSourceID="sqldsServiceProviders" TextField="Description" ValueField="Code">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Bank Branch" FieldName="bank_branch" VisibleIndex="20">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Address" FieldName="cust_address" Visible="False" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="From Assessment Month" FieldName="from_assess_month" Visible="False" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="To Assessment Month" FieldName="to_assess_month" Visible="False" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tax Office" FieldName="TaxOfficeName" Visible="False" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Schedule Reference" FieldName="schedule_reference" Visible="False" VisibleIndex="22">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowSelectByRowClick="True" ColumnResizeMode="Control" />
        <SettingsPager ShowSeparators="True">
        </SettingsPager>
        <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    </dx:ASPxGridView>


    <asp:SqlDataSource ID="sqldsPayments" runat="server" ConnectionString="<%$ ConnectionStrings:firs_portalCon %>" SelectCommand="usp_consolidated_payments_details" SelectCommandType="StoredProcedure" OnSelecting="sqldsPayments_Selecting">
        <SelectParameters>
            <asp:SessionParameter Name="TaxOffice" Type="String" SessionField="TaxOfficeId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqldsServiceProviders" runat="server" ConnectionString="<%$ ConnectionStrings:TAAPsCon %>" SelectCommand="SELECT * FROM [ServiceProviders]"></asp:SqlDataSource>

</asp:Content>
