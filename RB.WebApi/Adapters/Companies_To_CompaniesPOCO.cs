using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace RB.WebApi.Adapters
{
    public class Companies_To_CompaniesPOCO
    {
        IGenericRepository<Addresses, Guid> addresses;
        IGenericRepository<Categories, int> categories;
        IGenericRepository<Cities, Guid> cities;
        IGenericRepository<Companies, Guid> companies;
        IGenericRepository<CompaniesCategories, Guid> companiesCategories;
        IGenericRepository<CompaniesSubcategories, Guid> companiesSubcategories;
        IGenericRepository<DayWeekTimeTables, Guid> dayweektimeTables;
        IGenericRepository<Emails, Guid> emails;
        IGenericRepository<Logos, Guid> logos;
        IGenericRepository<Phones, Guid> phones;
        IGenericRepository<Photos, Guid> photos;
        IGenericRepository<SocialNetNames, int> socialnetNames;
        IGenericRepository<SocialNets, Guid> socialNets;
        IGenericRepository<Streets, Guid> streets;
        IGenericRepository<Subcategories, int> subcategories;
        IGenericRepository<UsersCompanies, Guid> userCompanies;
        IGenericRepository<ZipCodes, Guid> zipCodes;
        public Companies_To_CompaniesPOCO(IGenericRepository<Addresses, Guid> addresses,IGenericRepository<Categories, int> categories,IGenericRepository<Cities, Guid> cities,
        IGenericRepository<Companies, Guid> companies,IGenericRepository<CompaniesCategories, Guid> companiesCategories, IGenericRepository<CompaniesSubcategories, Guid> companiesSubcategories,
        IGenericRepository<DayWeekTimeTables, Guid> dayweektimeTables,IGenericRepository<Emails, Guid> emails,IGenericRepository<Logos, Guid> logos,
        IGenericRepository<Phones, Guid> phones,IGenericRepository<Photos, Guid> photos,IGenericRepository<SocialNetNames, int> socialnetNames,IGenericRepository<SocialNets, Guid> socialNets,
        IGenericRepository<Streets, Guid> streets,IGenericRepository<Subcategories, int> subcategories,IGenericRepository<UsersCompanies, Guid> userCompanies,IGenericRepository<ZipCodes, Guid> zipCodes)
        {
            this.addresses = addresses;
            this.categories = categories;
            this.cities = cities;
            this.companies = companies;
            this.companiesCategories = companiesCategories;
            this.companiesSubcategories = companiesSubcategories;
            this.dayweektimeTables = dayweektimeTables;
            this.emails = emails;
            this.logos = logos;
            this.phones = phones;
            this.photos = photos;
            this.socialnetNames = socialnetNames;
            this.socialNets = socialNets;
            this.streets = streets;
            this.subcategories = subcategories;
            this.userCompanies = userCompanies;
            this.zipCodes = zipCodes;
        }

        public AddressesPOCO GetAddressesPOCO(Addresses addresses)
        {
            AddressesPOCO addressesPOCO = new AddressesPOCO()
            {
                AddressId = addresses.AddressId,
                Apartment = addresses.Apartment,
                Block = addresses.Block,
                City = new CitiesPOCO(),
                CityId = addresses.CityId,
                Companies = new List<CompaniesPOCO>(),
                House = addresses.House,
                Latitude = addresses.Latitude,
                Longitude = addresses.Longitude,
                Street = new StreetsPOCO(),
                StreetId = addresses.StreetId,
                ZipCode = new ZipCodesPOCO(),
                ZipCodeId = addresses.ZipCodeId
            };
            return addressesPOCO;
        }
        //public CategoriesPOCO GetCategoriesPOCO(Categories categories)
        //{
        //    CategoriesPOCO categoriesPOCO = new CategoriesPOCO()
        //    {
        //        CategoryId = categories.CategoryId,
        //        CategoryName = categories.CategoryName,
        //        CompaniesCategories = new List<CompaniesCategoriesPOCO>()
        //    };
        //    if (categories.CompaniesCategories.Count <= 0)
        //        categories.CompaniesCategories = companiesCategories.FindBy(c => c.CategoryId == categories.CategoryId).ToList();
        //    // Сделать list-ом
        //    foreach (var item in categories.CompaniesCategories)
        //    {
        //        var companiesCategories = GetCompaniesCategoriesPOCO(item);
        //        categoriesPOCO.CompaniesCategories.Add(companiesCategories);
        //    }
        //    return categoriesPOCO;
        //}

        public CitiesPOCO GetCitiesPOCO(Cities cities)
        {
            CitiesPOCO citiesPOCO = new CitiesPOCO()
            {
                Addresses = new List<AddressesPOCO>(),
                CityId = cities.CityId,
                CityName = cities.CityName,
                Streets = new List<StreetsPOCO>(),
                ZipCodes = new List<ZipCodesPOCO>()
            };
            return citiesPOCO;
        }
        //public CompaniesCategoriesPOCO GetCompaniesCategoriesPOCO(CompaniesCategories companiesCategories)
        //{
        //    CompaniesCategoriesPOCO companiesCategoriesPOCO = new CompaniesCategoriesPOCO()
        //    {
        //        Category = new CategoriesPOCO(),
        //    };
        //    //if (categories.CompaniesCategories.Count <= 0)
        //    //    categories.CompaniesCategories = companiesCategories.FindBy(c => c.CategoryId == categories.CategoryId).ToList();
        //    //foreach (var item in categories.CompaniesCategories)
        //    //{
        //    //    var companiesCategories = GetCompaniesCategoriesPOCO(item);
        //    //    categoriesPOCO.CompaniesCategories.Add(companiesCategories);
        //    //}
        //    //return categoriesPOCO;
        //}
    }
}
