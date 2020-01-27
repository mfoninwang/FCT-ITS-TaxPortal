<%@ Page Title="" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="RevenueAnalysis.aspx.cs" Inherits="TAAPs.Analytics.RevenueAnalysis" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Start page Label Plugins 
        =====================================================================-->
    <!-- Toastr css -->
    <link href="../assets/plugins/toastr/toastr.css" rel="stylesheet" type="text/css" />
    <!-- Emojionearea -->
    <link href="../assets/plugins/emojionearea/emojionearea.min.css" rel="stylesheet" type="text/css" />
    <!-- Monthly css -->
    <link href="../assets/plugins/monthly/monthly.css" rel="stylesheet" type="text/css" />

    <!-- End page Label Plugins 
        =====================================================================-->


    <!-- Start Page Lavel Plugins
        =====================================================================-->
    <!-- Toastr js -->
    <script src="../assets/plugins/toastr/toastr.min.js" type="text/javascript"></script>
    <!-- Sparkline js -->
    <script src="../assets/plugins/sparkline/sparkline.min.js" type="text/javascript"></script>
    <!-- Data maps js -->
    <script src="../assets/plugins/datamaps/d3.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/datamaps/topojson.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/datamaps/datamaps.all.min.js" type="text/javascript"></script>
    <!-- Counter js -->
    <script src="../assets/plugins/counterup/waypoints.js" type="text/javascript"></script>
    <script src="../assets/plugins/counterup/jquery.counterup.min.js" type="text/javascript"></script>
    <!-- ChartJs JavaScript -->
    <script src="../assets/plugins/chartJs/Chart.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/emojionearea/emojionearea.min.js" type="text/javascript"></script>
    <!-- Monthly js -->
    <script src="../assets/plugins/monthly/monthly.js" type="text/javascript"></script>
    <!-- Data maps -->
    <script src="../assets/plugins/datamaps/d3.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/datamaps/topojson.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/datamaps/datamaps.all.min.js" type="text/javascript"></script>

    <!-- End Page Lavel Plugins
        =====================================================================-->
    <!-- Start Theme label Script
        =====================================================================-->
    <!-- Dashboard js -->
    <script src="../assets/dist/js/custom.js" type="text/javascript"></script>

    <!-- End Theme label Script
        =====================================================================-->
    <script>
        "use strict"; // Start of use strict
        // notification
        setTimeout(function () {
            toastr.options = {
                closeButton: true,
                progressBar: true,
                showMethod: 'slideDown',
                timeOut: 1000
            };
            toastr.success('Responsive Web', 'Welcome to Federal Capital Teritory Tax Portal');

        }, 1300);

        //counter
        $('.count-number').counterUp({
            delay: 10,
            time: 5000
        });

        //data maps
        var basic_choropleth = new Datamap({
            element: document.getElementById("map1"),
            projection: 'mercator',
            fills: {
                defaultFill: "#009688",
                authorHasTraveledTo: "#fa0fa0"
            },
            data: {
                USA: { fillKey: "authorHasTraveledTo" },
                JPN: { fillKey: "authorHasTraveledTo" },
                ITA: { fillKey: "authorHasTraveledTo" },
                CRI: { fillKey: "authorHasTraveledTo" },
                KOR: { fillKey: "authorHasTraveledTo" },
                DEU: { fillKey: "authorHasTraveledTo" }
            }
        });

        var colors = d3.scale.category10();

        window.setInterval(function () {
            basic_choropleth.updateChoropleth({
                USA: colors(Math.random() * 10),
                RUS: colors(Math.random() * 100),
                AUS: { fillKey: 'authorHasTraveledTo' },
                BRA: colors(Math.random() * 50),
                CAN: colors(Math.random() * 50),
                ZAF: colors(Math.random() * 50),
                IND: colors(Math.random() * 50)
            });
        }, 2000);

        //bar chart
        var ctx = document.getElementById("barChart");
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                datasets: [
                    {
                        label: "My First dataset",
                        data: [65, 59, 80, 81, 56, 55, 40, 25, 35, 51, 94, 16],
                        borderColor: "#009688",
                        borderWidth: "0",
                        backgroundColor: "#009688"
                    },
                    {
                        label: "My Second dataset",
                        data: [28, 48, 40, 19, 86, 27, 90, 91, 41, 25, 34, 47],
                        borderColor: "#009688",
                        borderWidth: "0",
                        backgroundColor: "#009688"
                    }
                ]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
        //radar chart
        var ctx = document.getElementById("radarChart");
        var myChart = new Chart(ctx, {
            type: 'radar',
            data: {
                labels: [["Eating", "Dinner"], ["Drinking", "Water"], "Sleeping", ["Designing", "Graphics"], "Coding", "Cycling", "Running"],
                datasets: [
                    {
                        label: "My First dataset",
                        data: [65, 59, 66, 45, 56, 55, 40],
                        borderColor: "#00968866",
                        borderWidth: "1",
                        backgroundColor: "rgba(0, 150, 136, 0.35)"
                    },
                    {
                        label: "My Second dataset",
                        data: [28, 12, 40, 19, 63, 27, 87],
                        borderColor: "rgba(55, 160, 0, 0.7",
                        borderWidth: "1",
                        backgroundColor: "rgba(0, 150, 136, 0.35)"
                    }
                ]
            },
            options: {
                legend: {
                    position: 'top'
                },
                scale: {
                    ticks: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Message
        $('.message_inner').slimScroll({
            size: '3px',
            height: '320px'
        });

        //emojionearea
        $(".emojionearea").emojioneArea({
            pickerPosition: "top",
            tonesStyle: "radio"
        });

        //monthly calender
        $('#m_calendar').monthly({
            mode: 'event',
            //jsonUrl: 'events.json',
            //dataType: 'json'
            xmlUrl: 'events.xml'
        });


        //line chart
        var ctx = document.getElementById("lineChart");
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                datasets: [
                    {
                        label: "My First dataset",
                        borderColor: "rgba(0,0,0,.09)",
                        borderWidth: "1",
                        backgroundColor: "rgba(0,0,0,.07)",
                        data: [22, 44, 67, 43, 76, 45, 12, 45, 65, 55, 42, 61, 73]
                    },
                    {
                        label: "My Second dataset",
                        borderColor: "#009688",
                        borderWidth: "1",
                        backgroundColor: "#009688",
                        pointHighlightStroke: "#009688",
                        data: [16, 32, 18, 26, 42, 33, 44, 24, 19, 16, 67, 71, 65]
                    }
                ]
            },
            options: {
                responsive: true,
                tooltips: {
                    mode: 'index',
                    intersect: false
                },
                hover: {
                    mode: 'nearest',
                    intersect: true
                }

            }
        });


    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentTitle" runat="server">
    Dashboard
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentSubTitle" runat="server">
    Revenue Analysis
</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
    <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-4">
            <div class="panel panel-bd cardbox">
                <div class="panel-body">
                    <div class="statistic-box">
                        <h2><span class="count-number">15</span>
                        </h2>
                    </div>
                    <div class="items pull-left">
                        <i class="fa fa-users fa-2x"></i>
                        <h4>Individual Taxpayers </h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-4">
            <div class="panel panel-bd cardbox">
                <div class="panel-body">
                    <div class="statistic-box">
                        <h2><span class="count-number">19</span>
                        </h2>
                    </div>
                    <div class="items pull-left">
                        <i class="fa fa-users fa-2x"></i>
                        <h4>Corporate Taxpayers</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-4">
            <div class="panel panel-bd cardbox">
                <div class="panel-body">
                    <div class="statistic-box">
                        <h2><span class="count-number">10</span></h2>
                    </div>
                    <div class="items pull-left">
                        <i class="fa fa-money fa-2x"></i>
                        <h4>Revenue</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-4">
            <div class="panel panel-bd cardbox">
                <div class="panel-body">
                    <div class="statistic-box">
                        <h2><span class="count-number">8</span>
                        </h2>
                    </div>
                    <div class="items pull-left">
                        <i class="fa fa-money fa-2x"></i>
                        <h4>PAYE</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-4">
            <div class="panel panel-bd cardbox">
                <div class="panel-body">
                    <div class="statistic-box">
                        <h2><span class="count-number">2</span>
                        </h2>
                    </div>
                    <div class="items pull-left">
                        <i class="fa fa-money fa-2x"></i>
                        <h4>WHT</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-4">
            <div class="panel panel-bd cardbox">
                <div class="panel-body">
                    <div class="statistic-box">
                        <h2><span class="count-number">3</span>
                        </h2>
                    </div>
                    <div class="items pull-left">
                        <i class="fa fa-home fa-2x"></i>
                        <h4>Centers</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <!-- datamap -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 ">
            <div class="panel panel-bd lobidrag">
                <div class="panel-heading">
                    <div class="panel-title">
                        <h4>Line chart</h4>
                    </div>
                </div>
                <div class="panel-body">
                    <canvas id="lineChart" height="150"></canvas>
                </div>
            </div>
        </div>
        <!-- calender -->
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
            <div class="panel panel-bd lobidisable">
                <div class="panel-heading">
                    <div class="panel-title">
                        <h4>Calender</h4>
                    </div>
                </div>
                <div class="panel-body">
                    <!-- monthly calender -->
                    <div class="monthly_calender">
                        <div class="monthly" id="m_calendar"></div>
                    </div>
                </div>
                <div id="map1" class="hidden-xs hidden-sm hidden-md hidden-lg"></div>
            </div>
        </div>
        <!-- Bar Chart -->
        <div class="col-xs-12 col-sm-12 col-md-6">
            <div class="panel panel-bd lobidisable">
                <div class="panel-heading">
                    <div class="panel-title">
                        <h4>Bar chart</h4>
                    </div>
                </div>
                <div class="panel-body">
                    <canvas id="barChart" height="200"></canvas>
                </div>
            </div>
        </div>
        <!-- Radar Chart -->
        <div class="col-xs-12 col-sm-12 col-md-6">
            <div class="panel panel-bd lobidisable">
                <div class="panel-heading">
                    <div class="panel-title">
                        <h4>Rader chart</h4>
                    </div>
                </div>
                <div class="panel-body">
                    <canvas id="radarChart" height="200"></canvas>
                </div>
            </div>
        </div>
        <!-- Basic data map -->
        <div class="col-xs-12 col-sm-6">
            <div class="panel panel-bd lobidrag">
                <div class="panel-heading">
                    <div class="panel-title">
                        <h4>Google Map</h4>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="embed-container">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7879.959096252686!2d7.449838304583758!3d9.065627256045294!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x104e0adf059dccdd%3A0x79e9ee68711fa564!2sFederal+Inland+Revenue+Service%2C+Annex+2!5e0!3m2!1sen!2sng!4v1517508274012" width="600" height="450" style="border: 0"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-6">
            <div class="panel panel-bd lobidrag">
                <div class="panel-heading">
                    <div class="panel-title">
                        <h4>DataTables </h4>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="dataTableExample2" class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Office</th>
                                    <th>Age</th>
                                    <th>Start date</th>
                                    <th>Salary</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Garrett Winters</td>
                                    <td>Accountant</td>
                                    <td>Tokyo</td>
                                    <td>63</td>
                                    <td>2011/07/25</td>
                                    <td>$170,750</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->







</asp:Content>

