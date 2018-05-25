using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity.Core.Objects;

namespace TAAPs.Model
{
    public partial class CTINRequest
    {
       static TAAPsDBContext context;

        public static string ApproveTinRequest(long requestId, string approvedBy)
        {
            try
            {
                var outputParameter = new ObjectParameter("TIN", typeof(string));

                context = new TAAPsDBContext();

                context.ApproveCTINRequest(requestId, approvedBy, outputParameter);
                var tin = outputParameter.Value;

                return tin.ToString();
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}