using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using RB.DAL.Common;
using RB.DAL.Models;

namespace RB.MVC.Controllers
{
    public class CityController : Controller
    {
        IGenericRepository<Cities, Guid> cities;
        public CityController(IGenericRepository<Cities, Guid> cities)
        {
            this.cities = cities;
        }
        public IActionResult Index(int Page)
        {
            if (Page <= 0) Page = 1;
            int countrecord = 5;
            var model = cities.GetAll().Skip(countrecord * (Page - 1)).Take(countrecord).OrderBy(p => p.CityName);
            int countRows = cities.GetAll().Count();
            int count = model.Count();
            if (count == 0)
            {
                Page = Page - 1;
                return RedirectToAction("Index", new RouteValueDictionary(
                     new { controller = "City", action = "Index", Page = Page }));
            }
            ViewData["CountPages"] = Math.Ceiling((double)(countRows / countrecord));
            ViewData["IsInt"] = countRows % countrecord == 0 ? true : false;
            ViewData["Page"] = Page;
            return View(model);
        }

        public ActionResult Create()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult CreateNewCity(string cityName)
        {
            Cities city = new Cities() { CityName = cityName, CityId = Guid.NewGuid() };
            cities.Create(city);
            cities.Save();
            return PartialView(city);
        }

        public ActionResult Edit(Guid id)
        {
            var model = cities.Get(id);
            return PartialView(model);
        }

        [HttpPost]
        public ActionResult Save(Guid id, string fname)
        {         
            var model = cities.Get(id);
            model.CityName = fname;
            cities.Update(model);
            cities.Save();
            return PartialView(model);
        }
        [HttpPost]
        public ActionResult Delete(Guid id)
        {
            try
            {
                cities.Delete(id);
                cities.Save();
                return Json("OK");
            }
            catch (Exception exc)
            {
                return Json($"Bad\n{exc}");
            }
        }
    }
}
