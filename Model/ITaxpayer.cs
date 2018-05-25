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
    
    public partial class ITaxpayer
    {
        public ITaxpayer()
        {
            this.ITaxAccounts = new HashSet<ITaxAccount>();
            this.ITaxpayerAssociates = new HashSet<ITaxpayerAssociate>();
            this.ITaxpayerBanks = new HashSet<ITaxpayerBank>();
            this.ITaxpayerFiles = new HashSet<ITaxpayerFile>();
            this.ITaxpayerOtherIncomes = new HashSet<ITaxpayerOtherIncome>();
            this.ITaxpayerRepresentatives = new HashSet<ITaxpayerRepresentative>();
            this.ITaxpayerTransfers = new HashSet<ITaxpayerTransfer>();
            this.ITaxpayerAddresses = new HashSet<ITaxpayerAddress>();
        }
    
        public string TIN { get; set; }
        public string BVN { get; set; }
        public string JTBTIN { get; set; }
        public string NIN { get; set; }
        public string FIRSTIN { get; set; }
        public string StateTIN { get; set; }
        public string Title { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string OtherNames { get; set; }
        public string MaidenName { get; set; }
        public string PreviousLastName { get; set; }
        public string PreviousFirstName { get; set; }
        public string PreviousMiddleName { get; set; }
        public Nullable<decimal> Height { get; set; }
        public string SpouseNIN { get; set; }
        public Nullable<System.DateTime> BirthDate { get; set; }
        public string BirthStateId { get; set; }
        public string BirthCity { get; set; }
        public Nullable<int> BirthLgaId { get; set; }
        public Nullable<int> BirthCountryId { get; set; }
        public Nullable<int> NationalityId { get; set; }
        public string OriginStateId { get; set; }
        public Nullable<int> OriginLgaId { get; set; }
        public string Gender { get; set; }
        public string Email { get; set; }
        public string Website { get; set; }
        public string MaritalStatus { get; set; }
        public string Religion { get; set; }
        public string Phone1 { get; set; }
        public string Phone2 { get; set; }
        public string BusinessLineId { get; set; }
        public string Employer { get; set; }
        public string Profession { get; set; }
        public string EmploymentId { get; set; }
        public string EmploymentStatus { get; set; }
        public string HighestEducation { get; set; }
        public string IdentificationType { get; set; }
        public string IdentificationNumber { get; set; }
        public string NativeSpokenLanguage { get; set; }
        public string OtherSpokenLanguage { get; set; }
        public string ReadWriteLanguage { get; set; }
        public string GuadianFirstName { get; set; }
        public string GuadianLastName { get; set; }
        public string GuadianMiddleName { get; set; }
        public string GuadianNIN { get; set; }
        public string TaxAuthority { get; set; }
        public string TaxOfficeId { get; set; }
        public string RecordSource { get; set; }
        public bool EmailNotified { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreateDate { get; set; }
        public bool SMSNotified { get; set; }
    
        public virtual BusinessLine BusinessLine { get; set; }
        public virtual Country Country { get; set; }
        public virtual Country Country1 { get; set; }
        public virtual ICollection<ITaxAccount> ITaxAccounts { get; set; }
        public virtual LGA LGA { get; set; }
        public virtual LGA LGA1 { get; set; }
        public virtual State State { get; set; }
        public virtual State State1 { get; set; }
        public virtual TaxOffice TaxOffice { get; set; }
        public virtual ICollection<ITaxpayerAssociate> ITaxpayerAssociates { get; set; }
        public virtual ICollection<ITaxpayerBank> ITaxpayerBanks { get; set; }
        public virtual ICollection<ITaxpayerFile> ITaxpayerFiles { get; set; }
        public virtual ICollection<ITaxpayerOtherIncome> ITaxpayerOtherIncomes { get; set; }
        public virtual ICollection<ITaxpayerRepresentative> ITaxpayerRepresentatives { get; set; }
        public virtual ICollection<ITaxpayerTransfer> ITaxpayerTransfers { get; set; }
        public virtual ICollection<ITaxpayerAddress> ITaxpayerAddresses { get; set; }
        public virtual User User { get; set; }
    }
}