using LinqKit;
using Microsoft.EntityFrameworkCore.Internal;
using RB.DAL.Common;
using RB_DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace RB.MVC.Models
{
    public class CategoryCheck
    {
        public int CategoryId { get; set; }     
        public string CategoryName { get; set; }
        public bool IsCheck { get; set; }
    }
    public class SubCategoryCheck
    {
        public int SubcategoryId { get; set; }       
        public string SubcategoryName { get; set; }
        public bool IsCheck { get; set; }
    }
    public class ViewModelCompanyFind
    {
        IGenericRepository<Categories, int> categories;
        IGenericRepository<Subcategories, int> subcategories;
        IGenericRepository<CompaniesCategories, Guid> compcat;//категория-кампания
        IGenericRepository<CompaniesSubcategories, Guid> compSubcat;
        IGenericRepository<Companies, Guid> companies;
        public string CompanyName { get; set; }
        public List<CategoryCheck> CategorySelects { get; set; }
        public List<SubCategoryCheck> SubCategorySelects { get; set; }
        public ViewModelCompanyFind() { }
        public ViewModelCompanyFind(IGenericRepository<Categories, int> categories, IGenericRepository<Subcategories, int> subcategories,
            IGenericRepository<CompaniesCategories, Guid> compcat, IGenericRepository<CompaniesSubcategories, Guid> compSubcat, IGenericRepository<Companies, Guid> companies)
        {
            this.companies = companies;
            this.categories = categories;
            this.subcategories = subcategories;
            this.compcat = compcat;
            this.compSubcat = compSubcat;
            var nn = compcat.GetAll();

            SubCategorySelects = subcategories.GetAll()
                .Select(c => new SubCategoryCheck
                { SubcategoryId = c.SubcategoryId, SubcategoryName = c.SubcategoryName }).ToList();
            CategorySelects = categories.GetAll()
                .Select(c => new CategoryCheck
                { CategoryId = c.CategoryId, CategoryName = c.CategoryName }).ToList();
        }
        public Expression<Func<Companies, bool>> Predicate()
        {
            var predicate = PredicateBuilder.New<Companies>(true);
            var predicateAllData = PredicateBuilder.New<Companies>(true);

            if (!string.IsNullOrEmpty(CompanyName)) {
                //  predicate = predicate.And(g => g.CompanyName.Contains(CompanyName));
                var a = predicateAllData
                     .And(g => g.Emails.Any(c => c.Email.Contains(CompanyName)) || g.CompanyName.Contains(CompanyName)
                     || g.Director.Contains(CompanyName) || g.Address.City.CityName.Contains(CompanyName)
                     || g.Address.Street.StreetName.Contains(CompanyName));
                    //.And(g => g.CompanyName.Contains(CompanyName))
                    //.And(g => g.Address.City.CityName.Contains(CompanyName))
                    //.And(g => g.Emails.Any(c => c.Email.Contains(CompanyName)));
                predicate = predicate.And(predicateAllData);
            }
            //  predicate = predicate.And(g => g.Address..Contains(CompanyName));
            if (CategorySelects.Select(c => c.IsCheck).Count() > 0)
            {
                var predicateCategory = PredicateBuilder.New<Companies>(true);
                foreach (var item in CategorySelects)
                {
                    if (item.IsCheck)
                    {
                        var aerg = predicateCategory
                            .Or(c => c.CompaniesCategories.Any(c => c.CategoryId == item.CategoryId));
                    }
                } 
                    predicate = predicate.And(predicateCategory);
            }
            if (SubCategorySelects.Select(c => c.IsCheck).Count() > 0)
            {
                var predicateSubCategory = PredicateBuilder.New<Companies>(true);
                foreach (var item in SubCategorySelects)
                {
                    if (item.IsCheck)
                    {
                        var aerg = predicateSubCategory
                            .Or(c => c.CompaniesSubcategories.Any(c => c.SubcategoryId == item.SubcategoryId));
                    }
                }
               predicate = predicate.And(predicateSubCategory);
            }       
            return predicate;
        }
    }
}
