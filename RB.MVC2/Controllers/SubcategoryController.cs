using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Common;
using RB_DAL.Models;

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
            var model = subCategories.GetAll();
            return View(model);
        }

        public ActionResult Create()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult CreateNewCat(string subcategoryName)
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
        public ActionResult Save(string id, string fname)
        {
            int id1 = Convert.ToInt32(id);
            var model = subCategories.Get(id1);
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
                return Json("Bad");
            }
        }
    }
}
