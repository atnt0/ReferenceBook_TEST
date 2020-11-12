using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Routing;
using RB.DAL.Common;
using RB.DAL.Models;

namespace RB.MVC.Controllers
{
    public class StreetController : Controller
    {
        IGenericRepository<Streets, Guid> streets;
        IGenericRepository<Cities, Guid> cities;
        public StreetController(IGenericRepository<Streets, Guid> streets, IGenericRepository<Cities, Guid> cities)
        {
            this.streets = streets;
            this.cities = cities;
        }
        public IActionResult Index(int Page)
        {
            if (Page <= 0) Page = 1;
            int countrecord = 5;
            var model = streets.GetAll().Skip(countrecord * (Page - 1)).Take(countrecord).OrderBy(p => p.StreetName);
            int countRows = streets.GetAll().Count();
            int count = model.Count();
            if (count == 0)
            {
                Page = Page - 1;
                return RedirectToAction("Index", new RouteValueDictionary(
                     new { controller = "Street", action = "Index", Page = Page }));
            }
            ViewData["CountPages"] = Math.Ceiling((double)(countRows / countrecord));
            ViewData["IsInt"] = countRows % countrecord == 0 ? true : false;
            ViewData["Page"] = Page;
            return View(model);        
        }

        public ActionResult Create()
        {
            ViewBag.CityId = new SelectList(cities.GetAll(), "CityId", "CityName");
            return PartialView();
        }
        [HttpPost]
        public ActionResult CreateNewStreet(string streetName, Guid citId)
        {
            Streets street = new Streets() { StreetName = streetName, CityId = citId, StreetId = Guid.NewGuid() };
            streets.Create(street);
            streets.Save();
            var cityName = cities.Get(citId).CityName;
            ViewBag.cityName = cityName;
            return PartialView(street);
        }

        public ActionResult Edit(Guid id)
        {
            var model = streets.Get(id);
            ViewBag.CityId = new SelectList(cities.GetAll(), "CityId", "CityName", model.CityId);
            return PartialView(model);
        }

        [HttpPost]
        public ActionResult Save(Guid id, string fname, Guid cityId)
        {
            var model = streets.Get(id);
            model.StreetName = fname;
            model.CityId = cityId;
            streets.Update(model);
            streets.Save();
            var cityName = cities.Get(cityId).CityName;
            ViewBag.cityName = cityName;
            return PartialView(model);
        }
        [HttpPost]
        public ActionResult Delete(Guid id)
        {
            try
            {
                streets.Delete(id);
                streets.Save();
                return Json("OK");
            }
            catch (Exception exc)
            {
                return Json($"Bad\n{exc}");
            }
        }
    }
}
