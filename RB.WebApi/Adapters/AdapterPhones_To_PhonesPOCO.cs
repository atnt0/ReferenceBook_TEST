using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;

namespace RB.WebApi.Adapters
{
    public class AdapterPhones_To_PhonesPOCO
    {
        IGenericRepository<Phones, Guid> phones;
        AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO;
        public AdapterPhones_To_PhonesPOCO(IGenericRepository<Phones, Guid> phones, AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO)
        {
            this.phones = phones;
            this.adapterCompanies_To_CompaniesPOCO = adapterCompanies_To_CompaniesPOCO;
        }
        public PhonesPOCO GetPhonesPOCO(Phones phones)
        {
            PhonesPOCO phonesPOCO = new PhonesPOCO()
            {
                Company = adapterCompanies_To_CompaniesPOCO.GetCompaniesPOCO(phones.Company),
                CompanyId = phones.CompanyId,
                CreatedOn = phones.CreatedOn,
                PhoneId = phones.PhoneId,
                PhoneNumber = phones.PhoneNumber
            };
            return phonesPOCO;
        }
    }
}
