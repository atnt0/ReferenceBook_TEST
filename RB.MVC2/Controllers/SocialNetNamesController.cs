using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
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

        //public ActionResult<IEnumerable<object>> Paging(int countRecord, int page)
        //{
        //    var address = context.Address.Skip(countRecord * (page - 1)).Take(countRecord);
        //    var query = from a in address
        //                join s in context.Street on a.StreetId equals s.StreetId into adstr
        //                from st in adstr.DefaultIfEmpty()
        //                join sub in context.Subdivision on a.SubdivisionId equals sub.SubdivisionId into subd
        //                from sb in subd.DefaultIfEmpty()
        //                select new
        //                {
        //                    AddressId = a.AddressId,
        //                    House = a.House,
        //                    СountFloor = a.СountFloor,
        //                    StreetName = st.StreetName,
        //                    SubdivisionName = sb.SubdivisionName
        //                };
        //    return Ok(query);
        //}
       // [Route("SocialNetNames/Index/{Page}")]
        public IActionResult Index(int Page)
        {
            if (Page <= 0) Page = 1;      
            int countrecord = 5;
            var model = socialNetNames.GetAll().Skip(countrecord * (Page - 1)).Take(countrecord).OrderBy(p => p.SocialNetName);
            int countRows = socialNetNames.GetAll().Count();
            int count = model.Count();
            if (count == 0)
            {
                Page = Page - 1;               
               return RedirectToAction("Index", new RouteValueDictionary(
                    new { controller = "SocialNetNames", action = "Index", Page = Page }));
            }
            ViewData["CountPages"] = Math.Ceiling((double)(countRows / countrecord));
            ViewData["IsInt"] = countRows % countrecord == 0 ? true : false;
            ViewData["Page"] = Page;
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
