using Microsoft.EntityFrameworkCore;
using RB.DAL.Common;
using RB.DAL.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace RB.DAL.Repositories
{
    public class UserCompaniesRepository : GenericRepository<UserCompanies, Guid>
    {
        public UserCompaniesRepository(DbContext context) : base(context)
        {
        }
    }
}
