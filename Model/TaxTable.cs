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
    
    public partial class TaxTable
    {
        public int TaxTableId { get; set; }
        public int TaxYear { get; set; }
        public string TaxTypeId { get; set; }
        public decimal LowerBound { get; set; }
        public decimal UpperBound { get; set; }
        public byte TaxRate { get; set; }
    
        public virtual TaxType TaxType { get; set; }
    }
}
