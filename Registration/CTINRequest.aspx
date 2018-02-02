<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CTINRequest.aspx.cs" Inherits="TAAPs.Registration.CTINRequest" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>






<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <script type="text/javascript">

        var lastState = null;
        function OnStateChanged(state)
        {
            comboTaxOffice.ClearItems();
            gridTaxOffices.Refresh();

            if (lga.InCallback())
                lastState = state.GetValue().toString();
            else lga.PerformCallback(state.GetValue().toString());
        }

        function OnEndCallback(s, e) {
            if (lastState) {
                lga.PerformCallback(lastState);
                lastState = null;
            }
        }

        function SelectAndClosePopup(value) {
            textRCNo.SetValue(value[0]);
            textCompanyName.SetValue(value[1]);
            IncorporationDate.SetValue(value[2]);

            HidePopUp(0);
        }

        function HidePopUp(index) {
            popup.HideWindow(popup.GetWindow(index));
        }

        function OnGetTaxOffice(Value) {
            comboTaxOffice.SetValue(Value[0]);
            comboTaxOffice.SetText(Value[1])

            HidePopUp(1);
        }

    </script>

    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%" ClientInstanceName="formlayout" ColCount="2" DataSourceID="edsTINRequest" OnDataBound="ASPxFormLayout1_DataBound">
        <Items>
            <dx:LayoutGroup ColCount="4" ColSpan="2" ShowCaption="False">
                <Items>
                    <dx:LayoutItem FieldName="CompanyType" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxComboBox ID="aspxCompanyType" runat="server" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="aspxCompanyType_SelectedIndexChanged" SelectedIndex="0">
                                    <Items>
                                        <dx:ListEditItem Selected="True" Text="Corporate" Value="Corporate" />
                                        <dx:ListEditItem Text="MDA" Value="MDA" />
                                        <dx:ListEditItem Text="NGO" Value="NGO" />
                                    </Items>

<ClearButton Visibility="Auto"></ClearButton>

                                    <ValidationSettings ValidateOnLeave="False" Display="Dynamic" SetFocusOnError="True">
                                        <RequiredField IsRequired="True" ErrorText="Required" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="RCNo" ColSpan="2" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxButtonEdit ID="aspxButtonEditRCNo" runat="server" ClientInstanceName="textRCNo" Width="100%">
                                    <ClientSideEvents ButtonClick="function(s, e) {
	popup.show;
}" />
                                    <Buttons>
                                        <dx:EditButton>
                                        </dx:EditButton>
                                    </Buttons>

<ClearButton Visibility="Auto"></ClearButton>
                                </dx:ASPxButtonEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Company Information" ColCount="4" ColSpan="2">
                <Items>
                    <dx:LayoutItem FieldName="DateOfIncorporation">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxDateEdit ID="aspxdtDoI" runat="server" ClientInstanceName="IncorporationDate" Width="100%">
<TimeSectionProperties>
<TimeEditProperties>
<ClearButton Visibility="Auto"></ClearButton>
</TimeEditProperties>
</TimeSectionProperties>

<ClearButton Visibility="Auto"></ClearButton>

                                    <ValidationSettings ValidateOnLeave="False">
                                        <RequiredField ErrorText="Required" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="DateOfCommencement">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxDateEdit ID="ASPxdeDoC" runat="server" Width="100%">
<TimeSectionProperties>
<TimeEditProperties>
<ClearButton Visibility="Auto"></ClearButton>
</TimeEditProperties>
</TimeSectionProperties>

<ClearButton Visibility="Auto"></ClearButton>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="FinancialYearBegin">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxComboBox ID="ASPxComboBoxFinYearBegin" runat="server" SelectedIndex="0" Width="100%">
                                    <Items>
                                        <dx:ListEditItem Selected="True" Text="Jan" Value="Jan" />
                                        <dx:ListEditItem Text="Feb" Value="Feb" />
                                        <dx:ListEditItem Text="Mar" Value="Mar" />
                                        <dx:ListEditItem Text="Apr" Value="Apr" />
                                        <dx:ListEditItem Text="May" Value="May" />
                                        <dx:ListEditItem Text="Jun" Value="Jun" />
                                        <dx:ListEditItem Text="Jul" Value="Jul" />
                                        <dx:ListEditItem Text="Aug" Value="Aug" />
                                        <dx:ListEditItem Text="Sep" Value="Sep" />
                                        <dx:ListEditItem Text="Oct" Value="Oct" />
                                        <dx:ListEditItem Text="Nov" Value="Nov" />
                                        <dx:ListEditItem Text="Dec" Value="Dec" />
                                    </Items>

<ClearButton Visibility="Auto"></ClearButton>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="FinancialYearEnd">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxComboBox ID="ASPxComboBoxFinYearEnd" runat="server" SelectedIndex="11" Width="100%">
                                    <Items>
                                        <dx:ListEditItem Text="Jan" Value="Jan" />
                                        <dx:ListEditItem Text="Feb" Value="Feb" />
                                        <dx:ListEditItem Text="Mar" Value="Mar" />
                                        <dx:ListEditItem Text="Apr" Value="Apr" />
                                        <dx:ListEditItem Text="May" Value="May" />
                                        <dx:ListEditItem Text="Jun" Value="Jun" />
                                        <dx:ListEditItem Text="Jul" Value="Jul" />
                                        <dx:ListEditItem Text="Aug" Value="Aug" />
                                        <dx:ListEditItem Text="Sep" Value="Sep" />
                                        <dx:ListEditItem Text="Oct" Value="Oct" />
                                        <dx:ListEditItem Text="Nov" Value="Nov" />
                                        <dx:ListEditItem Selected="True" Text="Dec" Value="Dec" />
                                    </Items>

