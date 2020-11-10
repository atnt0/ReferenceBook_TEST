using Microsoft.EntityFrameworkCore;
using RB.DAL.Common;
using RB.DAL.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace RB.DAL.Repositories
{
    public class SocialNetNamesRepository : GenericRepository<SocialNetNames, int>
    {
        public SocialNetNamesRepository(DbContext context) : base(context)
        {
        }
    }
}
