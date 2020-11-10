using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB.DAL.Models
{
    public partial class SocialNets
    {
        [Key]
        public Guid SocialNetId { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? CreatedOn { get; set; }
        public Guid? CompanyId { get; set; }
        [Column("SocialNetURL")]
        [StringLength(500)]
        public string SocialNetUrl { get; set; }
        public int? SocialNetNameId { get; set; }

        [ForeignKey(nameof(CompanyId))]
        [InverseProperty(nameof(Companies.SocialNets))]
        public virtual Companies Company { get; set; }
        [ForeignKey(nameof(SocialNetNameId))]
        [InverseProperty(nameof(SocialNetNames.SocialNets))]
        public virtual SocialNetNames SocialNetName { get; set; }
    }
}
