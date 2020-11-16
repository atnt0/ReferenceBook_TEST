using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RB.WEBAPI1.Models
{
    public class AddressesPOCO
    {
        public Guid AddressId { get; set; }
        public Guid? ZipCodeId { get; set; }
        public Guid? CityId { get; set; }
        public Guid? StreetId { get; set; }
        public string House { get; set; }
        public string Block { get; set; }
        public string Apartment { get; set; }
        public decimal? Latitude { get; set; }
        public decimal? Longitude { get; set; }
    }
}
