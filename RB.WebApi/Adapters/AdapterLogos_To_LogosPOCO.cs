using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;

namespace RB.WebApi.Adapters
{
    public class AdapterLogos_To_LogosPOCO
    {
        IGenericRepository<Logos, Guid> logos;
        AdapterPhotos_To_PhotosPOCO adapterPhotos_To_PhotosPOCO;
        public AdapterLogos_To_LogosPOCO(IGenericRepository<Logos, Guid> logos, AdapterPhotos_To_PhotosPOCO adapterPhotos_To_PhotosPOCO)
        {
            this.logos = logos;
            this.adapterPhotos_To_PhotosPOCO = adapterPhotos_To_PhotosPOCO;
        }
        public LogosPOCO GetLogosPOCO(Logos logos)
        {
            LogosPOCO logosPOCO = new LogosPOCO()
            {
                Photo = adapterPhotos_To_PhotosPOCO.GetPhotosPOCO(logos.Photo),
                PhotoId = logos.PhotoId
            };
            return logosPOCO;
        }
    }
}
