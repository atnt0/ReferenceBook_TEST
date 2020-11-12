using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;

namespace RB.WebApi.Adapters
{
    public class AdapterSocialNets_To_SocialNetsPOCO
    {
        IGenericRepository<SocialNets, Guid> socialNets;
        AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO;
        AdapterSocialNetNames_To_SocialNetNamesPOCO adapterSocialNetNames_To_SocialNetNamesPOCO;
        public AdapterSocialNets_To_SocialNetsPOCO(IGenericRepository<SocialNets, Guid> socialNets, AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO, AdapterSocialNetNames_To_SocialNetNamesPOCO adapterSocialNetNames_To_SocialNetNamesPOCO)
        {
            this.socialNets = socialNets;
            this.adapterCompanies_To_CompaniesPOCO = adapterCompanies_To_CompaniesPOCO;
            this.adapterSocialNetNames_To_SocialNetNamesPOCO = adapterSocialNetNames_To_SocialNetNamesPOCO;
        }
        public SocialNetsPOCO GetSocialNetsPOCO(SocialNets socialNets)
        {
            SocialNetsPOCO socialNetsPOCO = new SocialNetsPOCO()
            {
                Company = adapterCompanies_To_CompaniesPOCO.GetCompaniesPOCO(socialNets.Company),
                CompanyId = socialNets.CompanyId,
                CreatedOn = socialNets.CreatedOn,
                SocialNetId = socialNets.SocialNetId,
                SocialNetName = adapterSocialNetNames_To_SocialNetNamesPOCO.GetSocialNetNamesPOCO(socialNets.SocialNetName),
                SocialNetNameId = socialNets.SocialNetNameId,
                SocialNetUrl = socialNets.SocialNetUrl
            };
            return socialNetsPOCO;
        }
    }
}
