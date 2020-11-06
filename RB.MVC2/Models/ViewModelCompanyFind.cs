using LinqKit;
using RB.DAL.Common;
using RB.DAL.Models;
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
    //[Serializable]
    public class ViewModelCompanyFind
    {
        IGenericRepository<Categories, int> categories;
        IGenericRepository<Subcategories, int> subcategories;
        IGenericRepository<CompanyCategories, Guid> compcat;//категория-кампания
        IGenericRepository<CompanySubcategories, Guid> compSubcat;
        public string CompanyName { get; set; }
        public List<CategoryCheck> CategorySelects { get; set; }
        public List<SubCategoryCheck> SubCategorySelects { get; set; }
        public ViewModelCompanyFind() { }
        public ViewModelCompanyFind(IGenericRepository<Categories, int> categories, IGenericRepository<Subcategories, int> subcategories,
            IGenericRepository<CompanyCategories, Guid> compcat, IGenericRepository<CompanySubcategories, Guid> compSubcat)
        {
            this.categories = categories;
            this.subcategories = subcategories;
            this.compcat = compcat;
            this.compSubcat = compSubcat;
            SubCategorySelects = subcategories.GetAll()
                .Select(c => new SubCategoryCheck
                { SubcategoryId = c.SubcategoryId, SubcategoryName = c.SubcategoryName }).ToList();
            CategorySelects = categories.GetAll()
                .Select(c => new CategoryCheck
                { CategoryId = c.CategoryId, CategoryName = c.CategoryName }).ToList();
        }
        //!!![NonSerialized]
        public Expression<Func<Companies, bool>> Predicate()
        {

            var predicate = PredicateBuilder.New<Companies>(true);

            if (!string.IsNullOrEmpty(CompanyName))
                predicate = predicate.And(g => g.CompanyName.Contains(CompanyName));
            if (CategorySelects.Select(c => c.IsCheck).Count() > 0)
            {
                var predicateCategory = PredicateBuilder.New<Companies>(true);
                foreach (var item in CategorySelects)
                {          
                    if (item.IsCheck)
                    {
                        var aerg = predicateCategory
                            .Or(c =>
                                c.CompanyCategories.Contains(
                                    (compcat.FindBy(p =>
                                         p.CategoryId == item.CategoryId && p.CompanyId == c.CompanyId
                                    ))
                                    .ToList().FirstOrDefault())                   
                            );  
                    }
                }
                predicate = predicate.And(predicateCategory);
            }

            //var expr3 = expr1.And(expr2);
            //var queryBoth = myEntityManager.Customers.Where(expr3)

            if (SubCategorySelects.Select(c => c.IsCheck).Count() > 0)
            {
                var predicateSubCategory = PredicateBuilder.New<Companies>(true);
                foreach (var item in SubCategorySelects)
                {
                    if (item.IsCheck)
                    {
                        var aerg = predicateSubCategory
                            .Or(c =>
                                c.CompanySubcategories.Contains(
                                    (compSubcat.FindBy(p =>
                                         p.SubcategoryId == item.SubcategoryId && p.CompanyId == c.CompanyId
                                    ))
                                    .ToList().FirstOrDefault())
                            );
                    }
                }
                predicate = predicate.And(predicateSubCategory);
            }

            return predicate;

        }

    }
}
