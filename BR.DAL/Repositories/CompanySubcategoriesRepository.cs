using Microsoft.EntityFrameworkCore;
using RB.DAL.Common;
using RB.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RB.DAL.Repositories
{
  public class CompanySubcategoriesRepository : GenericRepository<CompanySubcategories, Guid>
    {
        public CompanySubcategoriesRepository(DbContext context) : base(context)
        {
        }
        public override IQueryable<CompanySubcategories> GetAll()
        {
            return dbSet.Include(a => a.Subcategory);

        }
    }
}
