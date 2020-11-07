using Microsoft.EntityFrameworkCore;
using RB.DAL.Common;
using RB_DAL.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace RB.DAL.Repositories
{
    public class EmailsRepository : GenericRepository<Emails, Guid>
    {
        public EmailsRepository(DbContext context) : base(context)
        {
        }
    }
}
