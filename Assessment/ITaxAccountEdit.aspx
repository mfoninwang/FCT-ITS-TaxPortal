<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="ITaxAccountEdit.aspx.cs" Inherits="TAAPs.Assessment.ITaxAccountEdit" %>

<%@ Register assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Assessment
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Tax Accounts
</asp:Content>



<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%">
        <TabPages>
            <dx:TabPage Text="Tax Account Info">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:ASPxFormLayout ID="TaxAccountForm" runat="server" ColCount="2" DataSourceID="TaxAccountDataSource">
                            <Items>
                                <dx:LayoutGroup GroupBoxDecoration="None" ShowCaption="False">
                                    <Items>
                                        <dx:LayoutItem FieldName="TaxAccountNo">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxSpinEdit ID="ASPxFormLayout1_E1" runat="server" Number="0">
                                                    </dx:ASPxSpinEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Tax Type" FieldName="TaxTypeId">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="ASPxFormLayout1_E3" runat="server" Width="170px">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="Currency">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="ASPxFormLayout1_E4" runat="server" Width="170px">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="TIN">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="ASPxFormLayout1_E2" runat="server" Width="170px">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Taxpayer Name">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="Description">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="ASPxFormLayout1_E5" runat="server" Width="170px">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="Status">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="ASPxFormLayout1_E6" runat="server" Width="170px">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup GroupBoxDecoration="None" ShowCaption="False">
                                    <Items>
                                        <dx:LayoutItem FieldName="TotalTaxPayable">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="TaxAccountForm_E15" runat="server">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="TotalPenalty">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="TaxAccountForm_E17" runat="server">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="TotalInterest">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="TaxAccountForm_E19" runat="server">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="TotalPayment">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="TaxAccountForm_E21" runat="server">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem FieldName="Balance">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxTextBox ID="TaxAccountForm_E23" runat="server">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                            </Items>
                        </dx:ASPxFormLayout>
                        <asp:EntityDataSource ID="TaxAccountDataSource" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="ITaxAccounts" EntityTypeFilter="ITaxAccount">
                        </asp:EntityDataSource>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Assessment History">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Payment History">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Penalty History">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
</asp:Content>
