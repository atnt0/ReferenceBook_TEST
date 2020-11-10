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
        [Column(TypeName = "datetime")]
        public DateTime? CreatedOn { get; set; }
        public Guid? CompanyId { get; set; }
        [Required]
        [StringLength(100)]
        public string FileName { get; set; }

        [ForeignKey(nameof(CompanyId))]
        [InverseProperty(nameof(Companies.Photos))]
        public virtual Companies Company { get; set; }
        [InverseProperty("Photo")]
        public virtual Logos Logos { get; set; }
    }
}
