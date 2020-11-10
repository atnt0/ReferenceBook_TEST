using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RB.WebApi.Models
{
    public class CitiesPOCO
    {
        public Guid CityId { get; set; }
        public string CityName { get; set; }
        public ICollection<AddressesPOCO> Addresses { get; set; }
        public ICollection<StreetsPOCO> Streets { get; set; }
        public ICollection<ZipCodesPOCO> ZipCodes { get; set; }
    }
}
