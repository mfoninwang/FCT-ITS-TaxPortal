﻿<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TAAPs.Default" %>

<%@ Register Assembly="DevExpress.Dashboard.v15.2.Web, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentTitle" runat="server">
    Dashboard
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentSubTitle" runat="server">
    Dashboard
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
    <dx:ASPxImageSlider ID="ASPxImageSlider1" runat="server" BinaryImageCacheFolder="~\Thumb\" ShowNavigationBar="False" Width="100%" ImageSourceFolder="~/Content/Images/Slider/" SettingsNavigationBar-ThumbnailsModeNavigationButtonVisibility="None" SettingsNavigationBar-PagingMode="Page" SettingsImageArea-NavigationButtonVisibility="None">
        <SettingsImageArea AnimationType="None" ItemTextVisibility="Always" EnableLoopNavigation="True" ImageSizeMode="FillAndCrop" NavigationButtonVisibility="None" />
        <SettingsNavigationBar Mode="Dots" ImageSizeMode="FitProportional" PagingMode="Single" />
        <SettingsSlideShow StopPlayingWhenPaging="false" PausePlayingWhenMouseOver="false" PlayPauseButtonVisibility="Faded" Interval="5000" />
        <SettingsAutoGeneratedImages ImageCacheFolder="~\Thumb\" />
    </dx:ASPxImageSlider>
</asp:Content>
