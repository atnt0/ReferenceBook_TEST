using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB.DAL.Models
{
    public partial class ZipCodes
    {
        public ZipCodes()
        {
            Addresses = new HashSet<Addresses>();
        }

        [Key]
        public int ZipCodeId { get; set; }
        public Guid CityId { get; set; }
        public int ZipCode { get; set; }

        [ForeignKey(nameof(CityId))]
        [InverseProperty(nameof(Cities.ZipCodes))]
        public virtual Cities City { get; set; }
        [InverseProperty("ZipCodeNavigation")]
        public virtual ICollection<Addresses> Addresses { get; set; }
    }
}
