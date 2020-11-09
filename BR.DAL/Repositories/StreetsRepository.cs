using Microsoft.EntityFrameworkCore;
using RB.DAL.Common;
using RB_DAL.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace RB.DAL.Repositories
{
    class StreetsRepository : GenericRepository<Streets, Guid>
    {
        public StreetsRepository(DbContext context) : base(context)
        {
        }
    }
}
