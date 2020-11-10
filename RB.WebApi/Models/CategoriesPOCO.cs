using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RB.WebApi.Models
{
    public class CategoriesPOCO
    {
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public ICollection<CompaniesCategoriesPOCO> CompaniesCategories { get; set; }
    }
}
