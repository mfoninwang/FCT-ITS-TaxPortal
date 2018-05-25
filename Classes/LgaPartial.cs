using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TAAPs.Model
{
    public partial class LGA
    {
        private static TAAPsDBContext context = new TAAPsDBContext();

        public  static ICollection<LGA> GetLGAs(string stateId)
        {
           ICollection<LGA> lgas = context.LGAs.Where(s => s.StateId == stateId).ToList();

            return lgas;
        }
    }
}