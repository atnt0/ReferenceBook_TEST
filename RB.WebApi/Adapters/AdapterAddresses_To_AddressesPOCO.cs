using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;
using System.Linq;

namespace RB.WebApi.Adapters
{
    public class AdapterAddresses_To_AddressesPOCO
    {
        IGenericRepository<Addresses, Guid> addresses;
        IGenericRepository<Companies, Guid> companies;
        AdapterCities_To_CitiesPOCO adapterCities_To_CitiesPOCO;
        AdapterStreets_To_StreetsPOCO adapterStreets_To_StreetsPOCO;
        AdapterZipCodes_To_ZipCodesPOCO adapterZipCodes_To_ZipCodesPOCO;
        AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO;
        public AdapterAddresses_To_AddressesPOCO(IGenericRepository<Addresses, Guid> addresses, AdapterCities_To_CitiesPOCO adapterCities_To_CitiesPOCO, AdapterStreets_To_StreetsPOCO adapterStreets_To_StreetsPOCO, AdapterZipCodes_To_ZipCodesPOCO adapterZipCodes_To_ZipCodesPOCO, IGenericRepository<Companies, Guid> companies, AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO)
        {
            this.addresses = addresses;
            this.companies = companies;
            this.adapterCities_To_CitiesPOCO = adapterCities_To_CitiesPOCO;
            this.adapterStreets_To_StreetsPOCO = adapterStreets_To_StreetsPOCO;
            this.adapterZipCodes_To_ZipCodesPOCO = adapterZipCodes_To_ZipCodesPOCO;
            this.adapterCompanies_To_CompaniesPOCO = adapterCompanies_To_CompaniesPOCO;
        }
        public AddressesPOCO GetAddressesPOCO(Addresses addresses)
        {
            AddressesPOCO addressesPOCO = new AddressesPOCO()
            {
                AddressId = addresses.AddressId,
                Apartment = addresses.Apartment,
                Block = addresses.Block,
                City = adapterCities_To_CitiesPOCO.GetCitiesPOCO(addresses.City),
                CityId = addresses.CityId,
                House = addresses.House,
                Latitude = addresses.Latitude,
                Longitude = addresses.Longitude,
                Street = adapterStreets_To_StreetsPOCO.GetStreetsPOCO(addresses.Street),
                StreetId = addresses.StreetId,
                ZipCode = adapterZipCodes_To_ZipCodesPOCO.GetZipCodesPOCO(addresses.ZipCode),
                ZipCodeId = addresses.ZipCodeId
            };
            return addressesPOCO;
        }
    }
}
