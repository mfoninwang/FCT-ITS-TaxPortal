﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class TAAPsDBContext : DbContext
    {
        public TAAPsDBContext()
            : base("name=TAAPsDBContext")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<BusinessLineGroup> BusinessLineGroups { get; set; }
        public virtual DbSet<BusinessLine> BusinessLines { get; set; }
        public virtual DbSet<ReportCategory> ReportCategories { get; set; }
        public virtual DbSet<Report> Reports { get; set; }
        public virtual DbSet<RevenueCollectorReceipt> RevenueCollectorReceipts { get; set; }
        public virtual DbSet<ReceiptPrintHistory> ReceiptPrintHistories { get; set; }
        public virtual DbSet<WHTCreditNote> WHTCreditNotes { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<TaxOfficeRegion> TaxOfficeRegions { get; set; }
        public virtual DbSet<RevenueTarget> RevenueTargets { get; set; }
        public virtual DbSet<UserTransfer> UserTransfers { get; set; }
        public virtual DbSet<ITaxpayerAssociate> ITaxpayerAssociates { get; set; }
        public virtual DbSet<ITaxpayerBank> ITaxpayerBanks { get; set; }
        public virtual DbSet<ITaxpayerOtherIncome> ITaxpayerOtherIncomes { get; set; }
        public virtual DbSet<ITaxpayerRepresentative> ITaxpayerRepresentatives { get; set; }
        public virtual DbSet<Bank> Banks { get; set; }
        public virtual DbSet<ITaxpayerTransfer> ITaxpayerTransfers { get; set; }
        public virtual DbSet<State> States { get; set; }
        public virtual DbSet<LGA> LGAs { get; set; }
        public virtual DbSet<NotificationSetting> NotificationSettings { get; set; }
        public virtual DbSet<Tenant> Tenants { get; set; }
        public virtual DbSet<CorporateTransfer> CorporateTransfers { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<CTurnover> CTurnovers { get; set; }
        public virtual DbSet<CBank> CBanks { get; set; }
        public virtual DbSet<Resource> Resources { get; set; }
        public virtual DbSet<RoleResource> RoleResources { get; set; }
        public virtual DbSet<TaxOfficeType> TaxOfficeTypes { get; set; }
        public virtual DbSet<GeneratedReceipt> GeneratedReceipts { get; set; }
        public virtual DbSet<ITaxAccount> ITaxAccounts { get; set; }
        public virtual DbSet<CollectionAgent> CollectionAgents { get; set; }
        public virtual DbSet<IAssessmentIncome> IAssessmentIncomes { get; set; }
        public virtual DbSet<TaxExclusion> TaxExclusions { get; set; }
        public virtual DbSet<IAssessmentExclusion> IAssessmentExclusions { get; set; }
        public virtual DbSet<IncomeType> IncomeTypes { get; set; }
        public virtual DbSet<TaxIncome> TaxIncomes { get; set; }
        public virtual DbSet<TaxTable> TaxTables { get; set; }
        public virtual DbSet<Year> Years { get; set; }
        public virtual DbSet<ITaxpayerFile> ITaxpayerFiles { get; set; }
        public virtual DbSet<IAssessment> IAssessments { get; set; }
        public virtual DbSet<Currency> Currencies { get; set; }
        public virtual DbSet<TaxType> TaxTypes { get; set; }
        public virtual DbSet<IAssessmentFile> IAssessmentFiles { get; set; }
        public virtual DbSet<UserLoginHistory> UserLoginHistories { get; set; }
        public virtual DbSet<CTaxpayerFile> CTaxpayerFiles { get; set; }
        public virtual DbSet<IPenalty> IPenalties { get; set; }
        public virtual DbSet<IInterest> IInterests { get; set; }
        public virtual DbSet<Country> Countries { get; set; }
        public virtual DbSet<ITaxpayer> ITaxpayers { get; set; }
        public virtual DbSet<ITaxpayerAddress> ITaxpayerAddresses { get; set; }
        public virtual DbSet<ITaxpayerNoK> ITaxpayerNoKs { get; set; }
        public virtual DbSet<CTaxpayerBranch> CTaxpayerBranches { get; set; }
        public virtual DbSet<NINData> NINDatas { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }
        public virtual DbSet<ITaxpayerSMSNotification> ITaxpayerSMSNotifications { get; set; }
        public virtual DbSet<Profession> Professions { get; set; }
        public virtual DbSet<ITINRequest> ITINRequests { get; set; }
        public virtual DbSet<RegisteredCompany> RegisteredCompanies { get; set; }
        public virtual DbSet<IssueLog> IssueLogs { get; set; }
        public virtual DbSet<CTaxpayer> CTaxpayers { get; set; }
        public virtual DbSet<CTINRequest> CTINRequests { get; set; }
        public virtual DbSet<CompanyType> CompanyTypes { get; set; }
        public virtual DbSet<TaxOffice> TaxOffices { get; set; }
    
        public virtual int GenerateReceipt(string receiptId, string paymentReference, Nullable<decimal> amount, Nullable<System.DateTime> paymentDate, string receivedFrom, string address, string tin, string taxType, string periodFrom, string periodTo, string bank, string bankBranch, string generatedBy, string taxOffice, string scheduleReference)
        {
            var receiptIdParameter = receiptId != null ?
                new ObjectParameter("ReceiptId", receiptId) :
                new ObjectParameter("ReceiptId", typeof(string));
    
            var paymentReferenceParameter = paymentReference != null ?
                new ObjectParameter("PaymentReference", paymentReference) :
                new ObjectParameter("PaymentReference", typeof(string));
    
            var amountParameter = amount.HasValue ?
                new ObjectParameter("Amount", amount) :
                new ObjectParameter("Amount", typeof(decimal));
    
            var paymentDateParameter = paymentDate.HasValue ?
                new ObjectParameter("PaymentDate", paymentDate) :
                new ObjectParameter("PaymentDate", typeof(System.DateTime));
    
            var receivedFromParameter = receivedFrom != null ?
                new ObjectParameter("ReceivedFrom", receivedFrom) :
                new ObjectParameter("ReceivedFrom", typeof(string));
    
            var addressParameter = address != null ?
                new ObjectParameter("Address", address) :
                new ObjectParameter("Address", typeof(string));
    
            var tinParameter = tin != null ?
                new ObjectParameter("Tin", tin) :
                new ObjectParameter("Tin", typeof(string));
    
            var taxTypeParameter = taxType != null ?
                new ObjectParameter("TaxType", taxType) :
                new ObjectParameter("TaxType", typeof(string));
    
            var periodFromParameter = periodFrom != null ?
                new ObjectParameter("PeriodFrom", periodFrom) :
                new ObjectParameter("PeriodFrom", typeof(string));
    
            var periodToParameter = periodTo != null ?
                new ObjectParameter("PeriodTo", periodTo) :
                new ObjectParameter("PeriodTo", typeof(string));
    
            var bankParameter = bank != null ?
                new ObjectParameter("Bank", bank) :
                new ObjectParameter("Bank", typeof(string));
    
            var bankBranchParameter = bankBranch != null ?
                new ObjectParameter("BankBranch", bankBranch) :
                new ObjectParameter("BankBranch", typeof(string));
    
            var generatedByParameter = generatedBy != null ?
                new ObjectParameter("GeneratedBy", generatedBy) :
                new ObjectParameter("GeneratedBy", typeof(string));
    
            var taxOfficeParameter = taxOffice != null ?
                new ObjectParameter("TaxOffice", taxOffice) :
                new ObjectParameter("TaxOffice", typeof(string));
    
            var scheduleReferenceParameter = scheduleReference != null ?
                new ObjectParameter("ScheduleReference", scheduleReference) :
                new ObjectParameter("ScheduleReference", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GenerateReceipt", receiptIdParameter, paymentReferenceParameter, amountParameter, paymentDateParameter, receivedFromParameter, addressParameter, tinParameter, taxTypeParameter, periodFromParameter, periodToParameter, bankParameter, bankBranchParameter, generatedByParameter, taxOfficeParameter, scheduleReferenceParameter);
        }
    
        public virtual int GetResources()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetResources");
        }
    
        public virtual ObjectResult<string> DecryptData(byte[] encryptedData)
        {
            var encryptedDataParameter = encryptedData != null ?
                new ObjectParameter("encryptedData", encryptedData) :
                new ObjectParameter("encryptedData", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("DecryptData", encryptedDataParameter);
        }
    
        [DbFunction("TAAPsDBContext", "PITComputationDetails")]
        public virtual IQueryable<PITComputationDetails> PITComputationDetails(Nullable<decimal> assesableIncome, Nullable<int> year)
        {
            var assesableIncomeParameter = assesableIncome.HasValue ?
                new ObjectParameter("AssesableIncome", assesableIncome) :
                new ObjectParameter("AssesableIncome", typeof(decimal));
    
            var yearParameter = year.HasValue ?
                new ObjectParameter("Year", year) :
                new ObjectParameter("Year", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<PITComputationDetails>("[TAAPsDBContext].[PITComputationDetails](@AssesableIncome, @Year)", assesableIncomeParameter, yearParameter);
        }
    
        [DbFunction("TAAPsDBContext", "ITaxAccountSummary")]
        public virtual IQueryable<ITaxAccountSummary> ITaxAccountSummary(Nullable<int> taxAccountNo)
        {
            var taxAccountNoParameter = taxAccountNo.HasValue ?
                new ObjectParameter("TaxAccountNo", taxAccountNo) :
                new ObjectParameter("TaxAccountNo", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<ITaxAccountSummary>("[TAAPsDBContext].[ITaxAccountSummary](@TaxAccountNo)", taxAccountNoParameter);
        }
    
        public virtual int ApproveCTINRequest(Nullable<long> requestId, string approvedBy, ObjectParameter tIN)
        {
            var requestIdParameter = requestId.HasValue ?
                new ObjectParameter("RequestId", requestId) :
                new ObjectParameter("RequestId", typeof(long));
    
            var approvedByParameter = approvedBy != null ?
                new ObjectParameter("approvedBy", approvedBy) :
                new ObjectParameter("approvedBy", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ApproveCTINRequest", requestIdParameter, approvedByParameter, tIN);
        }
    
        public virtual int ApproveITINRequest(Nullable<long> requestId, string approvedBy, ObjectParameter tIN)
        {
            var requestIdParameter = requestId.HasValue ?
                new ObjectParameter("RequestId", requestId) :
                new ObjectParameter("RequestId", typeof(long));
    
            var approvedByParameter = approvedBy != null ?
                new ObjectParameter("approvedBy", approvedBy) :
                new ObjectParameter("approvedBy", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("ApproveITINRequest", requestIdParameter, approvedByParameter, tIN);
        }
    }
}
