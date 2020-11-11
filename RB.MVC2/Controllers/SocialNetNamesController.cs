using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Common;
using RB.DAL.Models;

namespace RB.MVC.Controllers
{
    public class SocialNetNamesController : Controller
    {
        IGenericRepository<SocialNetNames, int> socialNetNames;
        public SocialNetNamesController(IGenericRepository<SocialNetNames, int> socialNetNames)
        {
            this.socialNetNames = socialNetNames;
        }
        public IActionResult Index()
        {
            var model = socialNetNames.GetAll().OrderBy(p => p.SocialNetName);
            return View(model);
        }

        public ActionResult Create()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult CreateNewSocialNetName(string name)
        {
            SocialNetNames socialnetName = new SocialNetNames() { SocialNetName = name, SocialNetNameId = 0 };
            socialNetNames.Create(socialnetName);
            socialNetNames.Save();
            return PartialView(socialnetName);
        }

        public ActionResult Edit(int id)
        {
            var model = socialNetNames.Get(id);
            return PartialView(model);
        }

        [HttpPost]
        public ActionResult Save(int id, string fname)
        {
            var model = socialNetNames.Get(id);
            model.SocialNetName = fname;
            socialNetNames.Update(model);
            socialNetNames.Save();
            return PartialView(model);
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {
            try
            {
                socialNetNames.Delete(id);
                socialNetNames.Save();
                return Json("OK");
            }
            catch (Exception exc)
            {
                return Json($"Bad\n{exc}");
            }
        }
    }
}
