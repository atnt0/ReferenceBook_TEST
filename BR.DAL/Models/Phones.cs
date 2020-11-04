using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BR.DAL.Models
{
    public partial class Phones
    {
        [Key]
        public Guid PhonesId { get; set; }
        public Guid CompanyId { get; set; }
        [Required]
        [StringLength(13)]
        public string PhoneNumber { get; set; }

        [ForeignKey(nameof(CompanyId))]
        [InverseProperty(nameof(Companies.Phones))]
        public virtual Companies Company { get; set; }
    }
}
