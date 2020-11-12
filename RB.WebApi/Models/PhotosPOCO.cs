using System;

namespace RB.WebApi.Models
{
    public class PhotosPOCO
    {
        public Guid PhotoId { get; set; }
        public DateTime? CreatedOn { get; set; }
        public Guid? CompanyId { get; set; }
        public string FileName { get; set; }
        public CompaniesPOCO Company { get; set; }
        public LogosPOCO Logos { get; set; }

    }
}
