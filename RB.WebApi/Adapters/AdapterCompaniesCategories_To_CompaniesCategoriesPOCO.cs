using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;

namespace RB.WebApi.Adapters
{
    public class AdapterCompaniesCategories_To_CompaniesCategoriesPOCO
    {
        IGenericRepository<CompaniesCategories, Guid> companiesCategories;
        AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO;
        AdapterCategories_To_CategoriesPOCO adapterCategories_To_CategoriesPOCO;
        public AdapterCompaniesCategories_To_CompaniesCategoriesPOCO(IGenericRepository<CompaniesCategories, Guid> companiesCategories, AdapterCategories_To_CategoriesPOCO adapterCategories_To_CategoriesPOCO, AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO)
        {
            this.companiesCategories = companiesCategories;
            this.adapterCategories_To_CategoriesPOCO = adapterCategories_To_CategoriesPOCO;
            this.adapterCompanies_To_CompaniesPOCO = adapterCompanies_To_CompaniesPOCO;
        }

        public CompaniesCategoriesPOCO GetCompaniesCategoriesPOCO(CompaniesCategories companiesCategories)
        {
            CompaniesCategoriesPOCO companiesCategoriesPOCO = new CompaniesCategoriesPOCO()
            {
                CategoryId = companiesCategories.CategoryId,
                CompanyCategoryId = companiesCategories.CompanyCategoryId,
                CompanyId = companiesCategories.CompanyId
            };
            return companiesCategoriesPOCO;
        }
    }
}
