using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BR.DAL.Models
{
    public partial class CompanySubcategories
    {
        [Key]
        [Column("CompanySubcategories")]
        public Guid CompanySubcategories1 { get; set; }
        public Guid CompanyId { get; set; }
        public int SubcategoryId { get; set; }

        [ForeignKey(nameof(CompanyId))]
        [InverseProperty(nameof(Companies.CompanySubcategories))]
        public virtual Companies Company { get; set; }
        [ForeignKey(nameof(SubcategoryId))]
        [InverseProperty(nameof(Subcategories.CompanySubcategories))]
        public virtual Subcategories Subcategory { get; set; }
    }
}
