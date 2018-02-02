using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TAAPs.Model
{
    public partial class Resource
    {
        TAAPsDBContext _context = new TAAPsDBContext();

        public string DecryptedResourceName
        {
            get { return _context.DecryptData(ResourceName).FirstOrDefault(); } 
        }

        public string DecryptedUrl
        {
            get { return _context.DecryptData(Url).FirstOrDefault(); }
        }
    }
}