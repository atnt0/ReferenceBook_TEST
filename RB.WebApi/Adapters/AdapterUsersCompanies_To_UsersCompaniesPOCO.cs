using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;

namespace RB.WebApi.Adapters
{
    public class AdapterUsersCompanies_To_UsersCompaniesPOCO
    {
        IGenericRepository<UsersCompanies, Guid> usersCompanies;
        AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO;
        public AdapterUsersCompanies_To_UsersCompaniesPOCO(IGenericRepository<UsersCompanies, Guid> usersCompanies, AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO)
        {
            this.usersCompanies = usersCompanies;
            this.adapterCompanies_To_CompaniesPOCO = adapterCompanies_To_CompaniesPOCO;
        }
        public UsersCompaniesPOCO GetUsersCompaniesPOCO(UsersCompanies usersCompanies)
        {
            UsersCompaniesPOCO usersCompaniesPOCO = new UsersCompaniesPOCO()
            {
                Company = adapterCompanies_To_CompaniesPOCO.GetCompaniesPOCO(usersCompanies.Company),
                CompanyId = usersCompanies.CompanyId,
                UserCompanyId = usersCompanies.UserCompanyId,
                UserId = usersCompanies.UserId
            };
            return usersCompaniesPOCO;
        }
    }
}
