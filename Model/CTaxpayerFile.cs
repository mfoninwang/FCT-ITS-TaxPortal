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
    
    public partial class CTaxpayerFile
    {
        public System.Guid FileId { get; set; }
        public string TIN { get; set; }
        public string FileName { get; set; }
        public string FileDescription { get; set; }
        public string FileType { get; set; }
        public byte[] FileContent { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreateDate { get; set; }
    
        public virtual User User { get; set; }
        public virtual CTaxpayer CTaxpayer { get; set; }
    }
}
