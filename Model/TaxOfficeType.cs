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
    
    public partial class TaxOfficeType
    {
        public TaxOfficeType()
        {
            this.TaxOffices = new HashSet<TaxOffice>();
        }
    
        public string TaxOfficeTypeId { get; set; }
        public string TaxOfficeTypeName { get; set; }
        public System.DateTime CreateDate { get; set; }
        public string CreatedBy { get; set; }
    
        public virtual ICollection<TaxOffice> TaxOffices { get; set; }
    }
}
