using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Common;
using RB.DAL.Repositories;
using RB.MVC.Models;
using RB.DAL.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Routing;
using static RB.MVC.Models.DayWeekTimeTablesPoco;

namespace RB.MVC.Controllers
{
    public class CompanyController : Controller
    {
        IGenericRepository<Companies, Guid> companies;
        IGenericRepository<Photos, Guid> photos;
        IGenericRepository<Logos, Guid> logos;
        IGenericRepository<Categories, int> categories;
        IGenericRepository<SocialNets, Guid> socialNets;
        IGenericRepository<SocialNetNames, int> socialNetsNames;
        IGenericRepository<Subcategories, int> subcategories;
        IGenericRepository<Addresses, Guid> addresses;
        IGenericRepository<CompaniesCategories, Guid> compcat;//категория-кампания
        IGenericRepository<CompaniesSubcategories, Guid> compSubcat;
        IGenericRepository<DayWeekTimeTables, Guid> timetables;
        public CompanyController(IGenericRepository<Companies, Guid> companies, IGenericRepository<Photos, Guid> photos, 
            IGenericRepository<Categories, int> categories,
            IGenericRepository<Subcategories, int> subcategories, IGenericRepository<CompaniesCategories, Guid> compcat,
           IGenericRepository<CompaniesSubcategories, Guid> compSubcat, IGenericRepository<SocialNets, Guid> socialNets,
          IGenericRepository<SocialNetNames, int> socialNetsNames, IGenericRepository<Logos, Guid> logos,
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
            this.addresses = addresses;
            this.timetables = timetables;
        }
        public IActionResult Index(int Page)
        {
            if (Page <= 0) Page = 1;
            int countrecord = 6;
            var model = companies.GetAll().Skip(countrecord * (Page - 1)).Take(countrecord).OrderBy(p => p.CompanyName);
            int countRows = companies.GetAll().Count();
            int count = model.Count();

            Dictionary<Guid, string> photoS = new Dictionary<Guid, string>();
            foreach (var item in model.ToList())
            {
                var selectPhotos = photos.FindBy(p => p.CompanyId == item.CompanyId);
                var photoLogo = selectPhotos.Where(p => p.Logos.PhotoId == p.PhotoId).FirstOrDefault();
             
                string path = @"\Files\";
                if (photoLogo!= null)
                {
                    path += @"Logos\";
                    photoS.Add(item.CompanyId, $"{path}{photoLogo.FileName}");
                }
                else 
                {
                    photoS.Add(item.CompanyId, $"{path}Default.jpg"); 
                }
            }
            ViewBag.Photos = photoS;

            if (count == 0)
            {
                Page = Page - 1;
                return RedirectToAction("Index", new RouteValueDictionary(
                     new { controller = "Subcategory", action = "Index", Page = Page }));
            }
            ViewData["CountPages"] = Math.Ceiling((double)countRows / countrecord);
            ViewData["Page"] = Page;
            return View(model);
            ////System.Security.Claims.ClaimsPrincipal currentUser = this.User;
            ////bool c = currentUser.IsInRole("Admin");
            ////ViewBag.role = c;
            ////var b = currentUser.Identity.IsAuthenticated;
            ////ViewBag.user = b;
            ////var model = films.GetAll();          
        }

        public ActionResult CompanyDetails(Guid id)
        {
            var comp = companies.Get(id);
             comp.Popularity = comp.Popularity + 1; 
            companies.Update(comp);
            companies.Save();
            ViewModelCompanyDetails model = new ViewModelCompanyDetails( companies, photos, categories, subcategories, compcat, 
            compSubcat, socialNets, socialNetsNames, logos, id, addresses, timetables);

            var listOriginalDays = timetables.FindBy(p => p.CompanyId == id).ToList();
            var timeTablesCollection = new CompanyTimeTablesCollectionPoco(listOriginalDays, id);

            //ViewBag.TimeTables = listNew.OrderBy(item => item.WeekDay);
            ViewBag.TimeTables = timeTablesCollection.Days;

            return View(model);
        }

