using System;

namespace RB.WebApi.Models
{
    public class LogosPOCO
    {
        public Guid PhotoId { get; set; }
        public PhotosPOCO Photo { get; set; }

    }
}
