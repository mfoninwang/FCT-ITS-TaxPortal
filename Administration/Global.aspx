<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="Global.aspx.cs" Inherits="TAAPs.Administration.Global" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Tax Authority Setup
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
</asp:Content>




<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">


    <dx:ASPxFormLayout ID="formlayout" runat="server" DataSourceID="edsTenant" Width="100%" ColCount="3" ColumnCount="3">
        <Items>
            <dx:LayoutItem Caption="Tax Authority Id" FieldName="TenantId">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="formlayout_E1" runat="server" ReadOnly="True" Width="100%">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Tax Authority Name" ColSpan="2" FieldName="TenantName">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="formlayout_E2" runat="server" ReadOnly="True" Width="100%">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="SessionTimeout" Caption="Session Timeout (Minutes)">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="formlayout_E12" runat="server" Width="100%">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="FailedLoginAttempts">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="formlayout_E13" runat="server" Width="100%">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem FieldName="PasswordExpiration" Caption="Password Expiration (Days)">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="formlayout_E14" runat="server" Width="100%">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:TabbedLayoutGroup ColSpan="3" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Mail Settings" ColCount="2">
                        <Items>
                            <dx:LayoutItem FieldName="EmailServer">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="formlayout_E3" runat="server" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem FieldName="EmailSender">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="formlayout_E4" runat="server" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem FieldName="EmailUser">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="formlayout_E5" runat="server" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem FieldName="EmailUserPassword">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="formlayout_E6" runat="server" Password="True" Width="100%">
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
                                        <dx:ASPxTextBox ID="formlayout_E7" runat="server" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem FieldName="ReportDomain">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="formlayout_E10" runat="server" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem FieldName="ReportUser">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="formlayout_E8" runat="server" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem FieldName="ReportPassword">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="formlayout_E9" runat="server" Password="True" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem FieldName="ReportFolder">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="formlayout_E11" runat="server" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="SMS Settings">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:TabbedLayoutGroup>
        </Items>
        <SettingsItemCaptions Location="Top" />
    </dx:ASPxFormLayout>

    <hr />
    <div class="text-right">
        <dx:ASPxButton ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click"></dx:ASPxButton>
        <dx:ASPxButton ID="CancelButton" runat="server" Text="Cancel" Enabled="False" AutoPostBack="False"></dx:ASPxButton>
    </div>


    <asp:EntityDataSource ID="edsTenant" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableUpdate="True" EntitySetName="Tenants" EntityTypeFilter="Tenant" Where="it.TenantId==&quot;FCT-IRS&quot;">
    </asp:EntityDataSource>
        

</asp:Content>
