using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RB.WebApi.Models
{
    public class SocialNetsPOCO
    {
        public Guid SocialNetId { get; set; }
        public DateTime? CreatedOn { get; set; }
        public Guid? CompanyId { get; set; }
        public string SocialNetUrl { get; set; }
        public int? SocialNetNameId { get; set; }
        public CompaniesPOCO Company { get; set; }
        public SocialNetNamesPOCO SocialNetName { get; set; }

    }
}
