using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RB.WebApi.Models
{
    public class CompaniesSubcategoriesPOCO
    {
        public Guid CompanySubcategoryId { get; set; }
        public Guid? CompanyId { get; set; }
        public int? SubcategoryId { get; set; }
        public CompaniesPOCO Company { get; set; }
        public SubcategoriesPOCO Subcategory { get; set; }
    }
}
