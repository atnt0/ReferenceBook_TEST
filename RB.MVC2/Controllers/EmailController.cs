using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Common;
using RB.DAL.Models;

namespace RB.MVC.Controllers
{
    public class EmailController : Controller
    {
        IGenericRepository<Emails, Guid> emails;
        public EmailController(IGenericRepository<Emails, Guid> emails)
        {
            this.emails = emails;
        }
        public ActionResult Create(Guid id)
        {
            ViewBag.CompanyId = id;
            return PartialView();
        }
        [HttpPost]
        public ActionResult CreateNewEmail(string emailName, Guid companyId)
        {
            Emails email = new Emails() { Email = emailName, CompanyId = companyId, CreatedOn = DateTime.Now, EmailId = Guid.NewGuid() };
            emails.Create(email);
            emails.Save();
            return PartialView(email);
        }

        public ActionResult Edit(Guid id)
        {
            var model = emails.Get(id);
            return PartialView(model);
        }

        [HttpPost]
        public ActionResult Save(Guid id, string fname)
        {
            var model = emails.Get(id);
            model.Email = fname;
            emails.Update(model);
            emails.Save();
            return PartialView(model);
        }
        [HttpPost]
        public ActionResult Delete(Guid id)
        {
            try
            {
                emails.Delete(id);
                emails.Save();
                return Json("OK");
            }
            catch (Exception exc)
            {
                return Json($"Bad\n{exc}");
            }
        }
    }
}
