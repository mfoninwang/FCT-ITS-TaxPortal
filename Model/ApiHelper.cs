using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Text;
using System.Web.Http;
using TAAPs.Model;
using System.Configuration;
using RestSharp;
using RestSharp.Authenticators;
using log4net;

namespace TAAPs.Model
{
    public static class ApiHelper
    {

        public static string BaseUrl = "http://localhost:1776/";
        public static string UserName = ConfigurationManager.AppSettings["User"];
        public static string Password = ConfigurationManager.AppSettings["Password"];

        public static HttpClient ApiClient { get; set; } = new HttpClient();

        public static void InitializeClient()
        {
            ApiClient = new HttpClient();
            ApiClient.DefaultRequestHeaders.Accept.Clear();
            ApiClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }
    }
}