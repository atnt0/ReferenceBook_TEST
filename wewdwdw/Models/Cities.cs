using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB_DAL.Models
{
    public partial class Cities
    {
        public Cities()
        {
            Addresses = new HashSet<Addresses>();
            ZipCodes = new HashSet<ZipCodes>();
        }

        [Key]
        public Guid CityId { get; set; }
        [Required]
        [StringLength(150)]
        public string CityName { get; set; }

        [InverseProperty("City")]
        public virtual ICollection<Addresses> Addresses { get; set; }
        [InverseProperty("City")]
        public virtual ICollection<ZipCodes> ZipCodes { get; set; }
    }
}
