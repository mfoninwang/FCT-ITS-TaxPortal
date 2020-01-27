<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TAAPs.Login_aspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Kwara State Tax Portal</title>

    <!-- Favicon and touch icons -->
    <%--    <link rel="shortcut icon" href="assets/dist/img/ico/favicon.png" type="image/x-icon" />--%>


    <!-- Bootstrap -->
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Bootstrap rtl -->
    <!--<link href="assets/bootstrap-rtl/bootstrap-rtl.min.css" rel="stylesheet" type="text/css"/>-->
    <!-- Pe-icon-7-stroke -->
    <link href="assets/pe-icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet" type="text/css" />
    <!-- style css -->
    <link href="assets/dist/css/styletaaps.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style rtl -->
    <!--<link href="assets/dist/css/stylehealth-rtl.css" rel="stylesheet" type="text/css"/>-->

    <!-- Bootstrap Dialog -->
    <link href="Content/bootstrap-dialog.css" rel="stylesheet" />

    <!-- End Bootstrap Dialog
        =====================================================================-->

</head>

<body>
    <form id="loginForm" method="post">
        <!-- Content Wrapper -->
        <div class="login-wrapper">

            <div class="container-center">
                <div class="panel panel-bd">
                    <div class="panel-heading">
                        <div class="view-header">
                            <div class="header-icon">
                                <i class="pe-7s-unlock"></i>
                            </div>
                            <div class="header-title">
                                <h3>Login</h3>
                                <small><strong>Please enter your credentials to login.</strong></small>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label class="control-label" for="username">Username</label>
                            <input type="text" placeholder="Username" title="Please enter you username" required="required" value="" name="username" id="username" class="form-control" runat="server" />

                        </div>
                        <div class="form-group">
                            <label class="control-label" for="password">Password</label>
                            <input type="password" title="Please enter your password" placeholder="******" required="required" value="" name="password" id="password" class="form-control" runat="server" />

                        </div>
                        <div>
                            <button id="btnLogin" type="submit" onserverclick="BtnLogin_Click" class="btn btn-primary" runat="server">Login</button>
                        </div>
                        <div">
                            <span class="psw">Forgot <a href="#">password?</a></span>
                        </div>


                    </div>
                </div>
            </div>

        </div>
        <!-- /.content-wrapper -->
        <!-- jQuery -->
        <script src="assets/plugins/jQuery/jquery-1.12.4.min.js" type="text/javascript"></script>
        <!-- bootstrap js -->
        <script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>


        <!-- Bootstrap Dialog js -->
        <script src="/Scripts/bootstrap-dialog.js"></script>
        <script src="/Scripts/Custom.js"></script>
        <!--  End Bootstrap Dialog js
        =====================================================================-->


        <script>

            function ShowDialog(type, title, message) {

                var dialogType;
                switch (type) {
                    case 'Sucess':
                        dialogType = BootstrapDialog.TYPE_SUCCESS;
                        break;
                    case 'Information':
                        dialogType = BootstrapDialog.TYPE_INFO;
                        break;
                    case 'Danger':
                        dialogType = BootstrapDialog.TYPE_DANGER;
                        break;
                    default:
                        dialogType = BootstrapDialog.TYPE_DEFAULT;
                }

                BootstrapDialog.show({
                    type: dialogType,
                    title: title,
                    message: message,
                    closable: true,
                    closeByBackdrop: false,
                    closeByKeyboard: false,
                    buttons: [{
                        label: 'Close',
                        action: function (dialog) {
                            dialog.close();
                        }
                    }]
                })
            }

        </script>
    </form>
</body>
</html>
