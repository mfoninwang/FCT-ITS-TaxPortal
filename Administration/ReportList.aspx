<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ReportList.aspx.cs" Inherits="TAAPs.Administration.ReportList" %>
<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <dx:ASPxGridView ID="ASPxgvReports" runat="server" AutoGenerateColumns="False" DataSourceID="edsReports" KeyFieldName="ReportId" Width="100%">
    <Columns>
        <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowNewButtonInHeader="True" VisibleIndex="6" Width="100px">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="ReportId" ReadOnly="True" Visible="False" VisibleIndex="0" Width="100px">
            <PropertiesTextEdit MaxLength="3">
                <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                    <RegularExpression ErrorText="" />
                    <RequiredField ErrorText="Required" IsRequired="True" />
                </ValidationSettings>
                <Style HorizontalAlign="Right">
                </Style>
            </PropertiesTextEdit>
            <EditFormSettings CaptionLocation="Top" />
            <EditCellStyle HorizontalAlign="Right">
            </EditCellStyle>
            <CellStyle HorizontalAlign="Right">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Report Title" FieldName="ReportDesc" VisibleIndex="1">
            <PropertiesTextEdit>
                <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText">
                    <RequiredField ErrorText="Required" IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
            <EditFormSettings Caption="Report Title" CaptionLocation="Top" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="ReportName" Visible="False" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Url" VisibleIndex="4">
            <PropertiesTextEdit>
                <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText">
                    <RequiredField ErrorText="Required" IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
            <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
            <EditFormSettings CaptionLocation="Top" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="CreateDate" ReadOnly="True" VisibleIndex="5" Width="100px">
            <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
            </PropertiesDateEdit>
            <EditFormSettings Visible="False" />
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataComboBoxColumn Caption="Category" FieldName="ReportCategoryId" VisibleIndex="3" Width="150px">
            <PropertiesComboBox DataSourceID="edsCategory" TextField="ReportCategoryName" ValueField="ReportCategoryId">
                <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText">
                    <RequiredField ErrorText="Required" IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
            <Settings HeaderFilterMode="CheckedList" />
            <EditFormSettings Caption="Category" CaptionLocation="Top" />
        </dx:GridViewDataComboBoxColumn>
    </Columns>
    <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ConfirmDelete="True" />
    <SettingsEditing Mode="Batch" NewItemRowPosition="Bottom">
    </SettingsEditing>
    <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
</dx:ASPxGridView>
<asp:EntityDataSource ID="edsReports" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Reports" Include="ReportCategory">
</asp:EntityDataSource>
<asp:EntityDataSource ID="edsCategory" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="ReportCategories">
</asp:EntityDataSource>
</asp:Content>
