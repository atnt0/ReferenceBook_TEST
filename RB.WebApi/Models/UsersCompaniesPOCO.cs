using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RB.WebApi.Models
{
    public class UsersCompaniesPOCO
    {
        public Guid UserCompanyId { get; set; }
        public Guid? UserId { get; set; }
        public Guid? CompanyId { get; set; }
        public CompaniesPOCO Company { get; set; }

    }
}
