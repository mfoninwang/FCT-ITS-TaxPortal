<%@ Page Title="" Language="C#" MasterPageFile="~/MainLayout.Master" AutoEventWireup="true" CodeBehind="TaxOfficeList.aspx.cs" Inherits="TAAPs.Administration.TaxOfficeList" %>
<%@ Register assembly="DevExpress.Web.ASPxTreeList.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTreeList" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Tax Office
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Tax Office List
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentBody" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="edsTaxOffices" KeyFieldName="TaxOfficeId" OnCellEditorInitialize="ASPxGridView1_CellEditorInitialize" OnCustomErrorText="ASPxGridView1_CustomErrorText">
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="15" Width="100px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="TaxOfficeId" ReadOnly="True" VisibleIndex="0">
                <PropertiesTextEdit>
                    <ValidationSettings ErrorDisplayMode="ImageWithText">
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings CaptionLocation="Top" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaxOfficeName" VisibleIndex="1">
                <PropertiesTextEdit>
                    <ValidationSettings ErrorDisplayMode="ImageWithText">
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings CaptionLocation="Top" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Street" VisibleIndex="6" Visible="False">
                <EditFormSettings CaptionLocation="Top" Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="City" Visible="False" VisibleIndex="7">
                <EditFormSettings CaptionLocation="Top" Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LGAId" Visible="False" VisibleIndex="8">
                <EditFormSettings CaptionLocation="Top" Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Telephone" Visible="False" VisibleIndex="9">
                <EditFormSettings CaptionLocation="Top" Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaxOfficerName" VisibleIndex="10" Caption="Tax Controller">
                <EditFormSettings CaptionLocation="Top" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaxOfficerPhone" VisibleIndex="11" Visible="False">
                <EditFormSettings CaptionLocation="Top" Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="IsActive" VisibleIndex="12" Width="100px">
                <EditFormSettings CaptionLocation="Top" />
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataDateColumn FieldName="CreateDate" ReadOnly="True" VisibleIndex="13">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <EditFormSettings CaptionLocation="Top" Visible="False" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="CreatedBy" ReadOnly="True" VisibleIndex="14">
                <EditFormSettings CaptionLocation="Top" Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Region" FieldName="RegionId" VisibleIndex="5">
                <PropertiesComboBox DataSourceID="edsRegions" TextField="RegionName" ValueField="RegionId">
                    <ValidationSettings ErrorDisplayMode="ImageWithText">
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings CaptionLocation="Top" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Type" FieldName="TaxOfficeTypeId" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="edsTaxOfficeTypes" TextField="TaxOfficeTypeName" ValueField="TaxOfficeTypeId">
                    <ValidationSettings ErrorDisplayMode="ImageWithText">
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings CaptionLocation="Top" />
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" />
        <SettingsEditing EditFormColumnCount="4">
        </SettingsEditing>
        <Settings ShowFilterRowMenu="True" />
        <SettingsDataSecurity AllowDelete="False" />
    </dx:ASPxGridView>
    <asp:EntityDataSource ID="edsTaxOffices" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="TaxOffices">
        <InsertParameters>
            <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
        </InsertParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsRegions" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxOfficeRegions" Select="it.[RegionId], it.[RegionName]">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsTaxOfficeTypes" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxOfficeTypes" Select="it.[TaxOfficeTypeId], it.[TaxOfficeTypeName]">
    </asp:EntityDataSource>
</asp:Content>
