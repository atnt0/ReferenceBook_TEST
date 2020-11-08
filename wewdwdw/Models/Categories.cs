using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB_DAL.Models
{
    public partial class Categories
    {
        public Categories()
        {
            CompaniesCategories = new HashSet<CompaniesCategories>();
        }

        [Key]
        public int CategoryId { get; set; }
        [Required]
        [StringLength(256)]
        public string CategoryName { get; set; }

        [InverseProperty("Category")]
        public virtual ICollection<CompaniesCategories> CompaniesCategories { get; set; }
    }
}
