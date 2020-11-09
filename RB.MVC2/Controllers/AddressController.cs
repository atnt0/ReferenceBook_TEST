using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using RB.DAL.Common;
using RB_DAL.Models;

namespace RB.MVC2.Controllers
{
    public class AddressController : Controller
    {
        IGenericRepository<Companies, Guid> companies;
        IGenericRepository<Addresses, Guid> adresses;
        IGenericRepository<Cities, Guid> cities;
        IGenericRepository<Streets, Guid> streets;
        IGenericRepository<ZipCodes, Guid> zipCodes;
        public AddressController(IGenericRepository<Companies, Guid> companies, IGenericRepository<Addresses, Guid> adresses,
            IGenericRepository<Cities, Guid> cities, IGenericRepository<Streets, Guid> streets,
           IGenericRepository<ZipCodes, Guid> zipCodes)
        {
            this.companies = companies;
            this.adresses = adresses;
            this.cities = cities;
            this.streets = streets;
            this.zipCodes = zipCodes;
        }
        public IActionResult Index(Guid id)
        {
            TempData["CompanyId"] = id;
            var adrId = companies.Get(id).AddressId;
            ViewBag.CompanyID = id;
            var model = adresses.GetAll().Where(p => p.AddressId ==adrId).FirstOrDefault();
            return View(model);
        }

        public ActionResult Edit(Guid id)
        {         
            Addresses address = id == Guid.Empty ? new Addresses() : adresses.Get(id);
            ViewBag.CityId = new SelectList(cities.GetAll(), "CityId", "CityName", address.CityId);
            ViewBag.StreetId = new SelectList(streets.GetAll(), "StreetId", "StreetName", address.StreetId);
            ViewBag.ZipCodeId = new SelectList(zipCodes.GetAll(), "ZipCodeId", "ZipCode", address.ZipCodeId);
            return View(address);
        }

        public ActionResult SelectZip(Guid id)
        {
            var zip = zipCodes.FindBy(p => p.CityId == id);
           // var a = JsonSerializer.Serialize(zip);
            return PartialView(zip);
        }


        [HttpPost]
        public ActionResult Edit(Addresses address)
        {
            if (ModelState.IsValid)
            {
                Guid CompId = (Guid)TempData["CompanyId"];
                //  var comp = companies.Get(CompId);
                //if (comp.AddressId == null)
                //{
                //    comp.AddressId = address.AddressId;
                //}
                //  address.Companies.Add
                //  companies.Update(comp);
                if (address.AddressId == Guid.Empty)
                {
                 //   address.AddressId = "";
                    // address.AddressId = Guid.NewGuid();
                    adresses.Create(address);
                    var a = adresses.GetAll();
                    adresses.Save();

                    return RedirectToAction("Index", new { id = CompId });
                }
            }
            return View(address);
        }

        [HttpPost]
        public ActionResult Create(Addresses address)
        {
            if (ModelState.IsValid)
            {
                Guid CompId = (Guid)TempData["CompanyId"];

                if (address.AddressId == Guid.Empty)
                {
                    //var b = new Addresses()
                    //{
                    //    AddressId = Guid.NewGuid(),
                    //    ZipCodeId = new Guid("C7C17E8E-6DA5-43F0-BB6C-C117C1BC08BA"),
                    //    CityId = new Guid("F07714C4-187A-4382-8E5B-47C33F0917B2"),
                    //    StreetId = new Guid("6C31603C-7955-4B21-A322-D0ED468861FD"),
                    //    House = "4",
                    //    Longitude = 65m,
                    //    Latitude = 56m,
                    //    Block = "56",
                    //    Apartment = "67"
                    //};
                    //   address.AddressId = "";
                     address.AddressId = Guid.NewGuid();
                    adresses.Create(address);
                  //  var a = adresses.GetAll();
                    adresses.Save();
                    var comp = companies.Get(CompId);
                    if (comp.AddressId == null)
                    {
                        comp.AddressId = address.AddressId;
                    }
                   // address.companies.add
                  companies.Update(comp);
                    companies.Save();
                    return RedirectToAction("Index", new { id = CompId });
                }
            }
            return View(address);
        }

        public ActionResult Create(Guid id)
        {
            TempData["CompanyId"] = id;
            var address = new Addresses();
            ViewBag.CityId = new SelectList(cities.GetAll(), "CityId", "CityName", address.CityId);
            ViewBag.StreetId = new SelectList(streets.GetAll(), "StreetId", "StreetName", address.StreetId);
            ViewBag.ZipCodeId = new SelectList(zipCodes.GetAll(), "ZipCodeId", "ZipCode", address.ZipCodeId);
            return View(address);
        }

        // [Authorize(Roles = "Admin")]
        //public ActionResult Create(int id)
        //{
        //    var model = new ActFilm { FilmId = id, ActorId = 1 };
        //    ViewBag.ActorId = new SelectList(actors.GetAll(), "ActorId", "ActorName", model.ActorId);
        //    return View(model);
        //}
        //[Authorize(Roles = "Admin")]
        //public ActionResult Edit(int id)
        //{
        //    var model = actFilms.Get(id);

        //    ViewBag.ActorId = new SelectList(actors.GetAll(), "ActorId", "ActorName", model.ActorId);
        //    return View(model);
        //}
        //[Authorize(Roles = "Admin")]
        //[HttpPost]
        //public ActionResult Edit(ActFilm actFilm)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        actFilms.Update(actFilm);
        //        actFilms.Save();
        //        return RedirectToAction("Index", new { id = actFilm.FilmId });
        //    }
        //    return View(actFilm);
        //}
        //[Authorize(Roles = "Admin")]
        //[HttpPost]
        //public ActionResult Delete(int id)
        //{
        //    try
        //    {
        //        actFilms.Delete(id);
        //        actFilms.Save();
        //        return Json("OK");
        //    }
        //    catch (Exception exc)
        //    {
        //        return Json("Bad");
        //    }
        //}
    }
}
