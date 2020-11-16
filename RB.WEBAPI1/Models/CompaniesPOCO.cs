using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RB.WEBAPI1.Models
{
    public class CompaniesPOCO
    {
        public Guid CompanyId { get; set; }
        public DateTime? CreatedOn { get; set; }
        public string CompanyName { get; set; }
        public Guid? ParentCompanyId { get; set; }
        public string Director { get; set; }
        public string DescriptionShort { get; set; }
        public string DescriptionFull { get; set; }
        public string WebSite { get; set; }
        public Guid? AddressId { get; set; }
        public int Popularity { get; set; }
        public AddressesPOCO Address { get; set; }
        public CompaniesPOCO ParentCompany { get; set; }
        public ICollection<CompaniesCategoriesPOCO> CompaniesCategories { get; set; }
        public ICollection<CompaniesSubcategoriesPOCO> CompaniesSubcategories { get; set; }
    }
}
