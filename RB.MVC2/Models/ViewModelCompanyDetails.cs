using RB.DAL.Common;
using RB.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RB.MVC.Models
{
    public class ViewModelCompanyDetails
    {

        IGenericRepository<Companies, Guid> companies;
        IGenericRepository<Photos, Guid> photos;
        IGenericRepository<Logos, Guid> logos;
        IGenericRepository<Categories, int> categories;
        IGenericRepository<SocialNets, Guid> socialNets;
        IGenericRepository<SocialNetNames, int> socialNetsNames;
        IGenericRepository<Subcategories, int> subcategories;
        IGenericRepository<CompaniesCategories, Guid> compcat;//категория-кампания
        IGenericRepository<CompaniesSubcategories, Guid> compSubcat;
        IGenericRepository<Addresses, Guid> addresses;
        IGenericRepository<DayWeekTimeTables, Guid> timetables;
        public Guid CompanyId { get; set; }      
        public DateTime? CreatedOn { get; set; }     
        public string CompanyName { get; set; }
        public Companies ParentCompany { get; set; }      
        public string Director { get; set; }      
        public string DescriptionShort { get; set; }     
        public string DescriptionFull { get; set; }     
        public string WebSite { get; set; }
        public Addresses Address { get; set; }
        public int Popularity { get; set; }     
        public  List<Categories> Categories { get; set; }
        public List<Photos> Photos { get; set; }
        public Photos PhotoLogo{ get; set; }
        public  List<Subcategories> Subcategories { get; set; }      
        public  List<DayWeekTimeTables> DayWeekTimeTables { get; set; }
        public  List<Emails> Emails { get; set; }        
        public  List<Phones> Phones { get; set; }            
        public  List<SocnetPoco> SocialNets { get; set; }
        public string Path { get; set; }
        public string PathLogo { get; set; }
       
        //  public virtual ICollection<UsersCompanies> UsersCompanies { get; set; }
        public ViewModelCompanyDetails(IGenericRepository<Companies, Guid> companies, IGenericRepository<Photos, Guid> photos, IGenericRepository<Categories, int> categories,
            IGenericRepository<Subcategories, int> subcategories, IGenericRepository<CompaniesCategories, Guid> compcat,
           IGenericRepository<CompaniesSubcategories, Guid> compSubcat, IGenericRepository<SocialNets, Guid> socialNets,
          IGenericRepository<SocialNetNames, int> socialNetsNames, IGenericRepository<Logos, Guid> logos, Guid id,
          IGenericRepository<Addresses, Guid> addresses, IGenericRepository<DayWeekTimeTables, Guid> timetables)
        {
            this.companies = companies;
            this.categories = categories;
            this.subcategories = subcategories;
            this.compcat = compcat;
            this.compSubcat = compSubcat;
            this.photos = photos;
            this.socialNets = socialNets;
            this.socialNetsNames = socialNetsNames;
            this.logos = logos;
            this.CompanyId = id;
            this.addresses = addresses;
            this.timetables = timetables;
            Path = @"\Files\Photos\";
            PathLogo = @"\Files\Logos\";
            InitializeCompany();
        }

        private void InitializeCompany()
        {
            Companies company = companies.Get(CompanyId);
            CreatedOn = company.CreatedOn;
            CompanyName = company.CompanyName;
            ParentCompany = companies.FindBy(p=>p.ParentCompanyId ==company.ParentCompanyId).FirstOrDefault();
            Director = company.Director;
            DescriptionShort = company.DescriptionShort;
            DescriptionFull = company.DescriptionFull;
            WebSite = company.WebSite;
            Address = addresses.FindBy(p => p.AddressId == company.AddressId).FirstOrDefault();
            Popularity = company.Popularity;


              var companycat = compcat.FindBy(p => p.CompanyId == CompanyId);
            List<Categories> cateGories = new List<Categories>();
            foreach (var item in companycat)            
            { 
                var category = categories.FindBy(p=>p.CategoryId== item.CategoryId).FirstOrDefault();
                cateGories.Add(category);
            }
            Categories = cateGories;


            var companysubcat = compSubcat.FindBy(p => p.CompanyId == CompanyId);
            List<Subcategories> subcateGories = new List<Subcategories>();
            foreach (var item in companysubcat)
            {
                var subcategory = subcategories.FindBy(p => p.SubcategoryId == item.SubcategoryId).FirstOrDefault();
                subcateGories.Add(subcategory);
            }
            Subcategories = subcateGories;

            var selectPhotos = photos.FindBy(p => p.CompanyId == CompanyId);
            Photos =  selectPhotos.Where(p => p.Logos.PhotoId != p.PhotoId).ToList();
            PhotoLogo = selectPhotos.Where(p => p.Logos.PhotoId == p.PhotoId).FirstOrDefault();
            DayWeekTimeTables = timetables.FindBy(p => p.CompanyId == CompanyId).ToList();
            Emails = company.Emails.ToList();
            Phones = company.Phones.ToList();

            var companySocnet = socialNets.FindBy(p => p.CompanyId == CompanyId);
            List<SocnetPoco> socnetPocos = new List<SocnetPoco>();
            foreach (var item in companySocnet)
            {
                var socNetName = socialNetsNames.FindBy(p => p.SocialNetNameId == item.SocialNetNameId);
                if (socNetName.Count() > 0)
                {
                    socnetPocos.Add(new SocnetPoco() { socialNetNames = socNetName.FirstOrDefault(), SocNetUrl = item.SocialNetUrl });
                }
            }
            SocialNets = socnetPocos;



           

        }
    }
}
