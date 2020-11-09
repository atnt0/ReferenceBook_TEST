using Microsoft.EntityFrameworkCore;
using RB.DAL.Common;
using RB_DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RB.DAL.Repositories
{
  public class CompanyCategoriesRepository : GenericRepository<CompaniesCategories, Guid>
    {
        public CompanyCategoriesRepository(DbContext context) : base(context)
        {
        }
        public override IQueryable<CompaniesCategories> GetAll()
        {
            return dbSet.Include(a => a.Category);
               
        }
    }
}
