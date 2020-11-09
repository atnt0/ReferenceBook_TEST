using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Common;
using RB_DAL.Models;

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
        //[NonAction]
        //private Employee DbCreateNewEmp(string fname, string lname, string bday, string inn)
        //{
        //    SqlParameter strinn;
        //    if (inn == null)
        //        strinn = new SqlParameter("@inn", DBNull.Value);
        //    else
        //        strinn = new SqlParameter("@inn", $"{inn}");
        //    return context.Employee.FromSqlRaw($@"
        //        INSERT INTO Employee(FirstName,LastName,Birthday,Inn) VALUES 
        //            ('{fname}','{lname}','{bday}',@inn);
        //        SELECT * FROM Employee WHERE EmployeeId=SCOPE_IDENTITY();
        //    ", strinn).ToList().FirstOrDefault();
        //}
    }
}
