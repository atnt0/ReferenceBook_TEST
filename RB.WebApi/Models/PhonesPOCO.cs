﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RB.WebApi.Models
{
    public class PhonesPOCO
    {
        public Guid PhoneId { get; set; }
        public DateTime? CreatedOn { get; set; }
        public Guid? CompanyId { get; set; }
        public string PhoneNumber { get; set; }
        public CompaniesPOCO Company { get; set; }

    }
}
