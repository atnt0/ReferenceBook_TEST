using Microsoft.EntityFrameworkCore;
using RB.DAL.Common;
using RB.DAL.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace RB.DAL.Repositories
{
    class CitiesRepository : GenericRepository<Cities, Guid>
    {
        public CitiesRepository(DbContext context) : base(context)
        {
        }

       
    }
}
