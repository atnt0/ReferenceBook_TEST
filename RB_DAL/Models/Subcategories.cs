using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB.DAL.Models
{
    public partial class Subcategories
    {
        public Subcategories()
        {
            CompaniesSubcategories = new HashSet<CompaniesSubcategories>();
        }

        [Key]
        public int SubcategoryId { get; set; }
        [Required]
        [StringLength(256)]
        public string SubcategoryName { get; set; }

        [InverseProperty("Subcategory")]
        public virtual ICollection<CompaniesSubcategories> CompaniesSubcategories { get; set; }
    }
}
