using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB_DAL.Models
{
    public partial class SocialNetNames
    {
        public SocialNetNames()
        {
            SocialNets = new HashSet<SocialNets>();
        }

        [Key]
        public int SocialNetNameId { get; set; }
        [StringLength(256)]
        public string SocialNetName { get; set; }

        [InverseProperty("SocialNetName")]
        public virtual ICollection<SocialNets> SocialNets { get; set; }
    }
}
