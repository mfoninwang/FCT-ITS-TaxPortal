using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TAAPs.Model
{
    public partial class ITaxAccount
    {
        TAAPsDBContext _context = new TAAPsDBContext();

        private ITaxAccountSummary GetSummary()
        {
            return this._context.ITaxAccountSummary(this.TaxAccountNo).Single<ITaxAccountSummary>();
        }

        public decimal? Balance
        {
            get
            {
                return this._context.ITaxAccountSummary(this.TaxAccountNo).Single<ITaxAccountSummary>().Balance;
            }
        }

        public decimal? TotalPayment
        {
            get
            {
                return this._context.ITaxAccountSummary(this.TaxAccountNo).Single<ITaxAccountSummary>().TotalPayment;
            }
        }


        public decimal? TotalTaxPayable
        {
            get
            {
                return this._context.ITaxAccountSummary(this.TaxAccountNo).Single<ITaxAccountSummary>().TotalTaxPayable;
            }
        }

        public decimal? TotalPenalty
        {
            get
            {
                return this._context.ITaxAccountSummary(this.TaxAccountNo).Single<ITaxAccountSummary>().TotalPenalty;
            }
        }

        public decimal? TotalInterest
        {
            get
            {
                return this._context.ITaxAccountSummary(this.TaxAccountNo).Single<ITaxAccountSummary>().TotalInterest;
            }
        }


    }
}