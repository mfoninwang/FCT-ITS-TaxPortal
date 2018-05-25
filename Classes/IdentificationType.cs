using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TAAPs.Model
{
    public static class IdentificationType
    {
        public static Hashtable IdentificationTypes
        {
            get
            {
                Hashtable ht = new Hashtable
                {
                    { "Passport", "Passport" },
                    { "National Identity", "National Identity" },
                    { "Drivers License", "Drivers License" },
                    { "Others", "Others" }
                };
                return ht;
            }
        }
    }
}