<ClearButton Visibility="Auto"></ClearButton>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="CompanyName" ColSpan="3" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxTextBox ID="aspxtxtCompanyName" runat="server" ClientInstanceName="textCompanyName" ReadOnly="True" Width="100%" EnableClientSideAPI="True">
                                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Business Line" FieldName="BusinessLineId" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="edsBusinessLines" IncrementalFilteringMode="Contains" TextField="BusinessLineName" ValueField="BusinessLineId" Width="100%">
<ClearButton Visibility="Auto"></ClearButton>

                                    <ValidationSettings>
                                        <RequiredField ErrorText="Required" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup ColCount="2" Caption="Address" Width="50%">
                <Items>
                    <dx:LayoutItem FieldName="BusinessStreetNo" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E11" runat="server" Width="100%">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="BusinessCity">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E13" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="BusinessStreet" ColSpan="2" RequiredMarkDisplayMode="Required" Caption="Street">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="100%" EnableFocusedStyle="False">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Business State" FieldName="BusinessStateId" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxComboBox ID="ASPxComboBoxState" runat="server" AutoPostBack="True" AutoResizeWithContainer="True" ClientInstanceName="state" DataSourceID="edsStates" EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith" TextField="StateName" ValueField="StateId" Width="100%">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	OnStateChanged(s);
}" />

<ClearButton Visibility="Auto"></ClearButton>

                                    <ValidationSettings>
                                        <RequiredField ErrorText="Required" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Lga" FieldName="BusinessLgaId">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxComboBox ID="ASPxComboBoxLga" runat="server" ClientInstanceName="lga" DataSourceID="edsLgas" IncrementalFilteringMode="Contains" OnCallback="ASPxComboBoxLga_Callback" TextField="LGAName" ValueField="LGAId" Width="100%">
                                    <ClientSideEvents EndCallback="function(s, e) {
	OnEndCallback
}" />

<ClearButton Visibility="Auto"></ClearButton>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Contact Information" ColCount="2" Width="50%">
                <Items>
                    <dx:LayoutItem FieldName="Phone1" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E15" runat="server" Width="100%">
                                    <MaskSettings Mask="0000-000-0000" />
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Phone2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E16" runat="server" Width="100%">
                                    <MaskSettings Mask="0000-000-0000" />
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem ColSpan="2" FieldName="Email" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxTextBox ID="ASPxFormLayout1_E18" runat="server" Width="100%">
                                    <ValidationSettings>
                                        <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tax Office" ColSpan="2" FieldName="TaxOfficeId" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxComboBox ID="ASPxComboBoxTaxOffices" runat="server" ClientInstanceName="comboTaxOffice" Width="100%">
<ClearButton Visibility="Auto"></ClearButton>

                                    <ValidationSettings>
                                        <RequiredField ErrorText="Required" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup ColSpan="2" HorizontalAlign="Right" ShowCaption="False" GroupBoxDecoration="HeadingLine" Width="100%">
                <Items>
                    <dx:LayoutItem ShowCaption="False" HorizontalAlign="Right">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxButton ID="ASPxButtonSubmit" runat="server" Text="Submit TIN Request" CommandName="New" OnClick="ASPxButtonSubmit_Click" ClientInstanceName="submit" HorizontalAlign="Center" AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {
	ASPxClientEdit.ValidateEditorsInContainer(formlayout);
}" />
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
        <SettingsItemCaptions Location="Top" />
    </dx:ASPxFormLayout>

    <asp:EntityDataSource ID="edsTINRequest" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EntitySetName="CTINRequests" EntityTypeFilter="" Select="" Where="">

    </asp:EntityDataSource>

    <asp:EntityDataSource ID="edsStates" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="States" Select="it.[StateId], it.[StateName]">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsLgas" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="LGAs" Select="it.[LGAId], it.[LGAName], it.[StateId]" Where="it.StateId = @StateId">
        <WhereParameters>
            <asp:Parameter Name="StateId" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsBusinessLines" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="BusinessLines" OrderBy="it.BusinessLineName" Select="it.[BusinessLineId], it.[BusinessLineName]">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsTaxOffices" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxOffices" Include="LGA,LGA.State" Where="it.LGA.StateId = @StateId">
        <WhereParameters>
            <asp:ControlParameter ControlID="ASPxFormLayout1$ASPxComboBoxState" Name="StateId" PropertyName="Value" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="popup" Height="400px" Width="800px" AllowDragging="True" CloseAction="CloseButton" HeaderText="" Modal="True" PopupVerticalAlign="WindowCenter" ContentUrl="~/Registration/RegisteredCompanyList.aspx" PopupElementID="ASPxFormLayout1$ASPxButtonEditRCNo">
        <Windows>
            <dx:PopupWindow ContentUrl="~/Registration/RegisteredCompanyList.aspx" PopupElementID="ASPxFormLayout1$ASPxButtonEditRCNo">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:PopupWindow>
            <dx:PopupWindow PopupElementID="ASPxFormLayout1$ASPxComboBoxTaxOffices">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxGridView ID="ASPxgvTaxOffices" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridTaxOffices" DataSourceID="edsTaxOffices" KeyFieldName="TaxOfficeId" Width="100%">
                            <ClientSideEvents RowDblClick="function(s, e) {
	gridTaxOffices.GetRowValues(e.visibleIndex, 'TaxOfficeId;TaxOfficeName', OnGetTaxOffice);
}" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowInCustomizationForm="True" VisibleIndex="6">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn Caption="Tax Office ID" FieldName="TaxOfficeId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="TaxOfficeName" ShowInCustomizationForm="True" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Street" ShowInCustomizationForm="True" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="City" ShowInCustomizationForm="True" VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                            <Settings ShowFilterRow="True" />
                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                        </dx:ASPxGridView>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:PopupWindow>
        </Windows>
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
