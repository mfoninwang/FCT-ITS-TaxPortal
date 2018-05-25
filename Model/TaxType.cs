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
    
    public partial class TaxType
    {
        public TaxType()
        {
            this.ITaxAccounts = new HashSet<ITaxAccount>();
            this.TaxTables = new HashSet<TaxTable>();
        }
    
        public string TaxTypeId { get; set; }
        public string TaxTypeName { get; set; }
        public System.DateTime FillingDueDate { get; set; }
        public string FillingFrequency { get; set; }
        public decimal LateFilingFlatFee { get; set; }
        public decimal LateFilingRecurringFee { get; set; }
        public string LateFilingRecurringFeeFreq { get; set; }
        public int PaymentDueDays { get; set; }
        public decimal LatePaymentRate { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreateDate { get; set; }
        public decimal InterestRate { get; set; }
    
        public virtual ICollection<ITaxAccount> ITaxAccounts { get; set; }
        public virtual ICollection<TaxTable> TaxTables { get; set; }
        public virtual User User { get; set; }
    }
}