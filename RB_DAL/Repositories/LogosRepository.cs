using Microsoft.EntityFrameworkCore;
using RB.DAL.Common;
using RB.DAL.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace RB.DAL.Repositories
{
   public class LogosRepository : GenericRepository<Logos, Guid>
    {
        public LogosRepository(DbContext context) : base(context)
        {
        }
    }
}
