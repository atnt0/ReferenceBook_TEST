using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB.DAL.Models
{
    public partial class CompanyCategories
    {
        [Key]
        [Column("CompanyCategories")]
        public Guid CompanyCategories1 { get; set; }
        public Guid CompanyId { get; set; }
        public int CategoryId { get; set; }

        [ForeignKey(nameof(CategoryId))]
        [InverseProperty(nameof(Categories.CompanyCategories))]
        public virtual Categories Category { get; set; }
        [ForeignKey(nameof(CompanyId))]
        [InverseProperty(nameof(Companies.CompanyCategories))]
        public virtual Companies Company { get; set; }
    }
}
