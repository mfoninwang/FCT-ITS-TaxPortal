<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="TAAPs.WebForm2" %>

<%@ Register Assembly="DevExpress.Dashboard.v18.1.Web.WebForms, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="Content/bootstrap/bootstrap.min.css" rel="stylesheet" />

    <script type="text/javascript">
        function onBeforeRender(sender) {
            var control = sender.getDashboardControl();
            control.registerExtension(new DevExpress.Dashboard.DashboardPanelExtension(control));
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxDashboard ID="ASPxDashboard1" runat="server" Width="100%" Height="850px" ColorScheme="dark" DashboardStorageFolder="~/App_Data/Dashboards" WorkingMode="ViewerOnly">
                <ClientSideEvents BeforeRender="onBeforeRender" />
            </dx:ASPxDashboard>
        </div>
    </form>
</body>
</html>
