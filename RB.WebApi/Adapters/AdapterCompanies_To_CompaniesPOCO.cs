﻿using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;
using System.Linq;

namespace RB.WebApi.Adapters
{
    public class AdapterCompanies_To_CompaniesPOCO
    {
        IGenericRepository<Companies, Guid> companies;
        IGenericRepository<Companies, Guid> inverseparentCompany;
        IGenericRepository<CompaniesCategories, Guid> companiesCategories;
        IGenericRepository<CompaniesSubcategories, Guid> companiesSubcategories;
        IGenericRepository<DayWeekTimeTables, Guid> dayweektimeTables;
        IGenericRepository<Emails, Guid> emails;
        IGenericRepository<Phones, Guid> phones;
        IGenericRepository<Photos, Guid> photos;
        IGenericRepository<SocialNets, Guid> socialNets;
        IGenericRepository<UsersCompanies, Guid> usersCompanies;
        AdapterAddresses_To_AddressesPOCO adapterAddresses_To_AddressesPOCO;
        AdapterCompaniesCategories_To_CompaniesCategoriesPOCO adapterCompaniesCategories_To_CompaniesCategoriesPOCO;
        AdapterCompaniesSubcategories_To_CompaniesSubcategoriesPOCO adapterCompaniesSubcategories_To_CompaniewSubcategoriesPOCO;
        AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO;
        AdapterDayWeekTimeTables_To_DayWeekTimeTablesPOCO adapterDayWeekTimeTables_To_DayWeekTimeTablesPOCO;
        AdapterEmails_To_EmailsPOCO adapterEmails_To_EmailsPOCO;
        AdapterPhones_To_PhonesPOCO adapterPhones_To_PhonesPOCO;
        AdapterPhotos_To_PhotosPOCO adapterPhotos_To_PhotosPOCO;
        AdapterSocialNets_To_SocialNetsPOCO adapterSocialNets_To_SocialNetsPOCO;
        AdapterUsersCompanies_To_UsersCompaniesPOCO adapterUsersCompanies_To_UsersCompaniesPOCO;
        public AdapterCompanies_To_CompaniesPOCO(IGenericRepository<Companies, Guid> companies, IGenericRepository<Companies, Guid> inverseparentCompany, IGenericRepository<CompaniesCategories, Guid> companiesCategories, IGenericRepository<CompaniesSubcategories, Guid> companiesSubcategories, IGenericRepository<DayWeekTimeTables, Guid> dayweektimeTables, IGenericRepository<Emails, Guid> emails, IGenericRepository<Phones, Guid> phones, IGenericRepository<Photos, Guid> photos, IGenericRepository<SocialNets, Guid> socialNets, IGenericRepository<UsersCompanies, Guid> usersCompanies, AdapterAddresses_To_AddressesPOCO adapterAddresses_To_AddressesPOCO, AdapterCompaniesCategories_To_CompaniesCategoriesPOCO adapterCompaniesCategories_To_CompaniesCategoriesPOCO, AdapterCompaniesSubcategories_To_CompaniesSubcategoriesPOCO adapterCompaniesSubcategories_To_CompaniewSubcategoriesPOCO, AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO, AdapterDayWeekTimeTables_To_DayWeekTimeTablesPOCO adapterDayWeekTimeTables_To_DayWeekTimeTablesPOCO, AdapterEmails_To_EmailsPOCO adapterEmails_To_EmailsPOCO, AdapterPhones_To_PhonesPOCO adapterPhones_To_PhonesPOCO, AdapterPhotos_To_PhotosPOCO adapterPhotos_To_PhotosPOCO, AdapterSocialNets_To_SocialNetsPOCO adapterSocialNets_To_SocialNetsPOCO, AdapterUsersCompanies_To_UsersCompaniesPOCO adapterUsersCompanies_To_UsersCompaniesPOCO)
        {
            this.companies = companies;
            this.inverseparentCompany = inverseparentCompany;
            this.companiesCategories = companiesCategories;
            this.companiesSubcategories = companiesSubcategories;
            this.dayweektimeTables = dayweektimeTables;
            this.emails = emails;
            this.phones = phones;
            this.photos = photos;
            this.socialNets = socialNets;
            this.usersCompanies = usersCompanies;
            this.adapterAddresses_To_AddressesPOCO = adapterAddresses_To_AddressesPOCO;
            this.adapterCompaniesCategories_To_CompaniesCategoriesPOCO = adapterCompaniesCategories_To_CompaniesCategoriesPOCO;
            this.adapterCompaniesSubcategories_To_CompaniewSubcategoriesPOCO = adapterCompaniesSubcategories_To_CompaniewSubcategoriesPOCO;
            this.adapterCompanies_To_CompaniesPOCO = adapterCompanies_To_CompaniesPOCO;
            this.adapterDayWeekTimeTables_To_DayWeekTimeTablesPOCO = adapterDayWeekTimeTables_To_DayWeekTimeTablesPOCO;
            this.adapterEmails_To_EmailsPOCO = adapterEmails_To_EmailsPOCO;
            this.adapterPhones_To_PhonesPOCO = adapterPhones_To_PhonesPOCO;
            this.adapterPhotos_To_PhotosPOCO = adapterPhotos_To_PhotosPOCO;
            this.adapterSocialNets_To_SocialNetsPOCO = adapterSocialNets_To_SocialNetsPOCO;
            this.adapterUsersCompanies_To_UsersCompaniesPOCO = adapterUsersCompanies_To_UsersCompaniesPOCO;
        }

        public CompaniesPOCO GetCompaniesPOCO(Companies companies)
        {
            CompaniesPOCO companiesPOCO = new CompaniesPOCO()
            {
                Address = adapterAddresses_To_AddressesPOCO.GetAddressesPOCO(companies.Address),
                AddressId = companies.AddressId,
                CompanyId = companies.CompanyId,
                CompanyName = companies.CompanyName,
                CreatedOn = companies.CreatedOn,
                DescriptionFull = companies.DescriptionFull,
                DescriptionShort = companies.DescriptionShort,
                Director = companies.Director,
                //ParentCompany = GetCompaniesPOCO(companies.ParentCompany),
                ParentCompanyId = companies.ParentCompanyId,
                Popularity = companies.Popularity,
                WebSite = companies.WebSite
            };
            //CompaniesCategories
            if (companies.CompaniesCategories.Count() <= 0)
                companies.CompaniesCategories = companiesCategories.FindBy(c => c.CompanyId == companies.CompanyId).ToList();
            foreach (var item in companies.CompaniesCategories)
            {
                var companiesCategoriesPOCO = adapterCompaniesCategories_To_CompaniesCategoriesPOCO.GetCompaniesCategoriesPOCO(item);
                companiesPOCO.CompaniesCategories.Add(companiesCategoriesPOCO);
            }
            //CompaniesSubcategories
            if (companies.CompaniesSubcategories.Count() <= 0)
                companies.CompaniesSubcategories = companiesSubcategories.FindBy(c => c.CompanyId == companies.CompanyId).ToList();
            foreach (var item in companies.CompaniesSubcategories)
            {
                var companiesSubcategoriesPOCO = adapterCompaniesSubcategories_To_CompaniewSubcategoriesPOCO.GetCompaniesSubcategoriesPOCO(item);
                companiesPOCO.CompaniesSubcategories.Add(companiesSubcategoriesPOCO);
            }
            return companiesPOCO;
        }
    }
}