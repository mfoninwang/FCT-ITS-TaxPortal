<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaxOfficeList.aspx.cs" Inherits="TAAPs.PopupList.TaxOfficeList" %>

<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="mastergrid" DataSourceID="edsTaxOffices" KeyFieldName="TaxOfficeId" Width="100%">
            <ClientSideEvents RowDblClick="function(s, e) 
{
	mastergrid.GetRowValues(e.visibleIndex, 'TaxOfficeId;TaxOfficeName', ReturnToParentPage);
}" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="TaxOfficeId" ReadOnly="True" Visible="False" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TaxOfficeName" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Type" FieldName="TaxOfficeTypeId" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Street" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="City" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="LGA" FieldName="LGA.LGAName" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TaxOfficerName" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="State" FieldName="LGA.State.StateName" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
            <Settings ShowFilterRow="True" />
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        </dx:ASPxGridView>
        <asp:EntityDataSource ID="edsTaxOffices" runat="server" ConnectionString="name=TAAPsDBContext" DefaultContainerName="TAAPsDBContext" EnableFlattening="False" EntitySetName="TaxOffices" Include="LGA,LGA.State" Where="it.LGA.StateId =@StateId">
            <WhereParameters>
                <asp:QueryStringParameter Name="StateId" QueryStringField="StateId" Type="String" />
            </WhereParameters>
        </asp:EntityDataSource>
    
    </div>
    </form>
</body>
</html>
