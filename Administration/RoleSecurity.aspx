<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="RoleSecurity.aspx.cs" Inherits="TAAPs.Administration.RoleSecurity" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Role Security
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Role Security
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="panelHeading" runat="server">
    <div class="btn-group">
        <a class="btn btn-primary" href="#">
            <i class="glyphicon glyphicon-align-justify"></i>
            Role Security List
        </a>
    </div>
</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">

    <dx:ASPxSplitter ID="SecuritySplitter" runat="server" Height="100%">
        <Panes>
            <dx:SplitterPane AutoHeight="True">
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                        <div class="row form-group">
                            <div class="col-md-12">
                                <label for="ASPxcbRoles">Role</label>
                                <dx:ASPxComboBox ID="ASPxcbRoles" runat="server" DataSourceID="edsRoles" TextField="RoleName" ValueField="RoleId" AutoPostBack="True" OnSelectedIndexChanged="ASPxcbRoles_SelectedIndexChanged" Width="100%" NullText="Select Role">
                                </dx:ASPxComboBox>
                            </div>
                            <div class="col-md-12">
                                <label for="ASPxModules">Module</label>
                                <dx:ASPxComboBox ID="ASPxModules" runat="server" DataSourceID="edsModules" TextField="DecryptedResourceName" ValueField="ResourceId" AutoPostBack="True" OnSelectedIndexChanged="ASPxModules_SelectedIndexChanged" Width="100%" NullText="Select Module">
                                </dx:ASPxComboBox>
                            </div>
                        </div>


                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane>
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                        <div class="row form-group">
                            <div class="col-md-12">
                                <label for="ASPxCblRoleResources">Resources</label>
                            </div>
                        </div>
                        <dx:ASPxCheckBoxList ID="ASPxCblRoleResources" runat="server" RepeatColumns="2" TextField="DecryptedResourceName" ValueField="ResourceId" Width="100%">
                        </dx:ASPxCheckBoxList>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
        </Panes>
    </dx:ASPxSplitter>

    <dx:ASPxButton ID="ASPxbtnSaveRolePermissions" runat="server" OnClick="ASPxbtnSaveRolePermissions_Click" Text="Save">
    </dx:ASPxButton>

    <asp:EntityDataSource ID="edsRoleResources" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EntitySetName="RoleResources" Include="Resource">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsModules" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Resources" Where="it.ResourceType == 'Mod'" EntityTypeFilter="Resource" OrderBy="">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsResources" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Resources" Where="it.ResourceType=='Men'" EntityTypeFilter="Resource" Include="Parent" EnableUpdate="True" OrderBy="">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="edsRoles" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="Roles" Select="it.[RoleId], it.[RoleName]" Include="" EntityTypeFilter="" Where="it.RoleId != 1">
    </asp:EntityDataSource>
</asp:Content>
