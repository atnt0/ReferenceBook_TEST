using Microsoft.EntityFrameworkCore;
using RB.DAL.Common;
using RB.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RB.DAL.Repositories
{
    public class CompaniesRepository : GenericRepository<Companies, Guid>
    {
        public CompaniesRepository(DbContext context) : base(context)
        {
        }

        public override IQueryable<Companies> GetAll()
        {
            return dbSet.Include(a => a.CompaniesCategories)
                .ThenInclude(p => p.Category)
                .Include(p => p.CompaniesSubcategories)
                .ThenInclude(p => p.Subcategory)
                .Include(p => p.Emails)
                .Include(p => p.Phones)
                .Include(p => p.Photos)
                .Include(p => p.SocialNets)
                .Include(p => p.Address)
                .ThenInclude(p => p.City)
                .Include(p => p.Address)
                .ThenInclude(p => p.Street)
                .Include(p => p.ParentCompany);

        }
    }


}
