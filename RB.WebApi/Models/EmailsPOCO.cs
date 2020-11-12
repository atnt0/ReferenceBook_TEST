using System;

namespace RB.WebApi.Models
{
    public class EmailsPOCO
    {
        public Guid EmailId { get; set; }
        public DateTime? CreatedOn { get; set; }
        public Guid? CompanyId { get; set; }
        public string Email { get; set; }
        public CompaniesPOCO Company { get; set; }

    }
}
