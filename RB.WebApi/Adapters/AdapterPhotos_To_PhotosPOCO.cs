using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;

namespace RB.WebApi.Adapters
{
    public class AdapterPhotos_To_PhotosPOCO
    {
        IGenericRepository<Photos, Guid> photos;
        AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO;
        AdapterLogos_To_LogosPOCO adapterLogos_To_LogosPOCO;
        public AdapterPhotos_To_PhotosPOCO(IGenericRepository<Photos, Guid> photos, AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO, AdapterLogos_To_LogosPOCO adapterLogos_To_LogosPOCO)
        {
            this.photos = photos;
            this.adapterCompanies_To_CompaniesPOCO = adapterCompanies_To_CompaniesPOCO;
            this.adapterLogos_To_LogosPOCO = adapterLogos_To_LogosPOCO;
        }
        public PhotosPOCO GetPhotosPOCO(Photos photos)
        {
            PhotosPOCO photosPOCO = new PhotosPOCO()
            {
                Company = adapterCompanies_To_CompaniesPOCO.GetCompaniesPOCO(photos.Company),
                CompanyId = photos.CompanyId,
                CreatedOn = photos.CreatedOn,
                FileName = photos.FileName,
                Logos = adapterLogos_To_LogosPOCO.GetLogosPOCO(photos.Logos),
                PhotoId = photos.PhotoId
            };
            return photosPOCO;
        }
    }
}
