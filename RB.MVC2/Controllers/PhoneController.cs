using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Common;
using RB.DAL.Models;

namespace RB.MVC.Controllers
{
    public class PhoneController : Controller
    {
        IGenericRepository<Phones, Guid> phones;
        public PhoneController(IGenericRepository<Phones, Guid> phones)
        {
            this.phones = phones;
        }    
        public ActionResult Create(Guid id)
        {
            ViewBag.CompanyId = id;
            return PartialView();
        }
        [HttpPost]
        public ActionResult CreateNewPhone(string phoneNumber, Guid companyId)
        {
            Phones phone = new Phones() { PhoneNumber = phoneNumber, CompanyId = companyId, CreatedOn = DateTime.Now, PhoneId = Guid.NewGuid() };
            phones.Create(phone);
            phones.Save();
            return PartialView(phone);
        }

        public ActionResult Edit(Guid id)
        {
            var model = phones.Get(id);
            return PartialView(model);
        }

        [HttpPost]
        public ActionResult Save(Guid id, string fname)
        {         
            var model = phones.Get(id);
            model.PhoneNumber = fname;
            phones.Update(model);
            phones.Save();
            return PartialView(model);
        }
        [HttpPost]
        public ActionResult Delete(Guid id)
        {
            try
            {
                phones.Delete(id);
                phones.Save();
                return Json("OK");
            }
            catch (Exception exc)
            {
                return Json($"Bad\n{exc}");
            }
        }
    }
}