        public ActionResult Edit(Guid id)
        {
            Companies company = companies.Get(id);                  
            var companycat = compcat.FindBy(p => p.CompanyId == id);
            List<Categories> cateGories = new List<Categories>();
            foreach (var item in companycat)            
            { 
                var category = categories.FindBy(p=>p.CategoryId== item.CategoryId).FirstOrDefault();
                cateGories.Add(category);
            }
            ViewBag.Categories = cateGories;

            var companysubcat = compSubcat.FindBy(p => p.CompanyId == id);
            List<Subcategories> subcateGories = new List<Subcategories>();
            foreach (var item in companysubcat)
            {
                var subcategory = subcategories.FindBy(p => p.SubcategoryId == item.SubcategoryId).FirstOrDefault();
                subcateGories.Add(subcategory);
            }
            ViewBag.Subategories = subcateGories;

            var companySocnet = socialNets.FindBy(p => p.CompanyId == id);
            List<SocnetPoco> socnetPocos = new List<SocnetPoco>();
            foreach (var item in companySocnet)
            {               
                var socNetName = socialNetsNames.FindBy(p => p.SocialNetNameId == item.SocialNetNameId);
                if (socNetName.Count() > 0) {
                    socnetPocos.Add(new SocnetPoco() { socialNetNames = socNetName.FirstOrDefault(), SocNetUrl = item.SocialNetUrl });
                }
            }
            ViewBag.socialnetNames = socnetPocos;

            TempData["CompanyId"] = id;
            string path = @"\Files\Photos\";
            string pathlogo = @"\Files\Logos\";
            ViewBag.Path = path;
            ViewBag.PathLogo = pathlogo;
            // ViewBag.Company = companies.Get(id);
            Photos ph = new Photos();
            var selectPhotos = photos.FindBy(p => p.CompanyId == id);//.Where(p => p.Logos.PhotoId != p.PhotoId);
            ViewBag.Photos = selectPhotos.Where(p=>p.Logos.PhotoId!=p.PhotoId);

            var photoLogo = selectPhotos.Where(p => p.Logos.PhotoId == p.PhotoId).FirstOrDefault();         
            ViewBag.Logo = photoLogo;
            if (company.AddressId != Guid.Empty)
            {             
                ViewBag.Address = addresses.FindBy(p=>p.AddressId == company.AddressId).FirstOrDefault();           
            }
            //else
            //{
            //    ViewBag.Address = new Addresses() { };
            //}

            // расписание



            var listOriginalDays = timetables.FindBy(p => p.CompanyId == id).ToList();
            var timeTablesCollection = new CompanyTimeTablesCollectionPoco(listOriginalDays, id);

            //ViewBag.TimeTables = listNew.OrderBy(item => item.WeekDay);
            ViewBag.TimeTables = timeTablesCollection.Days;

            return View(company);

        }

        public ActionResult AddSocnet(Guid id)
        {
            var companysocnet = socialNets.FindBy(p => p.CompanyId == id);
            List<SocialNetNames> socialnetNames = new List<SocialNetNames>();
            var socialNetNamesList = socialNetsNames.GetAll();          
            ViewBag.CompanyId = id;
            ViewBag.SocialNetNameId = new SelectList(socialNetNamesList, "SocialNetNameId", "SocialNetName");
            return PartialView();
        }

        [HttpPost]
        public ActionResult AddNewSocnet(Guid companyId, int socnetnameId, string url)
        {
            var newSocNet = new SocialNets() { CompanyId = companyId, SocialNetNameId = socnetnameId, SocialNetId = Guid.NewGuid(), SocialNetUrl = url };
            socialNets.Create(newSocNet);
            socialNets.Save();
            var model = socialNetsNames.Get(socnetnameId);
            ViewBag.Url = url;
            return PartialView(model);
        }

        [HttpPost]
        public ActionResult DeleteSocnet(Guid companyId, int socnetnameId)
        {
            try
            {
                var id = socialNets.FindBy(p => p.SocialNetNameId == socnetnameId && p.CompanyId == companyId).FirstOrDefault().SocialNetId;
                socialNets.Delete(id);
                socialNets.Save();
                return Json("OK");
            }
            catch (Exception exc)
            {
                return Json($"Bad\n{exc}");
            }
        }

