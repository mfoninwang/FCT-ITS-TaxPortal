﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Global.aspx.cs" Inherits="TAAPs.Administration.Global" %>
<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {
	LoadingPanel.Hide();
}" />
    </dx:ASPxCallback>

    <dx:ASPxFormLayout ID="formlayout" runat="server" DataSourceID="edsTenant" Width="100%" ColCount="2">
    <Items>
        <dx:LayoutGroup Caption="Tax Authority Info" ColCount="2" ColSpan="2">
            <Items>
                <dx:LayoutItem FieldName="TenantId">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="formlayout_E1" runat="server" ReadOnly="True">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem FieldName="TenantName">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="formlayout_E2" runat="server" ReadOnly="True">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:LayoutGroup>
        <dx:LayoutGroup Caption="Security Settings" ColCount="3" ColSpan="2">
            <Items>
                <dx:LayoutItem FieldName="SessionTimeout">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="formlayout_E12" runat="server">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem FieldName="FailedLoginAttempts">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="formlayout_E13" runat="server">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem FieldName="PasswordExpiration">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="formlayout_E14" runat="server">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:LayoutGroup>
        <dx:LayoutGroup Caption="Mail Settings" ColCount="2">
            <Items>
                <dx:LayoutItem FieldName="EmailServer">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="formlayout_E3" runat="server">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem FieldName="EmailSender">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="formlayout_E4" runat="server">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem FieldName="EmailUser">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="formlayout_E5" runat="server">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem FieldName="EmailUserPassword">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="formlayout_E6" runat="server" Password="True">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:LayoutGroup>
        <dx:LayoutGroup Caption="Report Settings" ColCount="3">
            <Items>
                <dx:LayoutItem ColSpan="2" FieldName="ReportServer">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="formlayout_E7" runat="server">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem FieldName="ReportDomain">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="formlayout_E10" runat="server">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem FieldName="ReportUser">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="formlayout_E8" runat="server">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem FieldName="ReportPassword">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="formlayout_E9" runat="server" Password="True">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem FieldName="ReportFolder">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="formlayout_E11" runat="server">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:LayoutGroup>
        <dx:LayoutGroup ColSpan="2" ShowCaption="False" GroupBoxDecoration="HeadingLine" HorizontalAlign="Right" Width="100%">
            <Items>
                <dx:LayoutItem Caption="Submit" HorizontalAlign="Right" ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Submit">
                            </dx:ASPxButton>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:LayoutGroup>
    </Items>
        <SettingsItemCaptions Location="Top" />
</dx:ASPxFormLayout>
<asp:SqlDataSource ID="sdsSettings" runat="server" ConnectionString="<%$ ConnectionStrings:TAAPsCon %>" DeleteCommand="DELETE FROM [Tenants] WHERE [TenantId] = @TenantId" InsertCommand="INSERT INTO [Tenants] ([TenantId], [TenantName], [EmailServer], [EmailSender], [EmailUser], [EmailUserPassword]) VALUES (@TenantId, @TenantName, @EmailServer, @EmailSender, @EmailUser, @EmailUserPassword)" SelectCommand="SELECT * FROM [Tenants] WHERE ([TenantId] = @TenantId)" UpdateCommand="UPDATE [Tenants] SET  [EmailServer] = @EmailServer, [EmailSender] = @EmailSender, [EmailUser] = @EmailUser, [EmailUserPassword] = @EmailUserPassword WHERE [TenantId] = @TenantId">
    <DeleteParameters>
        <asp:Parameter Name="TenantId" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="TenantId" Type="String" />
        <asp:Parameter Name="TenantName" Type="String" />
        <asp:Parameter Name="EmailServer" Type="String" />
        <asp:Parameter Name="EmailSender" Type="String" />
        <asp:Parameter Name="EmailUser" Type="String" />
        <asp:Parameter Name="EmailUserPassword" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:Parameter DefaultValue="NIRS" Name="TenantId" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="formlayout$EmailServerTextBox" Name="EmailServer" PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="formlayout$EmailSenderTextBox" Name="EmailSender" PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="formlayout$EmaiUserTextBox" Name="EmailUser" PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="formlayout$EmailPasswordTextBox" Name="EmailUserPassword" PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="formlayout$IdTextBox" Name="TenantId" PropertyName="Text" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:EntityDataSource ID="edsTenant" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableUpdate="True" EntitySetName="Tenants" EntityTypeFilter="Tenant" Where="it.TenantId==&quot;OIRS&quot;">
    </asp:EntityDataSource>
    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" ContainerElementID="UpdateButton" Modal="True" Text="Updating Record&amp;hellip;">
    </dx:ASPxLoadingPanel>
</asp:Content>
