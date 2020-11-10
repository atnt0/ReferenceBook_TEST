using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Common;
using RB.DAL.Models;

namespace RB.MVC2.Controllers
{
    public class SubcategoryController : Controller
    {
        IGenericRepository<Subcategories, int> subCategories;
        public SubcategoryController(IGenericRepository<Subcategories, int> subCategories)
        {
            this.subCategories = subCategories;
        }
        public IActionResult Index()
        {
            var model = subCategories.GetAll().OrderBy(p=>p.SubcategoryName);
            return View(model);
        }

        public ActionResult Create()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult CreateNewSubCat(string subcategoryName)
        {
            Subcategories subcategory = new Subcategories() { SubcategoryName = subcategoryName, SubcategoryId = 0 };
            subCategories.Create(subcategory);
            subCategories.Save();
            return PartialView(subcategory);
        }

        public ActionResult Edit(int id)
        {
            var model = subCategories.Get(id);
            return PartialView(model);
        }

        [HttpPost]
        public ActionResult Save(int id, string fname)
        {      
            var model = subCategories.Get(id);
            model.SubcategoryName = fname;
            subCategories.Update(model);
            subCategories.Save();
            return PartialView(model);
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {
            try
            {
                subCategories.Delete(id);
                subCategories.Save();
                return Json("OK");
            }
            catch (Exception exc)
            {
                return Json($"Bad\n{exc}");
            }
        }
    }
}
