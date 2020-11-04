using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BR.DAL.Models
{
    public partial class Categories
    {
        public Categories()
        {
            CompanyCategories = new HashSet<CompanyCategories>();
        }

        [Key]
        public int CategoryId { get; set; }
        [Required]
        [StringLength(256)]
        public string CategoryName { get; set; }

        [InverseProperty("Category")]
        public virtual ICollection<CompanyCategories> CompanyCategories { get; set; }
    }
}
