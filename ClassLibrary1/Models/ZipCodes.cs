using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB_DAL.Models
{
    public partial class ZipCodes
    {
        public ZipCodes()
        {
            Addresses = new HashSet<Addresses>();
        }

        [Key]
        public Guid ZipCodeId { get; set; }
        public Guid? CityId { get; set; }
        [Required]
        [StringLength(15)]
        public string ZipCode { get; set; }

        [ForeignKey(nameof(CityId))]
        [InverseProperty(nameof(Cities.ZipCodes))]
        public virtual Cities City { get; set; }
        [InverseProperty("ZipCode")]
        public virtual ICollection<Addresses> Addresses { get; set; }
    }
}
