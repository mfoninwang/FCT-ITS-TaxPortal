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
    
    public partial class IAssessmentFile
    {
        public System.Guid FileId { get; set; }
        public int AssessmentId { get; set; }
        public string FileName { get; set; }
        public string FileDescription { get; set; }
        public string FileType { get; set; }
        public byte[] FileContent { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreateDate { get; set; }
    
        public virtual IAssessment IAssessment { get; set; }
        public virtual User User { get; set; }
    }
}
