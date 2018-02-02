﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisteredCompanyList.aspx.cs" Inherits="TAAPs.Registration.RegisteredCompanyList" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>


<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

        function ReturnToParentPage(keyValue)
        {
            var parentWindow = window.parent;
            parentWindow.SelectAndClosePopup(keyValue);
        }

    </script>


</head>

<body>
    <form id="form1" runat="server">
        <div>

            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="esmdsRegisteredCompanies" KeyFieldName="RCNo" Width="100%" ClientInstanceName="mastergrid">
                <ClientSideEvents RowDblClick="function(s, e) 
{
	mastergrid.GetRowValues(e.visibleIndex, 'RCNo;CompanyName;DateOfIncorporation', ReturnToParentPage);
}" />
                <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                <SettingsPager PageSize="15">
                </SettingsPager>
                <Settings ShowFilterRow="True" />
                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="RCNo" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="DateOfIncorporation" VisibleIndex="2">
                    </dx:GridViewDataDateColumn>
                </Columns>
            </dx:ASPxGridView>
            <dx:EntityServerModeDataSource ID="esmdsRegisteredCompanies" runat="server" ContextTypeName="TAAPs.Model.TAAPsDBContext" TableName="RegisteredCompanies" OnSelecting="esmdsRegisteredCompanies_Selecting"></dx:EntityServerModeDataSource>

        </div>
    </form>
</body>
</html>



