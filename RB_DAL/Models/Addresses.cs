using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB.DAL.Models
{
    public partial class Addresses
    {
        public Addresses()
        {
            Companies = new HashSet<Companies>();
        }

        [Key]
        public Guid AddressId { get; set; }
        public Guid? ZipCodeId { get; set; }
        public Guid? CityId { get; set; }
        public Guid? StreetId { get; set; }
        [Required]
        [StringLength(12)]
        public string House { get; set; }
        [StringLength(12)]
        public string Block { get; set; }
        [StringLength(12)]
        public string Apartment { get; set; }
        [Column(TypeName = "decimal(22, 18)")]
        public decimal? Latitude { get; set; }
        [Column(TypeName = "decimal(22, 18)")]
        public decimal? Longitude { get; set; }

        [ForeignKey(nameof(CityId))]
        [InverseProperty(nameof(Cities.Addresses))]
        public virtual Cities City { get; set; }
        [ForeignKey(nameof(StreetId))]
        [InverseProperty(nameof(Streets.Addresses))]
        public virtual Streets Street { get; set; }
        [ForeignKey(nameof(ZipCodeId))]
        [InverseProperty(nameof(ZipCodes.Addresses))]
        public virtual ZipCodes ZipCode { get; set; }
        [InverseProperty("Address")]
        public virtual ICollection<Companies> Companies { get; set; }
    }
}
