using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;
using System.Linq;

namespace RB.WebApi.Adapters
{
    public class AdapterSubcategories_To_SubcategoriesPOCO
    {
        IGenericRepository<Subcategories, int> subcategories;
        IGenericRepository<CompaniesSubcategories, Guid> companiesSubcategories;
        AdapterCompaniesSubcategories_To_CompaniesSubcategoriesPOCO adapterCompaniesSubcategories_To_CompaniesSubcategoriesPOCO;
        public AdapterSubcategories_To_SubcategoriesPOCO(IGenericRepository<Subcategories, int> subcategories, IGenericRepository<CompaniesSubcategories, Guid> companiesSubcategories, AdapterCompaniesSubcategories_To_CompaniesSubcategoriesPOCO adapterCompaniesSubcategories_To_CompaniesSubcategoriesPOCO)
        {
            this.subcategories = subcategories;
            this.companiesSubcategories = companiesSubcategories;
            this.adapterCompaniesSubcategories_To_CompaniesSubcategoriesPOCO = adapterCompaniesSubcategories_To_CompaniesSubcategoriesPOCO;
        }
        public SubcategoriesPOCO GetSubcategoriesPOCO(Subcategories subcategories)
        {
            SubcategoriesPOCO subcategoriesPOCO = new SubcategoriesPOCO()
            {
                SubcategoryId = subcategories.SubcategoryId,
                SubcategoryName = subcategories.SubcategoryName
            };
            //CompaniesSubcategories
            if (subcategories.CompaniesSubcategories.Count() <= 0)
                subcategories.CompaniesSubcategories = companiesSubcategories.FindBy(c => c.SubcategoryId == subcategories.SubcategoryId).ToList();
            foreach (var item in subcategories.CompaniesSubcategories)
            {
                var companiesSubcategoriesPOCO = adapterCompaniesSubcategories_To_CompaniesSubcategoriesPOCO.GetCompaniesSubcategoriesPOCO(item);
                subcategoriesPOCO.CompaniesSubcategories.Add(companiesSubcategoriesPOCO);
            }
            return subcategoriesPOCO;
        }
    }
}
