using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BR.DAL.Models
{
    public partial class Subcategories
    {
        public Subcategories()
        {
            CompanySubcategories = new HashSet<CompanySubcategories>();
        }

        [Key]
        public int SubcategoryId { get; set; }
        [Required]
        [StringLength(256)]
        public string SubcategoryName { get; set; }

        [InverseProperty("Subcategory")]
        public virtual ICollection<CompanySubcategories> CompanySubcategories { get; set; }
    }
}
