//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TAAPs.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tenant
    {
        public string TenantId { get; set; }
        public string TenantName { get; set; }
        public string EmailServer { get; set; }
        public string EmailSender { get; set; }
        public string EmailUser { get; set; }
        public string EmailUserPassword { get; set; }
        public string ReportServer { get; set; }
        public string ReportUser { get; set; }
        public string ReportPassword { get; set; }
        public string ReportDomain { get; set; }
        public string ReportFolder { get; set; }
        public int SessionTimeout { get; set; }
        public int PasswordExpiration { get; set; }
        public int FailedLoginAttempts { get; set; }
        public Nullable<int> EmailServerPort { get; set; }
    }
}
