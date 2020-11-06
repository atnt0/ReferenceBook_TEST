using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Common;
using RB.DAL.Models;
using RB.DAL.Repositories;
using RB.MVC.Models;
//using RB.MVC.Models;

namespace RB.MVC.Controllers
{
    public class CompanyController : Controller
    {
        IGenericRepository<Companies, Guid> companies;
        IGenericRepository<Photos, Guid> photos;

        IGenericRepository<Categories, int> categories;
        IGenericRepository<Subcategories, int> subcategories;
        IGenericRepository<CompanyCategories, Guid> compcat;//категория-кампания
        IGenericRepository<CompanySubcategories, Guid> compSubcat;
        public CompanyController(IGenericRepository<Companies, Guid> companies, IGenericRepository<Photos, Guid> photos, IGenericRepository<Categories, int> categories,
            IGenericRepository<Subcategories, int> subcategories, IGenericRepository<CompanyCategories, Guid> compcat,
           IGenericRepository<CompanySubcategories, Guid> compSubcat)
        {
            this.companies = companies;
            this.categories = categories;
            this.subcategories = subcategories;
            this.compcat = compcat;
            this.compSubcat = compSubcat;
            this.photos = photos;
        }
        public IActionResult Index()
        {
            var model = companies.GetAll();

            //System.Security.Claims.ClaimsPrincipal currentUser = this.User;
            //bool c = currentUser.IsInRole("Admin");
            //ViewBag.role = c;
            //var b = currentUser.Identity.IsAuthenticated;
            //ViewBag.user = b;
            //var model = films.GetAll();

            Dictionary<Guid, string> photoS = new Dictionary<Guid, string>();
            foreach (var item in model.ToList())
            {
                var a = item.CompanyId;
                var photostmp = photos.FindBy(p => p.CompanyId == a);
                string path = @"\Files\";
                if (photostmp.Count() != 0) photoS.Add(a, $"{path}{photostmp.First().Photo}");
                else photoS.Add(a, $"{path}Default.jpg");
            }
            ViewBag.Photos = photoS;
            return View(model);
        }



        public IActionResult Find()
        {
            var model = new ViewModelCompanyFind(categories, subcategories, compcat, compSubcat);
            return View(model);
        }

        [HttpPost]
        public IActionResult Find(ViewModelCompanyFind dataForm)
        {
            try
            {
                string jsonString = JsonSerializer.Serialize(dataForm);
                HttpContext.Session.SetString("dataForm", jsonString);
            }
            catch (Exception exc)
            {
                string s = exc.StackTrace;
            }

            return Json("OK");
        }
        public ActionResult CompanyByFilter(ViewModelCompanyFind filter)
        {
            var model = companies.FindBy(filter.Predicate());
            Dictionary<Guid, string> photoS = new Dictionary<Guid, string>();
            foreach (var item in model.ToList())
            {
                var a = item.CompanyId;
                var photostmp = photos.FindBy(p => p.CompanyId == a);
                string path = @"\Files\";
                if (photostmp.Count() != 0) photoS.Add(a, $"{path}{photostmp.First().Photo}");
                else photoS.Add(a, $"{path}Default.jpg");
            }
            ViewBag.Photos = photoS;
            return PartialView(model);
        }
    }
}
