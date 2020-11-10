﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using RB.DAL.Common;
using RB.DAL.Models;

namespace RB.MVC.Controllers
{
    public class ZipCodeController : Controller
    {
        IGenericRepository<ZipCodes, Guid> zipCodes;
        IGenericRepository<Cities, Guid> cities;
        public ZipCodeController(IGenericRepository<ZipCodes, Guid> zipCodes, IGenericRepository<Cities, Guid> cities)
        {
            this.zipCodes = zipCodes;
            this.cities = cities;
        }
        public IActionResult Index()
        {
            var model = zipCodes.GetAll();
            return View(model);
        }

        public ActionResult Create()
        {
            ViewBag.CityId = new SelectList(cities.GetAll(), "CityId", "CityName");
            return PartialView();
        }
        [HttpPost]
        public ActionResult CreateNewZip(string zipcodeName, Guid citId)
        {
            ZipCodes zipcode = new ZipCodes() { ZipCode = zipcodeName, CityId = citId, ZipCodeId =Guid.NewGuid() };
            zipCodes.Create(zipcode);
            zipCodes.Save();
            var cityName = cities.Get(citId).CityName;
            ViewBag.cityName = cityName;
            return PartialView(zipcode);
        }

        public ActionResult Edit(Guid id)
        {           
            var model = zipCodes.Get(id);
            ViewBag.CityId = new SelectList(cities.GetAll(), "CityId", "CityName", model.CityId);
            return PartialView(model);
        }

        [HttpPost]
        public ActionResult Save(Guid id, string fname, Guid cityId)
        {       
            var model = zipCodes.Get(id);
            model.ZipCode = fname;
            model.CityId = cityId;
            zipCodes.Update(model);
            zipCodes.Save();
            var cityName = cities.Get(cityId).CityName;
            ViewBag.cityName = cityName;
            return PartialView(model);
        }
        [HttpPost]
        public ActionResult Delete(Guid id)
        {
            try
            {
                zipCodes.Delete(id);
                zipCodes.Save();
                return Json("OK");
            }
            catch (Exception exc)
            {
                return Json($"Bad\n{exc}");
            }
        }

    }
}
