﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="BusinessLineList.aspx.cs" Inherits="TAAPs.Administration.BusinessLineList" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Xpo.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Xpo" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="BusinessLines" EntityTypeFilter="BusinessLine">
    </asp:EntityDataSource>

    <dx:ASPxGridView ID="ASPxgvBusLineList" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource1" KeyFieldName="BusinessLineId" Width="100%" OnHtmlDataCellPrepared="ASPxgvBusLineList_HtmlDataCellPrepared">
        <Columns>
            <dx:GridViewDataTextColumn Caption="Code" FieldName="BusinessLineId" VisibleIndex="0">
                <PropertiesTextEdit EnableFocusedStyle="False" Native="True" Width="100%">
                    <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText">
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings CaptionLocation="Top" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Business Line" FieldName="BusinessLineName" VisibleIndex="1">
                <PropertiesTextEdit>
                    <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText">
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings CaptionLocation="Top" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Group" FieldName="GroupId" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="edsGroups" TextField="GroupName" ValueField="GroupId">
                    <ValidationSettings CausesValidation="True" ErrorDisplayMode="ImageWithText">
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings CaptionLocation="Top" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewCommandColumn ShowApplyFilterButton="True" VisibleIndex="3" ShowClearFilterButton="True" ShowNewButtonInHeader="True">
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior AllowSelectSingleRowOnly="True" FilterRowMode="OnClick" />
        <SettingsEditing Mode="Batch" NewItemRowPosition="Bottom">
        </SettingsEditing>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
        <SettingsLoadingPanel Mode="ShowAsPopup" />
        <SettingsPopup>
            <EditForm Modal="True" HorizontalAlign="Center" VerticalAlign="Middle" />
        </SettingsPopup>
        <SettingsDataSecurity AllowDelete="False" />
    </dx:ASPxGridView>

    <asp:EntityDataSource ID="edsGroups" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="BusinessLineGroups" Select="it.[GroupId], it.[GroupName]">
    </asp:EntityDataSource>
</asp:Content>
