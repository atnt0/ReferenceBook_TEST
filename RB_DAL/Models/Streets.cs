using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB.DAL.Models
{
    public partial class Streets
    {
        public Streets()
        {
            Addresses = new HashSet<Addresses>();
        }

        [Key]
        public Guid StreetId { get; set; }
        public Guid? CityId { get; set; }
        [Required]
        [StringLength(150)]
        public string StreetName { get; set; }

        [ForeignKey(nameof(CityId))]
        [InverseProperty(nameof(Cities.Streets))]
        public virtual Cities City { get; set; }
        [InverseProperty("Street")]
        public virtual ICollection<Addresses> Addresses { get; set; }
    }
}
