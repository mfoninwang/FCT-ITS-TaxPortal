<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="TAAPs.Administration.Users" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsUsers" Width="100%" KeyFieldName="UserName" OnRowUpdating="ASPxGridView1_RowUpdating" OnCellEditorInitialize="ASPxGridView1_CellEditorInitialize" OnCustomErrorText="ASPxGridView1_CustomErrorText" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow">
        <ClientSideEvents RowDblClick="function(s, e) {
	s.StartEditRow(e.visibleIndex);
}" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="0" Width="100px" ReadOnly="True">
                <PropertiesTextEdit>
                    <ValidationSettings ErrorDisplayMode="ImageWithText">
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LastName" ReadOnly="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FirstName" ReadOnly="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Role.RoleName" ReadOnly="True" VisibleIndex="5" Caption="Role"></dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="TaxOffice.TaxOfficeName" ReadOnly="True" VisibleIndex="6" Caption="Tax Office">
                <PropertiesTextEdit>
                    <ReadOnlyStyle BackColor="#CCCCCC">
                    </ReadOnlyStyle>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="TaxOfficeId" Visible="false" ReadOnly="True" VisibleIndex="8" Caption="Tax Office Id">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataCheckColumn FieldName="IsActive" ReadOnly="True" VisibleIndex="9" Width="60px">
                <PropertiesCheckEdit DisplayTextChecked="Yes" DisplayTextUnchecked="No">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewCommandColumn ShowApplyFilterButton="True" VisibleIndex="10" ShowEditButton="True" ShowNewButtonInHeader="True" ShowUpdateButton="True" Width="100px">
            </dx:GridViewCommandColumn>
        </Columns>
        <SettingsBehavior FilterRowMode="OnClick" AllowSelectSingleRowOnly="True" AllowSelectByRowClick="True" ColumnResizeMode="Control" />
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" ShowFilterBar="Auto" ShowPreview="True" />
        <SettingsText PopupEditFormCaption="Edit User" />
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" VerticalAlign="TopSides" Width="800" />
            <CustomizationWindow HorizontalAlign="Center" VerticalAlign="Middle" />
        </SettingsPopup>
        <SettingsDataSecurity AllowDelete="False" />
        <Templates>
            <EditForm>

                <dx:ASPxFormLayout ID="formLayout" runat="server" Width="100%" EnableTheming="True">

                    <Items>
                        <dx:LayoutGroup ColCount="2" Width="100%" Caption="Basic Info">
                            <Items>
                                <dx:LayoutItem ColSpan="2" FieldName="UserName" RequiredMarkDisplayMode="Required">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement1" runat="server" ReplacementType="EditFormCellEditor" ColumnID="UserName" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Tax Office" FieldName="TaxOfficeId" RequiredMarkDisplayMode="Required">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement2" runat="server" ReplacementType="EditFormCellEditor" ColumnID="TaxOfficeId" />
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Role" FieldName="RoleId" RequiredMarkDisplayMode="Required">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxComboBox ID="ASPxFormLayout1_E2" runat="server" DataSourceID="dsRoles" Width="100%" ValidationSettings-ValidationGroup="<%#    (Container.NamingContainer as GridViewEditFormTemplateContainer).ValidationGroup    %>" TextField="RoleName" ValueField="RoleId" Value='<%# Eval("RoleId") %>' ValueType="System.Int32">
                                                <ValidationSettings CausesValidation="True">
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup ColCount="2" Width="100%" Caption="More Details">
                            <Items>
                                <dx:LayoutItem ColSpan="2" FieldName="Title">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E7" runat="server" Text='<%# Eval("Title") %>' Width="50%">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="LastName" RequiredMarkDisplayMode="Required">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E4" runat="server" Width="100%" ValidationSettings-ValidationGroup="<%# (Container.NamingContainer as GridViewEditFormTemplateContainer).ValidationGroup %>" Text='<%# Eval("LastName") %>'>
                                                <ValidationSettings CausesValidation="True">
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="FirstName" RequiredMarkDisplayMode="Required">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E5" runat="server" Width="100%" ValidationSettings-ValidationGroup="<%# (Container.NamingContainer as GridViewEditFormTemplateContainer).ValidationGroup %>" Text='<%# Eval("FirstName") %>'>
                                                <ValidationSettings CausesValidation="True">
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="MiddleName">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E6" runat="server" Width="100%" Text='<%# Eval("MiddleName") %>'>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="StaffId">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E12" runat="server" Width="100%" Text='<%# Eval("StaffId") %>'>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="Email">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxTextBox ID="ASPxFormLayout1_E10" runat="server" Width="100%" ValidationSettings-ValidationGroup="<%# (Container.NamingContainer as GridViewEditFormTemplateContainer).ValidationGroup %>" Text='<%# Eval("Email") %>'>
                                                <ValidationSettings CausesValidation="True">
                                                    <RegularExpression ErrorText="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem FieldName="IsActive">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxCheckBox ID="ASPxFormLayout1_E13" runat="server" CheckState="Unchecked" Value='<%# Eval("IsActive") %>'>
                                            </dx:ASPxCheckBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                    <SettingsItemCaptions Location="Top" />
                </dx:ASPxFormLayout>

                <div style="text-align: right; padding: 10px 10px 10px 10px">
                    <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                        runat="server" ColumnID=""></dx:ASPxGridViewTemplateReplacement>

                    <dx:ASPxButton ID="ASPxPwdReset" runat="server" Text="Reset Password" OnClick="ASPxPwdReset_Click" RenderMode="Link" OnInit="ASPxPwdReset_Init"></dx:ASPxButton>

                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                        runat="server"></dx:ASPxGridViewTemplateReplacement>

                </div>
            </EditForm>
        </Templates>
    </dx:ASPxGridView>
    <asp:EntityDataSource ID="dsUsers" runat="server" ConnectionString="name=TAAPsDBContext"
        DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EnableInsert="True" EnableUpdate="True"
        EntitySetName="Users" Where="it.Role.ParentId = @RoleId &amp;&amp; it.TaxOfficeId = @TaxOfficeId" Include="Role,TaxOffice">
        <WhereParameters>
            <asp:SessionParameter Name="RoleId" SessionField="UserRoleId" Type="Int32" />
            <asp:SessionParameter Name="TaxOfficeId" SessionField="TaxOfficeId" Type="String" />
        </WhereParameters>
        <InsertParameters>
            <asp:SessionParameter Name="CreatedBy" SessionField="UserName" Type="String" />
        </InsertParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsRoles" runat="server"
        ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False"
        EntitySetName="Roles" Where="it.ParentId = @ParentRoleId" EntityTypeFilter="" Select="">
        <WhereParameters>
            <asp:SessionParameter DefaultValue="" Name="ParentRoleId" SessionField="UserRoleId" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
