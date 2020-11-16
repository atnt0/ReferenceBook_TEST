using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;
using System.Linq;

namespace RB.WebApi.Adapters
{
    public class AdapterStreets_To_StreetsPOCO
    {
        IGenericRepository<Streets, Guid> streets;
        IGenericRepository<Addresses, Guid> addresses;
        AdapterCities_To_CitiesPOCO adapterCities_To_CitiesPOCO;
        AdapterAddresses_To_AddressesPOCO adapterAddresses_To_AddressesPOCO;
        public AdapterStreets_To_StreetsPOCO(IGenericRepository<Streets, Guid> streets, IGenericRepository<Addresses, Guid> addresses, AdapterCities_To_CitiesPOCO adapterCities_To_CitiesPOCO, AdapterAddresses_To_AddressesPOCO adapterAddresses_To_AddressesPOCO)
        {
            this.streets = streets;
            this.addresses = addresses;
            this.adapterCities_To_CitiesPOCO = adapterCities_To_CitiesPOCO;
            this.adapterAddresses_To_AddressesPOCO = adapterAddresses_To_AddressesPOCO;
        }

        public StreetsPOCO GetStreetsPOCO(Streets streets)
        {
            StreetsPOCO streetsPOCO = new StreetsPOCO()
            {
                City = adapterCities_To_CitiesPOCO.GetCitiesPOCO(streets.City),
                CityId = streets.CityId,
                StreetId = streets.StreetId,
                StreetName = streets.StreetName
            };
            return streetsPOCO;
        }
    }
}
