using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;
using System.Linq;

namespace RB.WebApi.Adapters
{
    public class AdapterSocialNetNames_To_SocialNetNamesPOCO
    {
        IGenericRepository<SocialNetNames, int> socialnetNames;
        IGenericRepository<SocialNets, Guid> socialNets;
        AdapterSocialNets_To_SocialNetsPOCO adapterSocialNets_To_SocialNetsPOCO;
        public AdapterSocialNetNames_To_SocialNetNamesPOCO(IGenericRepository<SocialNetNames, int> socialnetNames, IGenericRepository<SocialNets, Guid> socialNets, AdapterSocialNets_To_SocialNetsPOCO adapterSocialNets_To_SocialNetsPOCO)
        {
            this.socialnetNames = socialnetNames;
            this.socialNets = socialNets;
            this.adapterSocialNets_To_SocialNetsPOCO = adapterSocialNets_To_SocialNetsPOCO;
        }
        public SocialNetNamesPOCO GetSocialNetNamesPOCO(SocialNetNames socialnetNames)
        {
            SocialNetNamesPOCO socialnetNamesPOCO = new SocialNetNamesPOCO()
            {
                SocialNetName = socialnetNames.SocialNetName,
                SocialNetNameId = socialnetNames.SocialNetNameId
            };
            //SocialNets
            if (socialnetNames.SocialNets.Count() <= 0)
                socialnetNames.SocialNets = socialNets.FindBy(s => s.SocialNetNameId == socialnetNames.SocialNetNameId).ToList();
            foreach (var item in socialnetNames.SocialNets)
            {
                var SocialNetsPOCO = adapterSocialNets_To_SocialNetsPOCO.GetSocialNetsPOCO(item);
                socialnetNamesPOCO.SocialNets.Add(SocialNetsPOCO);
            }
            return socialnetNamesPOCO;
        }
    }
}
