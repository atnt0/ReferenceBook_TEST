using Microsoft.EntityFrameworkCore;
using RB.DAL.Common;
using RB_DAL.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace RB_DAL.Repositories
{
    public class SocialNetNamesRepository : GenericRepository<SocialNetNames, int>
    {
        public SocialNetNamesRepository(DbContext context) : base(context)
        {
        }
    }
}