        public ActionResult AddCategory(Guid id)
        {
            var companycat = compcat.FindBy(p => p.CompanyId == id);
            List<Categories> cateGories = new List<Categories>();
            var categoryList = categories.GetAll();
            foreach (var item in categoryList)
            {
                bool isInCompanycat = false;
                foreach (var item2 in companycat)
                {
                    if(item.CategoryId == item2.CategoryId)
                    {
                        isInCompanycat = true;
                    }
                }
                if ( !isInCompanycat )
                {               
                    cateGories.Add(item);
                }              
            }
            ViewBag.CompanyId = id;
            ViewBag.CategoryId = new SelectList(cateGories, "CategoryId", "CategoryName");        
            return PartialView();
        }
        [HttpPost]
        public ActionResult AddNewCategory(Guid companyId , int categoryId)
        {
            var newCompaniesCategories = new CompaniesCategories() { CompanyId = companyId, CategoryId = categoryId, CompanyCategoryId=Guid.NewGuid() };
            compcat.Create(newCompaniesCategories);
            compcat.Save();
            var model = categories.Get(categoryId);
            return PartialView(model);
        }

        [HttpPost]
        public ActionResult DeleteCategory(Guid companyId, int categoryId)
        {
            try
            {
                var id = compcat.FindBy(p => p.CategoryId == categoryId && p.CompanyId == companyId).FirstOrDefault().CompanyCategoryId;
                compcat.Delete(id);
                compcat.Save();
                return Json("OK");
            }
            catch (Exception exc)
            {
                return Json($"Bad\n{exc}");
            }
        }
        public ActionResult AddSubcategory(Guid id)
        {
            var companysubcat = compSubcat.FindBy(p => p.CompanyId == id);
            List<Subcategories> subcateGories = new List<Subcategories>();
            var subcategoryList = subcategories.GetAll();
            foreach (var item in subcategoryList)
            {
                bool isInCompanycat = false;
                foreach (var item2 in companysubcat)
                {
                    if (item.SubcategoryId == item2.SubcategoryId)
                    {
                        isInCompanycat = true;
                    }
                }
                if (!isInCompanycat)
                {
                    subcateGories.Add(item);
                }
            }
            ViewBag.CompanyId = id;
            ViewBag.SubcategoryId = new SelectList(subcateGories, "SubcategoryId", "SubcategoryName");
            return PartialView();
        }
        [HttpPost]
        public ActionResult AddNewSubcategory(Guid companyId, int subcategoryId)
        {
            var newCompaniesSubcategories = new CompaniesSubcategories() { CompanyId = companyId, SubcategoryId = subcategoryId, CompanySubcategoryId = Guid.NewGuid() };
            compSubcat.Create(newCompaniesSubcategories);
            compSubcat.Save();
            var model = subcategories.Get(subcategoryId);
            return PartialView(model);
        }

        [HttpPost]
        public ActionResult DeleteSubcategory(Guid companyId, int subcategoryId)
        {
            try
            {
                var id = compSubcat.FindBy(p => p.SubcategoryId == subcategoryId && p.CompanyId == companyId).FirstOrDefault().CompanySubcategoryId;
                compSubcat.Delete(id);
                compSubcat.Save();
                return Json("OK");
            }
            catch (Exception exc)
            {
                return Json($"Bad\n{exc}");
            }
        }
        [HttpPost]
        public ActionResult Edit(Companies companyNew)
        {
            var companyOld = companies.Get(companyNew.CompanyId);
            var createOn = companyOld.CreatedOn;
            var addressId = companyOld.AddressId;
            var companiesCategories = companyOld.CompaniesCategories;
            var companiesSubcategories = companyOld.CompaniesSubcategories;
            var phones = companyOld.Phones;
            var photos = companyOld.Photos;
            var popularity = companyOld.Popularity;
            var socialNets = companyOld.SocialNets;
            var dayWeekTimeTables = companyOld.DayWeekTimeTables;
            var emails = companyOld.Emails;        

            var companyId = companyNew.CompanyId;
            var parentCompanyId = companyNew.ParentCompanyId;
            var companyName = companyNew.CompanyName;
            var director = companyNew.Director;
            var descriptionShort = companyNew.DescriptionShort;
            var descriptionFull = companyNew.DescriptionFull;
            var webSite = companyNew.WebSite;

            Companies company = new Companies()
            {
                CompanyId = companyId,
                CreatedOn = createOn,
                CompanyName = companyName,
                ParentCompanyId = parentCompanyId,
                Director = director,
                DescriptionShort = descriptionShort,
                DescriptionFull = descriptionFull,
                WebSite = webSite,
                AddressId = addressId,
                Popularity = popularity,

                CompaniesCategories = companiesCategories,
                CompaniesSubcategories = companiesSubcategories,
                Phones = phones,
                Emails = emails,
                SocialNets = socialNets,
                Photos = photos,
                DayWeekTimeTables = dayWeekTimeTables,
            };

            if (ModelState.IsValid)
            {
                //if (companyNew.CompanyId == Guid.Empty)
                //{
                //    companyNew.CompanyId = Guid.NewGuid();
                //    companies.Create(companyNew);
                //    companies.Save();
                //    return RedirectToAction("Index");
                //}
                //else
                //{
                //    var companyOld = companies.Get(companyNew.CompanyId);
                // если пользователь ClientCompany и является владельцем компании
                // с формы забираем только поля которые ему доступны (игнорируем и переопределяем оставшиеся
                // поля из старой записи)     

                //  var companyOld = companies.Get(companyNew.CompanyId);
                //companyNew.CreatedOn = companyOld.CreatedOn;
                ///   
               // companyNew.AddressId = (Guid)ViewData["Adress"];
                companies.Delete(companyId);
                companies.Save();
                companies.Create(company);
                    companies.Save();
                    return RedirectToAction("Index");            
            }
            return View(company);
        }

