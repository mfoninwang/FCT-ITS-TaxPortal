<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="CollectionAgentList.aspx.cs" Inherits="TAAPs.Collections.CollectionAgentList" %>
<%@ Register assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Tax Collection Agent
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Agent List
</asp:Content>




<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
    <dx:ASPxGridView ID="aspxgvAgents" runat="server" AutoGenerateColumns="False" DataSourceID="edsAgents" KeyFieldName="AgentId" OnCellEditorInitialize="aspxgvAgents_CellEditorInitialize" OnCustomErrorText="aspxgvAgents_CustomErrorText">
        <ClientSideEvents RowDblClick="function(s, e) {
	s.StartEditRow(e.visibleIndex);
}" />
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <SettingsDataSecurity AllowDelete="False" />
        <SettingsText PopupEditFormCaption="Edit Collection Agent" />
        <EditFormLayoutProperties ColCount="3">
            <Items>
                <dx:GridViewLayoutGroup Caption="Agent Details" ColCount="3" ColSpan="3" GroupBoxDecoration="HeadingLine">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="AgentId">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="AgentType">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="DistributorType">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="3" ColumnName="AgentName">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="MobileNo">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Country">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Status">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Email" ColSpan="2" ColumnName="Email">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Marketing Code" ColumnName="Marketing Code">
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </dx:GridViewLayoutGroup>
                <dx:GridViewLayoutGroup Caption="Contact Information" ColCount="2" ColSpan="3" GroupBoxDecoration="HeadingLine">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="ContactName">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="ContactPhone" Caption="Phone">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="ContactEmail" Caption="Email">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="ContactAddress1" Caption="Address Line 1">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="ContactAddress2" Caption="Address Line 2">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="ContactAddress3" Caption="Address Line 3">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="ContactAddress4" Caption="Address Line 4">
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </dx:GridViewLayoutGroup>
                <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
            <SettingsItemCaptions Location="Top" />
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="18">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AgentId" ReadOnly="True" VisibleIndex="0">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AgentName" VisibleIndex="1">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Description" Visible="False" VisibleIndex="4">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MobileNo" VisibleIndex="5">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SecurityCode" Visible="False" VisibleIndex="6">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MarketingCode" Visible="False" VisibleIndex="7">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" Visible="False" VisibleIndex="8">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ContactName" Visible="False" VisibleIndex="11">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ContactEmail" Visible="False" VisibleIndex="12">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ContactPhone" Visible="False" VisibleIndex="13">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ContactAddress1" Visible="False" VisibleIndex="14">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ContactAddress2" Visible="False" VisibleIndex="15">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ContactAddress3" Visible="False" VisibleIndex="16">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ContactAddress4" Visible="False" VisibleIndex="17">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="AgentType" VisibleIndex="2">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="Mini Agent" Value="Mini Agent" />
                        <dx:ListEditItem Text="Standard Agent" Value="Standard Agent" />
                        <dx:ListEditItem Text="Super Agent" Value="Super Agent" />
                    </Items>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Country" VisibleIndex="9">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="Nigeria" Value="Nigeria" Selected="True" />
                    </Items>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>

            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Status" VisibleIndex="10">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="Active" Value="Active" />
                        <dx:ListEditItem Text="Inactive" Value="Inactive" />
                        <dx:ListEditItem Text="Closed" Value="Closed" />
                        <dx:ListEditItem Text="Pending" Value="Pending" />
                        <dx:ListEditItem Text="Blacklisted" Value="Blacklisted" />
                    </Items>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>

            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="DistributorType" VisibleIndex="3">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="Mini" Value="Mini" />
                        <dx:ListEditItem Text="Standard" Value="Standard" />
                        <dx:ListEditItem Text="Super" Value="Super" />
                    </Items>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>

            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:EntityDataSource ID="edsAgents" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="CollectionAgents" EntityTypeFilter="CollectionAgent">
    </asp:EntityDataSource>
</asp:Content>
