using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RB.WebApi.Models
{
    public class LogosPOCO
    {
        public Guid PhotoId { get; set; }
        public PhotosPOCO Photo { get; set; }

    }
}
