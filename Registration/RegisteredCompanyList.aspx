<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisteredCompanyList.aspx.cs" Inherits="TAAPs.Registration.RegisteredCompanyList" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>


<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="esmdsRegisteredCompanies" Width="100%" ClientInstanceName="mastergrid">
                <ClientSideEvents RowDblClick="function(s, e) 
{
	mastergrid.GetRowValues(e.visibleIndex, 'RCNo;CompanyName;DateOfIncorporation', ReturnToParentPage);
}" />
                <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />

<SettingsAdaptivity>
<AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
</SettingsAdaptivity>

                <SettingsPager PageSize="15">
                </SettingsPager>
                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />

<EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
                <Columns>
                    <dx:GridViewDataTextColumn Caption="CAC Number" FieldName="CacNumber" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="RegistrationDate" VisibleIndex="2">
                    </dx:GridViewDataDateColumn>
                </Columns>
            </dx:ASPxGridView>
            <dx:EntityServerModeDataSource ID="esmdsRegisteredCompanies" runat="server" ContextTypeName="TAAPs.Model.TAAPsDBContext" TableName="RegisteredCompanies" OnSelecting="esmdsRegisteredCompanies_Selecting"></dx:EntityServerModeDataSource>

        </div>
    </form>
</body>
</html>



