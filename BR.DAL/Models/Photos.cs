using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB.DAL.Models
{
    public partial class Photos
    {
        [Key]
        public Guid PhotoId { get; set; }
        public Guid CompanyId { get; set; }
        [Required]
        [StringLength(100)]
        public string Photo { get; set; }

        [ForeignKey(nameof(CompanyId))]
        [InverseProperty(nameof(Companies.Photos))]
        public virtual Companies Company { get; set; }
    }
}
