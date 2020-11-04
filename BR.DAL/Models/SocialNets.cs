using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BR.DAL.Models
{
    public partial class SocialNets
    {
        [Key]
        public Guid SocialNetId { get; set; }
        public Guid CompanyId { get; set; }
        [StringLength(2000)]
        public string SocialNetName { get; set; }

        [ForeignKey(nameof(CompanyId))]
        [InverseProperty(nameof(Companies.SocialNets))]
        public virtual Companies Company { get; set; }
    }
}
