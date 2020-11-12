using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;
using System.Linq;

namespace RB.WebApi.Adapters
{
    public class AdapterCities_To_CitiesPOCO
    {
        IGenericRepository<Cities, Guid> cities;
        IGenericRepository<Addresses, Guid> addresses;
        IGenericRepository<Streets, Guid> streets;
        IGenericRepository<ZipCodes, Guid> zipCodes;
        AdapterAddresses_To_AddressesPOCO adapterAddresses_To_AddressesPOCO;
        AdapterStreets_To_StreetsPOCO adapterStreets_To_StreetsPOCO;
        AdapterZipCodes_To_ZipCodesPOCO adapterZipCodes_To_ZipCodesPOCO;
        public AdapterCities_To_CitiesPOCO(IGenericRepository<Cities, Guid> cities, IGenericRepository<Addresses, Guid> addresses, IGenericRepository<Streets, Guid> streets, IGenericRepository<ZipCodes, Guid> zipCodes, AdapterAddresses_To_AddressesPOCO adapterAddresses_To_AddressesPOCO, AdapterStreets_To_StreetsPOCO adapterStreets_To_StreetsPOCO, AdapterZipCodes_To_ZipCodesPOCO adapterZipCodes_To_ZipCodesPOCO)
        {
            this.cities = cities;
            this.addresses = addresses;
            this.streets = streets;
            this.adapterAddresses_To_AddressesPOCO = adapterAddresses_To_AddressesPOCO;
            this.adapterStreets_To_StreetsPOCO = adapterStreets_To_StreetsPOCO;
            this.adapterZipCodes_To_ZipCodesPOCO = adapterZipCodes_To_ZipCodesPOCO;
            this.zipCodes = zipCodes;
        }

        public CitiesPOCO GetCitiesPOCO(Cities cities)
        {
            CitiesPOCO citiesPOCO = new CitiesPOCO()
            {
                CityId = cities.CityId,
                CityName = cities.CityName
            };
            //Addresses
            if (cities.Addresses.Count() <= 0)
                cities.Addresses = addresses.FindBy(a => a.CityId == cities.CityId).ToList();
            foreach (var item in cities.Addresses)
            {
                var addressesPOCO = adapterAddresses_To_AddressesPOCO.GetAddressesPOCO(item);
                citiesPOCO.Addresses.Add(addressesPOCO);
            }
            //Streets
            if (cities.Streets.Count() <= 0)
                cities.Streets = streets.FindBy(s => s.CityId == cities.CityId).ToList();
            foreach (var item in cities.Streets)
            {
                var streetsPOCO = adapterStreets_To_StreetsPOCO.GetStreetsPOCO(item);
                citiesPOCO.Streets.Add(streetsPOCO);
            }
            //ZipCodes
            if (cities.ZipCodes.Count() <= 0)
                cities.ZipCodes = zipCodes.FindBy(z => z.CityId == cities.CityId).ToList();
            foreach (var item in cities.ZipCodes)
            {
                var zipCodesPOCO = adapterZipCodes_To_ZipCodesPOCO.GetZipCodesPOCO(item);
                citiesPOCO.ZipCodes.Add(zipCodesPOCO);
            }
            return citiesPOCO;
        }
    }
}
