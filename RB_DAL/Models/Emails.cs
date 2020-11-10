using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB.DAL.Models
{
    public partial class Emails
    {
        [Key]
        public Guid EmailId { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? CreatedOn { get; set; }
        public Guid? CompanyId { get; set; }
        [Required]
        [StringLength(256)]
        public string Email { get; set; }

        [ForeignKey(nameof(CompanyId))]
        [InverseProperty(nameof(Companies.Emails))]
        public virtual Companies Company { get; set; }
    }
}
