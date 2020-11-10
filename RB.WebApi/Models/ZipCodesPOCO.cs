using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RB.WebApi.Models
{
    public class ZipCodesPOCO
    {
        public Guid ZipCodeId { get; set; }
        public Guid? CityId { get; set; }
        public string ZipCode { get; set; }
        public CitiesPOCO City { get; set; }
        public ICollection<AddressesPOCO> Addresses { get; set; }

    }
}
