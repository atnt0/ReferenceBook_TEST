using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB.DAL.Models
{
    public partial class CompaniesCategories
    {
        [Key]
        public Guid CompanyCategoryId { get; set; }
        public Guid? CompanyId { get; set; }
        public int? CategoryId { get; set; }

        [ForeignKey(nameof(CategoryId))]
        [InverseProperty(nameof(Categories.CompaniesCategories))]
        public virtual Categories Category { get; set; }
        [ForeignKey(nameof(CompanyId))]
        [InverseProperty(nameof(Companies.CompaniesCategories))]
        public virtual Companies Company { get; set; }
    }
}
