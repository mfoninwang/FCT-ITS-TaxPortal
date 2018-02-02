<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PITComputationDetails.aspx.cs" Inherits="TAAPs.Assessment.PITComputationDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


.dxeTextBoxSys td.dxic
{
    padding: 3px 3px 2px 3px;
    overflow: hidden;
}

.dxeButtonEditSys .dxeEditAreaSys,
.dxeButtonEditSys td.dxic,
.dxeTextBoxSys td.dxic,
.dxeMemoSys td,
.dxeEditAreaSys
{
	width: 100%;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
                <dx:ASPxGridView runat="server" ID="ASPxgvTaxDetails" AutoGenerateColumns="False">
                    <SettingsPager Visible="False">
                    </SettingsPager>
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Rate" FieldName="TaxRateDetail" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Amount" FieldName="Amount" VisibleIndex="1">
                            <PropertiesTextEdit DisplayFormatString="#,##0.00">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Right" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
        </dx:ASPxGridView>

    </div>
    </form>
</body>
</html>
