using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Common;
using RB.DAL.Models;

namespace RB.MVC.Controllers
{
    public class PhotoController : Controller
    {
        IGenericRepository<Companies, Guid> companies;
        IGenericRepository<Photos, Guid> photos;
        IWebHostEnvironment env;

        public PhotoController(IGenericRepository<Companies, Guid> companies, IGenericRepository<Photos, Guid> photos, IWebHostEnvironment env)
        {
            this.companies = companies;
            this.photos = photos;
            this.env = env;
        }
        public IActionResult Index(Guid id)
        {
            TempData["CompanyId"] = id;
            string path = @"\Files\";
            ViewBag.Path = path;
            ViewBag.Company = companies.Get(id);
            var model = photos.FindBy(p => p.CompanyId == id);
            return View(model);
        }

        public async Task<IActionResult> ManyFileUpload(IEnumerable<IFormFile> files)
        {
            Guid CompanyId = Guid.Empty;
            if ((Guid)TempData["CompanyId"] != Guid.Empty)
            {
                CompanyId = (Guid)TempData["CompanyId"];
            }
            else
            {
                return new EmptyResult();
            }
            await SaveData(files, CompanyId);
            return RedirectToAction("Index", new { id = CompanyId });
        }

        [NonAction]
        private async Task SaveData(IEnumerable<IFormFile> files, Guid CompanyId)
        {
            foreach (IFormFile file in files)
            {
                if (file != null && file.Length > 0)
                {
                    string extFile = Path.GetExtension(file.FileName);
                    string fileName = Guid.NewGuid().ToString() + extFile;
                    // string path = @"\Files\";
                    Photos photo = new Photos { CompanyId = CompanyId, FileName = fileName, PhotoId = Guid.NewGuid() }; //Path.Combine("\\Files", fileName) };
                    photos.Create(photo);
                    photos.Save();
                    string photopath = Path.Combine(env.WebRootPath, "Files", fileName);
                    using (var fileStream = new FileStream(photopath, FileMode.Create))
                    {
                        await file.CopyToAsync(fileStream);
                    }
                }
            }
        }
    }
}