        public ActionResult Create(Guid id)
        {
            Companies company = id == Guid.Empty ? new Companies() : companies.Get(id);         
            return View(company);
        }

        [HttpPost]
        public ActionResult Create(Companies companyNew)
        {
            if (ModelState.IsValid)
            {
              
                    companyNew.CompanyId = Guid.NewGuid();
                companyNew.CreatedOn = DateTime.Now;
                    companies.Create(companyNew);
                    companies.Save();
                    return RedirectToAction("Edit",new RouteValueDictionary(
                     new { controller = "Company", action = "Edit", id = companyNew.CompanyId }));
                
            }
            return View(companyNew);
        }


        public IActionResult Find(int Page)
        {
            var model = new ViewModelCompanyFind(categories, subcategories, compcat, compSubcat, companies);
            return View(model);
        }

        //[HttpPost]
        //public IActionResult Find(ViewModelCompanyFind dataForm)
        //{
        //    try
        //    {
        //        string jsonString = JsonSerializer.Serialize(dataForm);
        //        HttpContext.Session.SetString("dataForm", jsonString);
        //    }
        //    catch (Exception exc)
        //    {
        //        string s = exc.StackTrace;
        //    }

        //    return Json("OK");
        //}
        [HttpPost]
        public ActionResult CompanyByFilter(ViewModelCompanyFind filter, int Page)
        {
            //ViewData["filter"] = filter;

            //if (Page <= 0) Page = 1;
            //int countrecord = 5;
            //var model = companies.FindBy(filter.Predicate());
            //int countRows = companies.FindBy(filter.Predicate()).Count();

            //Dictionary<Guid, string> photoS = new Dictionary<Guid, string>();
            //foreach (var item in model.ToList())
            //{
            //    var a = item.CompanyId;
            //    var photostmp = photos.FindBy(p => p.CompanyId == a);
            //    string path = @"\Files\";
            //    if (photostmp.Count() != 0) photoS.Add(a, $"{path}{photostmp.First().FileName}");
            //    else photoS.Add(a, $"{path}Default.jpg");
            //}
            //ViewBag.Photos = photoS;

            //int count = model.Count();
            //if (count == 0)
            //{
            //    Page = Page - 1;
            //    return RedirectToAction("Find", new RouteValueDictionary(
            //         new { controller = "Company", action = "Find", Page = Page }));
            //}
            //ViewData["CountPages"] = Math.Ceiling((double)(countRows / countrecord));
            //ViewData["IsInt"] = countRows % countrecord == 0 ? true : false;
            //ViewData["Page"] = Page;
            //return PartialView(model);




            var model = companies.FindBy(filter.Predicate());
            Dictionary<Guid, string> photoS = new Dictionary<Guid, string>();
            foreach (var item in model.ToList())
            {
                var a = item.CompanyId;
                var photostmp = photos.FindBy(p => p.CompanyId == a);
                string path = @"\Files\";
                if (photostmp.Count() != 0)
                {
                    path += @"Photos\";
                    photoS.Add(a, $"{path}{photostmp.First().FileName}");
                }
                else
                {
                    photoS.Add(a, $"{path}Default.jpg"); 
                }
            }
            ViewBag.Photos = photoS;
            return PartialView(model);
        }
    }
}
