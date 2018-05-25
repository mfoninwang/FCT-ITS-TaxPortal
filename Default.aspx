<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TAAPs.Default" %>

<%@ Register Assembly="DevExpress.Dashboard.v18.1.Web.WebForms, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Dashboard Features
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="panelHeading" runat="server">
    <div class="btn-group">
        <a class="btn btn-primary" href="#">
            <i class="glyphicon glyphicon-dashboard"></i>
            Tax Office Revenue Dashboard
        </a>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">

    <!-- Trigger the modal with a button -->
    <button type="button" class="btn info" data-toggle="modal" data-target="#myModal"  hidden="hidden" style="position: fixed; right: 0px; bottom: 30px;">Log Issue</button>

    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2 class="modal-title">Log Issue</h2>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="SubjectText">Subject:</label>
                        <input type="text" class="form-control" runat="server" id="SubjectTextField" maxlength="20" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea class="form-control" runat="server" id="DescriptionTextField" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="Priority">Description:</label>
                        <select class="form-control" name="Priority" runat="server" id ="PriorityField" required>
                            <option value="Low">Low</option>
                            <option value="Medium">Medium</option>
                            <option value="High">High</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button runat="server" id="SubmitIssue" class="btn btn-default" onserverclick="SubmitIssue_Click">Submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
