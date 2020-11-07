using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB_DAL.Models
{
    public partial class Streets
    {
        public Streets()
        {
            Addresses = new HashSet<Addresses>();
        }

        [Key]
        public Guid StreetId { get; set; }
        [Required]
        [StringLength(150)]
        public string StreetName { get; set; }

        [InverseProperty("Street")]
        public virtual ICollection<Addresses> Addresses { get; set; }
    }
}
