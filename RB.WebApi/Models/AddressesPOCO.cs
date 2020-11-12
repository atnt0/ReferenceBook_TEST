using System;
using System.Collections.Generic;

namespace RB.WebApi.Models
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
        public CitiesPOCO City { get; set; }
        public StreetsPOCO Street { get; set; }
        public ZipCodesPOCO ZipCode { get; set; }
        public ICollection<CompaniesPOCO> Companies { get; set; }
    }
}
