using RB.DAL.Common;
using RB.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RB.MVC.Models
{
    public class AddressPoco
    {
       
        IGenericRepository<Addresses, Guid> adresses;
        IGenericRepository<Cities, Guid> cities;
        IGenericRepository<Streets, Guid> streets;
        IGenericRepository<ZipCodes, Guid> zipCodes;
        public Guid AddressId { get; set; }
        public string House { get; set; }

        public string Block { get; set; }

        public string Apartment { get; set; }

        public decimal? Latitude { get; set; }

        public decimal? Longitude { get; set; }

        public Cities City { get; set; }

        public Streets Street { get; set; }

        public ZipCodes ZipCode { get; set; }

        public AddressPoco(IGenericRepository<Addresses, Guid> adresses,
            IGenericRepository<Cities, Guid> cities, IGenericRepository<Streets, Guid> streets,
           IGenericRepository<ZipCodes, Guid> zipCodes, Guid AddressId)
        {         
            this.adresses = adresses;
            this.cities = cities;
           this.streets = streets;
           this.zipCodes = zipCodes;
            this.AddressId = AddressId;
            InitializeCompany();
        }

        private void InitializeCompany()
        {
            Addresses adress = adresses.Get(AddressId);
            House = adress.House;
            Block = adress.Block;
            Apartment = adress.Apartment;
            Latitude = adress.Latitude;
            Longitude = adress.Longitude;

            City = cities.FindBy(p=>p.CityId == adress.CityId).FirstOrDefault();
            Street = streets.FindBy(p => p.StreetId == adress.StreetId).FirstOrDefault();
            ZipCode = zipCodes.FindBy(p => p.ZipCodeId == adress.ZipCodeId).FirstOrDefault();
                      
        }
    }
}
