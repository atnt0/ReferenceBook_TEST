using System;
using System.Collections.Generic;

namespace RB.WebApi.Models
{
    public class StreetsPOCO
    {
        public Guid StreetId { get; set; }
        public Guid? CityId { get; set; }
        public string StreetName { get; set; }
        public CitiesPOCO City { get; set; }

    }
}
