using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Common;
using RB.DAL.Models;

namespace RB.MVC2.Controllers
{
    public class CategoryController : Controller
    {
        IGenericRepository<Categories, int> categories;
        public CategoryController(IGenericRepository<Categories, int> categories)
        {
            this.categories = categories;
        }
        public IActionResult Index()
        {
            var model = categories.GetAll();
            return View(model);
        }

        public ActionResult Create()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult CreateNewCat(string categoryName)
        {
            Categories category = new Categories() { CategoryName = categoryName, CategoryId = 0 };
            categories.Create(category);
            categories.Save();
            return PartialView(category);
        }

        public ActionResult Edit(int id)
        {        
            var model = categories.Get(id);       
            return PartialView(model);
        }

        [HttpPost]
        public ActionResult Save(int id, string fname)
        {        
            var model = categories.Get(id);
            model.CategoryName = fname;
            categories.Update(model);
            categories.Save();   
            return PartialView(model);
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {        
            try
            {
                categories.Delete(id);
                categories.Save();
                return Json("OK");
            }
            catch (Exception exc)
            {
                return Json($"Bad\n{exc}");
            }
        }

    }
}
