using Microsoft.EntityFrameworkCore;
using RB.DAL.Common;
using RB_DAL.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace RB.DAL.Repositories
{
   public class DayWeekTimeTablesRepository : GenericRepository<DayWeekTimeTables, Guid>
    {
        public DayWeekTimeTablesRepository(DbContext context) : base(context)
        {
        }

        
    }
}
