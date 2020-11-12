using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;

namespace RB.WebApi.Adapters
{
    public class AdapterEmails_To_EmailsPOCO
    {
        IGenericRepository<Emails, Guid> emails;
        AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO;
        public AdapterEmails_To_EmailsPOCO(IGenericRepository<Emails, Guid> emails, AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO)
        {
            this.emails = emails;
            this.adapterCompanies_To_CompaniesPOCO = adapterCompanies_To_CompaniesPOCO;
        }
        public EmailsPOCO GetEmailsPOCO(Emails emails)
        {
            EmailsPOCO emailsPOCO = new EmailsPOCO()
            {
                Company = adapterCompanies_To_CompaniesPOCO.GetCompaniesPOCO(emails.Company),
                CompanyId = emails.CompanyId,
                CreatedOn = emails.CreatedOn,
                Email = emails.Email,
                EmailId = emails.EmailId
            };
            return emailsPOCO;
        }
    }
}
