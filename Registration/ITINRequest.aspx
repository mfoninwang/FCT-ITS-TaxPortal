<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ITINRequest.aspx.cs" Inherits="TAAPs.Registration.ITINRequest" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <script type="text/javascript">

        var lastState = null;
        function OnStateChanged(state) {

            comboTaxOffice.ClearItems();
            gridTaxOffices.Refresh();

            if (lga.InCallback())
                lastState = state.GetValue().toString();
            else {
                lga.PerformCallback(state.GetValue().toString());
            }
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


    <dx:ASPxFormLayout runat="server" ColCount="2" ClientInstanceName="formlayout" DataSourceID="edsTINRequest" Width="100%" ID="ASPxFormLayout1" OnDataBound="ASPxFormLayout1_DataBound">
        <Items>
            <dx:LayoutGroup Caption="Taxpayer Information" ColCount="4" ColSpan="2">
                <Items>
                    <dx:LayoutItem Caption="Taxpayer Name" FieldName="TaxpayerName" RequiredMarkDisplayMode="Required" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox runat="server" Width="100%" Height="25px" ClientInstanceName="textCompanyName" ID="aspxtxtCompanyName">
                                    <ValidationSettings Display="Dynamic">
                                        <RequiredField IsRequired="True">
                                        </RequiredField>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Business Line" FieldName="BusinessLineId" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox runat="server" DataSourceID="edsBusinessLines" TextField="BusinessLineName" ValueField="BusinessLineId" Width="100%" ID="ASPxComboBox1">
                                    <ValidationSettings Display="Dynamic">
                                        <RequiredField IsRequired="True">
                                        </RequiredField>
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Type of Individual" FieldName="InEmployment">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxRadioButtonList runat="server" RepeatDirection="Horizontal" SelectedIndex="0" Width="100%" Height="25px" ID="ASPxrblIndividualType">
                                    <Items>
                                        <dx:ListEditItem Selected="True" Text="Employee" Value="Employee">
                                        </dx:ListEditItem>
                                        <dx:ListEditItem Text="Self Employed" Value="Self Employed">
                                        </dx:ListEditItem>
                                    </Items>
                                    <CaptionSettings Position="Top">
                                    </CaptionSettings>
                                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                        <RequiredField IsRequired="True" ErrorText="Required">
                                        </RequiredField>
                                    </ValidationSettings>
                                </dx:ASPxRadioButtonList>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Address" ColCount="2" Width="50%">
                <Items>
                    <dx:LayoutItem Caption="Street No." FieldName="StreetNo" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox runat="server" Width="100%" ID="ASPxFormLayout1_E11">
                                    <ValidationSettings Display="Dynamic">
                                        <RequiredField IsRequired="True">
                                        </RequiredField>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="City">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox runat="server" Width="100%" ID="ASPxFormLayout1_E13">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Street" FieldName="Street" RequiredMarkDisplayMode="Required" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox runat="server" Width="100%" EnableFocusedStyle="False" ID="ASPxTextBox1">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True">
                                        </RequiredField>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="State" FieldName="StateId" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox runat="server" IncrementalFilteringMode="StartsWith" DataSourceID="edsStates" TextField="StateName" ValueField="StateId" AutoResizeWithContainer="True" Width="100%" AutoPostBack="True" ClientInstanceName="state" ID="ASPxComboBoxState">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	OnStateChanged(s);
}">
                                    </ClientSideEvents>
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True">
                                        </RequiredField>
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="LGA" FieldName="LgaId">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox runat="server" DataSourceID="edsLgas" TextField="LGAName" ValueField="LGAId" Width="100%" ClientInstanceName="lga" ID="ASPxComboBoxLga" OnCallback="ASPxComboBoxLga_Callback">
                                    <ClientSideEvents EndCallback="function(s, e) {
	OnEndCallback
}">
                                    </ClientSideEvents>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="Contact Information" ColCount="2" Width="50%">
                <Items>
                    <dx:LayoutItem Caption="Phone 1" FieldName="Phone1" RequiredMarkDisplayMode="Required">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox runat="server" Width="100%" ID="ASPxFormLayout1_E15">
                                    <MaskSettings Mask="000-0000-0000">
                                    </MaskSettings>
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True">
                                        </RequiredField>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Phone 2" FieldName="Phone2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox runat="server" ID="ASPxFormLayout1_E2">
                                    <MaskSettings Mask="000-0000-0000">
                                    </MaskSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Email" RequiredMarkDisplayMode="Required" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox runat="server" Width="100%" ID="ASPxFormLayout1_E18">
                                    <ValidationSettings>
                                        <RegularExpression ValidationExpression="\w+([-+.&#39;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </RegularExpression>
                                        <RequiredField IsRequired="True">
                                        </RequiredField>
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Tax Office" FieldName="TaxOfficeId" RequiredMarkDisplayMode="Required" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox runat="server" Width="100%" ClientInstanceName="comboTaxOffice" ID="ASPxComboBoxTaxOffices">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True">
                                        </RequiredField>
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup GroupBoxDecoration="HeadingLine" ShowCaption="False" ColSpan="2" Width="100%" HorizontalAlign="Right">
                <Items>
                    <dx:LayoutItem ShowCaption="False" HorizontalAlign="Right">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton runat="server" ClientInstanceName="submit" HorizontalAlign="Center" CommandName="New" Text="Submit TIN Request" ID="ASPxButtonSubmit" OnClick="ASPxButtonSubmit_Click">
                                    <ClientSideEvents Click="function(s, e) {

}">
                                    </ClientSideEvents>
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
        <SettingsItemCaptions Location="Top">
        </SettingsItemCaptions>
    </dx:ASPxFormLayout>
    <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxOffices" Include="LGA,LGA.State" Where="it.LGA.StateId = @StateId" ID="edsTaxOffices">
        <WhereParameters>
            <asp:ControlParameter ControlID="ASPxFormLayout1$ASPxComboBoxState" PropertyName="Value" Name="StateId" Type="String"></asp:ControlParameter>
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
    <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EntitySetName="BusinessLines" OrderBy="it.BusinessLineName" Select="it.[BusinessLineId], it.[BusinessLineName]" ID="edsBusinessLines">
    </asp:EntityDataSource>
    <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EntitySetName="ITINRequests" ID="edsTINRequest">
    </asp:EntityDataSource>
    <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EntitySetName="LGAs" Select="it.[LGAId], it.[LGAName], it.[StateId]" Where="it.StateId = @StateId" ID="edsLgas">
        <WhereParameters>
            <asp:Parameter Name="StateId" Type="String"></asp:Parameter>
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource runat="server" DefaultContainerName="TAAPsDBContext" ConnectionString="name=TAAPsDBContext" EnableFlattening="False" EntitySetName="States" Select="it.[StateId], it.[StateName]" ID="edsStates">
    </asp:EntityDataSource>
</asp:Content>
