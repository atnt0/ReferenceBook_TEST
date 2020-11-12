using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;
using System.Linq;

namespace RB.WebApi.Adapters
{
    public class AdapterCategories_To_CategoriesPOCO
    {
        IGenericRepository<Categories, int> categories;
        IGenericRepository<CompaniesCategories, Guid> companiesCategories;
        AdapterCompaniesCategories_To_CompaniesCategoriesPOCO adapterCompaniesCategories_To_CompaniesCategoriesPOCO;
        public AdapterCategories_To_CategoriesPOCO(IGenericRepository<Categories, int> categories, IGenericRepository<CompaniesCategories, Guid> companiesCategories, AdapterCompaniesCategories_To_CompaniesCategoriesPOCO adapterCompaniesCategories_To_CompaniesCategoriesPOCO)
        {
            this.categories = categories;
            this.companiesCategories = companiesCategories;
            this.adapterCompaniesCategories_To_CompaniesCategoriesPOCO = adapterCompaniesCategories_To_CompaniesCategoriesPOCO;
        }

        public CategoriesPOCO GetCategoriesPOCO(Categories categories)
        {
            CategoriesPOCO categoriesPOCO = new CategoriesPOCO()
            {
                CategoryId = categories.CategoryId,
                CategoryName = categories.CategoryName,
            };
            //CompaniesCategories
            if (categories.CompaniesCategories.Count() <= 0)
                categories.CompaniesCategories = companiesCategories.FindBy(c => c.CategoryId == categories.CategoryId).ToList();
            foreach (var item in categories.CompaniesCategories)
            {
                var companiesCategoriesPOCO = adapterCompaniesCategories_To_CompaniesCategoriesPOCO.GetCompaniesCategoriesPOCO(item);
                categoriesPOCO.CompaniesCategories.Add(companiesCategoriesPOCO);
            }
            return categoriesPOCO;
        }
    }
}
