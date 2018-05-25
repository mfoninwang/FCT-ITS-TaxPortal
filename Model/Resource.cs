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
    
    public partial class Resource
    {
        public Resource()
        {
            this.Resources1 = new HashSet<Resource>();
            this.RoleResources = new HashSet<RoleResource>();
        }
    
        public int ResourceId { get; set; }
        public byte[] ResourceName { get; set; }
        public string ResourceType { get; set; }
        public byte[] Url { get; set; }
        public Nullable<int> ParentId { get; set; }
        public string CssFont { get; set; }
    
        public virtual ICollection<Resource> Resources1 { get; set; }
        public virtual Resource Parent { get; set; }
        public virtual ICollection<RoleResource> RoleResources { get; set; }
    }
}
