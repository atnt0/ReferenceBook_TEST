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
            List<ZipCodes> zips = new List<ZipCodes>();
            List<Streets> str = new List<Streets>();
            var Id = address.CityId;        
            if (id != Guid.Empty)
            {
                zips = zipCodes.FindBy(p => p.CityId == Id).OrderBy(p => p.ZipCode).ToList();
                str = streets.FindBy(p => p.CityId == Id).ToList();
            }
            else zips = zipCodes.GetAll().ToList();        
            ViewBag.CityId = new SelectList(cities.GetAll(), "CityId", "CityName", Id);
            ViewBag.StreetId = new SelectList(str, "StreetId", "StreetName", address.StreetId);
            ViewBag.ZipCodeId = new SelectList(zips, "ZipCodeId", "ZipCode", address.ZipCodeId);
            return View(address);
        }
        public ActionResult SelectZip(Guid id)
        {
            var zip = zipCodes.FindBy(p => p.CityId == id).OrderBy(p=>p.ZipCode);      
            return PartialView(zip);
        }
        public ActionResult SelectStreets(Guid id)
        {
            var str = streets.FindBy(p => p.CityId == id);
            return PartialView(str);
        }

        [HttpPost]
        public ActionResult Edit(Addresses address)
        {
            if (ModelState.IsValid)
            {
                Guid CompId = (Guid)TempData["CompanyId"];            
                if (address.AddressId == Guid.Empty)
                {             
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
                     address.AddressId = Guid.NewGuid();
                    adresses.Create(address);              
                    adresses.Save();
                    var comp = companies.Get(CompId);
                    if (comp.AddressId == null)
                    {
                        comp.AddressId = address.AddressId;
                    }           
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
            List<ZipCodes> zips = new List<ZipCodes>();
            List<Streets> str = new List<Streets>();
            var cit = cities.GetAll().ToList();
            var Id = cit.First().CityId;       
            zips = zipCodes.FindBy(p => p.CityId == Id).OrderBy(p => p.ZipCode).ToList();  
            str =streets.FindBy(p => p.CityId == Id).ToList();
            ViewBag.CityId = new SelectList(cit, "CityId", "CityName", Id);
            ViewBag.StreetId = new SelectList(str, "StreetId", "StreetName", address.StreetId);
            ViewBag.ZipCodeId = new SelectList(zips, "ZipCodeId", "ZipCode", address.ZipCodeId);
            return View(address);
        }   
    }
}
