using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;

namespace RB.WebApi.Adapters
{
    public class AdapterCompaniesSubcategories_To_CompaniesSubcategoriesPOCO
    {
        IGenericRepository<CompaniesSubcategories, Guid> companiesSubcategories;
        AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO;
        AdapterSubcategories_To_SubcategoriesPOCO adapterSubcategories_To_SubcategoriesPOCO;
        public AdapterCompaniesSubcategories_To_CompaniesSubcategoriesPOCO(IGenericRepository<CompaniesSubcategories, Guid> companiesSubcategories, AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO, AdapterSubcategories_To_SubcategoriesPOCO adapterSubcategories_To_SubcategoriesPOCO)
        {
            this.companiesSubcategories = companiesSubcategories;
            this.adapterCompanies_To_CompaniesPOCO = adapterCompanies_To_CompaniesPOCO;
            this.adapterSubcategories_To_SubcategoriesPOCO = adapterSubcategories_To_SubcategoriesPOCO;
        }
        public CompaniesSubcategoriesPOCO GetCompaniesSubcategoriesPOCO(CompaniesSubcategories companiesSubcategories)
        {
            CompaniesSubcategoriesPOCO companiesSubcategoriesPOCO = new CompaniesSubcategoriesPOCO()
            {
                CompanyId = companiesSubcategories.CompanyId,
                CompanySubcategoryId = companiesSubcategories.CompanySubcategoryId,
                Subcategory = adapterSubcategories_To_SubcategoriesPOCO.GetSubcategoriesPOCO(companiesSubcategories.Subcategory),
                SubcategoryId = companiesSubcategories.SubcategoryId
            };
            return companiesSubcategoriesPOCO;
        }
    }
}
