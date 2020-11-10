using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB.DAL.Models
{
    public partial class CompaniesSubcategories
    {
        [Key]
        public Guid CompanySubcategoryId { get; set; }
        public Guid? CompanyId { get; set; }
        public int? SubcategoryId { get; set; }

        [ForeignKey(nameof(CompanyId))]
        [InverseProperty(nameof(Companies.CompaniesSubcategories))]
        public virtual Companies Company { get; set; }
        [ForeignKey(nameof(SubcategoryId))]
        [InverseProperty(nameof(Subcategories.CompaniesSubcategories))]
        public virtual Subcategories Subcategory { get; set; }
    }
}
