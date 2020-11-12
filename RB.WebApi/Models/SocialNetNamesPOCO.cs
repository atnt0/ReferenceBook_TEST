using System.Collections.Generic;

namespace RB.WebApi.Models
{
    public class SocialNetNamesPOCO
    {
        public int SocialNetNameId { get; set; }
        public string SocialNetName { get; set; }
        public ICollection<SocialNetsPOCO> SocialNets { get; set; }

    }
}
