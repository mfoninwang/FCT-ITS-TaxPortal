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
    
    public partial class TaxOfficeRegion
    {
        public TaxOfficeRegion()
        {
            this.Users = new HashSet<User>();
        }
    
        public string RegionId { get; set; }
        public string RegionName { get; set; }
        public string TaxOfficerName { get; set; }
        public string TaxOfficerPhone { get; set; }
        public string TaxOfficeEmail { get; set; }
        public System.DateTime CreateDate { get; set; }
        public string CreatedBy { get; set; }
    
        public virtual ICollection<User> Users { get; set; }
    }
}
