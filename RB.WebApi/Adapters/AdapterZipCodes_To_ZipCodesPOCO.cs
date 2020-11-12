using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;
using System.Linq;

namespace RB.WebApi.Adapters
{
    public class AdapterZipCodes_To_ZipCodesPOCO
    {
        IGenericRepository<ZipCodes, Guid> zipCodes;
        IGenericRepository<Addresses, Guid> addresses;
        AdapterCities_To_CitiesPOCO adapterCities_To_CitiesPOCO;
        AdapterAddresses_To_AddressesPOCO adapterAddresses_To_AddressesPOCO;
        public AdapterZipCodes_To_ZipCodesPOCO(IGenericRepository<ZipCodes, Guid> zipCodes, IGenericRepository<Addresses, Guid> addresses, AdapterCities_To_CitiesPOCO adapterCities_To_CitiesPOCO, AdapterAddresses_To_AddressesPOCO adapterAddresses_To_AddressesPOCO)
        {
            this.zipCodes = zipCodes;
            this.addresses = addresses;
            this.adapterCities_To_CitiesPOCO = adapterCities_To_CitiesPOCO;
            this.adapterAddresses_To_AddressesPOCO = adapterAddresses_To_AddressesPOCO;
        }
        public ZipCodesPOCO GetZipCodesPOCO(ZipCodes zipCodes)
        {
            ZipCodesPOCO zipCodesPOCO = new ZipCodesPOCO()
            {
                City = adapterCities_To_CitiesPOCO.GetCitiesPOCO(zipCodes.City),
                CityId = zipCodes.CityId,
                ZipCode = zipCodes.ZipCode,
                ZipCodeId = zipCodes.ZipCodeId
            };
            //Addresses
            if (zipCodes.Addresses.Count() <= 0)
                zipCodes.Addresses = addresses.FindBy(a => a.ZipCodeId == zipCodes.ZipCodeId).ToList();
            foreach (var item in zipCodes.Addresses)
            {
                var addressesPOCO = adapterAddresses_To_AddressesPOCO.GetAddressesPOCO(item);
                zipCodesPOCO.Addresses.Add(addressesPOCO);
            }
            return zipCodesPOCO;
        }
    }
}
