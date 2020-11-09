using Microsoft.EntityFrameworkCore;
using RB.DAL.Common;
using RB_DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RB.DAL.Repositories
{
    class AdressesRepository : GenericRepository<Addresses, Guid>
    {
        public AdressesRepository(DbContext context) : base(context)
        {
        }

        public override IQueryable<Addresses> GetAll()
        {
            return dbSet.Include(a => a.Street)
                .Include(a => a.City);

        }
    }
}
