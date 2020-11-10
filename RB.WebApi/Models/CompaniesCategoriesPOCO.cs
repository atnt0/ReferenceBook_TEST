using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RB.WebApi.Models
{
    public class CompaniesCategoriesPOCO
    {
        public Guid CompanyCategoryId { get; set; }
        public Guid? CompanyId { get; set; }
        public int? CategoryId { get; set; }
        public CategoriesPOCO Category { get; set; }
        public CompaniesPOCO Company { get; set; }
    }
}
