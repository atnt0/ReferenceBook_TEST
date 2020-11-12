using System.Collections.Generic;

namespace RB.WebApi.Models
{
    public class SubcategoriesPOCO
    {
        public int SubcategoryId { get; set; }
        public string SubcategoryName { get; set; }
        public ICollection<CompaniesSubcategoriesPOCO> CompaniesSubcategories { get; set; }

    }
}
