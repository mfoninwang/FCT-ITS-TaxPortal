<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="BusinessLineList.aspx.cs" Inherits="TAAPs.Administration.BusinessLineList" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Xpo.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Xpo" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Administration
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Business Lines
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="panelHeading" runat="server">

    <div class="btn-group">
        <a class="btn btn-primary" href="#">
            <i class="glyphicon glyphicon-align-justify"></i>
            Business Line List
        </a>
    </div>
</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">

        <dx:ASPxGridView ID="ASPxgvBusLineList" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource1" KeyFieldName="BusinessLineId" Width="100%" OnHtmlDataCellPrepared="ASPxgvBusLineList_HtmlDataCellPrepared" EnableTheming="True">
            <SettingsText Title="Business Line List" />

<EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
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
            </Columns>
            <SettingsBehavior AllowSelectSingleRowOnly="True" AllowSelectByRowClick="True" />
<SettingsAdaptivity>
<AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
</SettingsAdaptivity>

            <SettingsEditing Mode="Batch">
            </SettingsEditing>
            <SettingsPopup>
                <EditForm Modal="True" HorizontalAlign="Center" VerticalAlign="Middle" />
            </SettingsPopup>
            <SettingsDataSecurity AllowDelete="False" />
            <Toolbars>
                <dx:GridViewToolbar ItemAlign="Right">
                    <Items>
                        <dx:GridViewToolbarItem Text="Grid Options">
                            <Items>
                                <dx:GridViewToolbarItem Command="ShowFilterRow" Text="Show Filter">
                                </dx:GridViewToolbarItem>
                                <dx:GridViewToolbarItem Command="ShowSearchPanel" Text="Show Search Panel">
                                </dx:GridViewToolbarItem>
                            </Items>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Command="New" Name="New" Text="Add New Business Line" BeginGroup="True">
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
        </dx:ASPxGridView>

        <asp:EntityDataSource ID="edsGroups" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="BusinessLineGroups" Select="it.[GroupId], it.[GroupName]">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="BusinessLines" EntityTypeFilter="BusinessLine">
        </asp:EntityDataSource>
</asp:Content>
