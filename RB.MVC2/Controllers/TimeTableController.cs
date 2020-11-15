using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Common;
using RB.DAL.Models;

namespace RB.MVC.Controllers
{
    public class TimeTableController : Controller
    {
        IGenericRepository<Companies, Guid> companies;
        IGenericRepository<DayWeekTimeTables, Guid> timetables;     
        public TimeTableController(IGenericRepository<Companies, Guid> companies, IGenericRepository<DayWeekTimeTables, Guid> timetables)        
        {
            this.companies = companies;
            this.timetables = timetables;        
        }
        public IActionResult Index(Guid id)
        {
            var model = timetables.FindBy(p => p.CompanyId == id);
            return View(model);
        }

    }
}
