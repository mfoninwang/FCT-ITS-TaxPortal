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
    
    public partial class BusinessLine
    {
        public BusinessLine()
        {
            this.ITaxpayers = new HashSet<ITaxpayer>();
            this.CTaxpayers = new HashSet<CTaxpayer>();
            this.CTINRequests = new HashSet<CTINRequest>();
        }
    
        public string BusinessLineId { get; set; }
        public string GroupId { get; set; }
        public string BusinessLineName { get; set; }
    
        public virtual BusinessLineGroup BusinessLineGroup { get; set; }
        public virtual ICollection<ITaxpayer> ITaxpayers { get; set; }
        public virtual ICollection<CTaxpayer> CTaxpayers { get; set; }
        public virtual ICollection<CTINRequest> CTINRequests { get; set; }
    }
}
