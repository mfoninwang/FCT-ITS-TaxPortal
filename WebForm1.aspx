<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TAAPs.WebForm1" %>

<%@ Register assembly="DevExpress.Dashboard.v18.1.Web.WebForms, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.DashboardWeb" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

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
            <dx:ASPxDashboard ID="ASPxDashboard1" runat="server" Width="100%" Height="850px" OnConfigureDataConnection="ASPxDashboard1_ConfigureDataConnection">
            <ClientSideEvents BeforeRender="onBeforeRender" />
            </dx:ASPxDashboard>
        </div>
    </form>
</body>
</html>
