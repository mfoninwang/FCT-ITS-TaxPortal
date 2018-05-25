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
    
    public partial class WHTCreditNote
    {
        public string CreditNoteId { get; set; }
        public string BeneficiaryName { get; set; }
        public string BeneficiaryTaxNumber { get; set; }
        public string BeneficiaryAddress { get; set; }
        public string TransactionDescription { get; set; }
        public Nullable<decimal> ContractAmount { get; set; }
        public Nullable<decimal> WHTRate { get; set; }
        public Nullable<decimal> WHTAmt { get; set; }
        public string ReceiptId { get; set; }
        public string PrintStatus { get; set; }
    
        public virtual RevenueCollectorReceipt RevenueCollectorReceipt { get; set; }
    }
}