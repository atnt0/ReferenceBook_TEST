using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
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
        public IActionResult Index()
        {
            var model = streets.GetAll().OrderBy(p=>p.StreetName);
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
