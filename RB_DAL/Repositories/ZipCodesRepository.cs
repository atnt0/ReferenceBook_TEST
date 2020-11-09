using Microsoft.EntityFrameworkCore;
using RB.DAL.Common;
using RB.DAL.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace RB.DAL.Repositories
{
    class ZipCodesRepository : GenericRepository<ZipCodes, Guid>
    {
        public ZipCodesRepository(DbContext context) : base(context)
        {
        }

    }
}
