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
        IGenericRepository<Logos, Guid> logos;
        public PhotoController(IGenericRepository<Companies, Guid> companies, IGenericRepository<Photos, Guid> photos, 
            IWebHostEnvironment env, IGenericRepository<Logos, Guid> logos)
        {
            this.companies = companies;
            this.photos = photos;
            this.env = env;
            this.logos = logos;
        }
        public IActionResult Index(Guid id)
        {
            TempData["CompanyId"] = id;
            string path = @"\Files\Photos\";
            ViewBag.Path = path;
            ViewBag.Company = companies.Get(id);
            var model = photos.FindBy(p => p.CompanyId == id);
            return View(model);
        }
        public IActionResult AddPhoto(Guid id)
        {
            ViewBag.CompanyId = id; 
            return PartialView();
        }

        public IActionResult AddLogo(Guid id)
        {
            ViewBag.CompanyId = id; 
            return PartialView();
        }
        public async Task<IActionResult> UploadLogo(IFormFile file, Guid companyId)
        {
            string directory = "Logos";
            string path = @"\Files\Logos\";
            ViewBag.PathLogos = path;
            var model = await SaveFile(file, companyId, directory);
            var selectPhotos = photos.FindBy(p => p.CompanyId == companyId);
            var photoTmp = selectPhotos.Where(p => p.Logos.PhotoId == p.PhotoId).FirstOrDefault();          
            if (photoTmp!=null)
            {
                var logoTmp = logos.Get(photoTmp.PhotoId);
                logos.Delete(logoTmp.PhotoId);
                logos.Save();
                photos.Delete(photoTmp.PhotoId);
                photos.Save();
                var photoPath = Path.Combine(env.WebRootPath, "Files", "Logos", photoTmp.FileName);
                if (System.IO.File.Exists(photoPath))
                {
                    System.IO.File.Delete(photoPath);
                }              
            }             
                Logos logo = new Logos() { PhotoId = model.PhotoId };
                logos.Create(logo);
            logos.Save();
                photos.Get(model.PhotoId);
            
            return PartialView(model);            
        }

        public ActionResult DeleteLogo(Guid id)
        {
            try
            {
                var photoLogoDelete = photos.Get(id);           
                logos.Delete(photoLogoDelete.PhotoId);
                logos.Save();
                photos.Delete(photoLogoDelete.PhotoId);
                photos.Save();
                var photoPath = Path.Combine(env.WebRootPath, "Files", "Logos", photoLogoDelete.FileName);
                if (System.IO.File.Exists(photoPath))
                {
                    System.IO.File.Delete(photoPath);                  
                }
                return Json("OK");
            }
            catch (Exception exc)
            {
                return Json($"Bad\n{exc}");
            }
        }     
        public async Task<IActionResult> ManyFileUpload(IEnumerable<IFormFile> files, Guid companyId)
        {         
            string path = @"\Files\Photos\";
            ViewBag.Path = path;
            var model =   await SaveData(files, companyId);
            return PartialView(model); // 
        }
   
        [NonAction]
        private async Task<List<Photos>> SaveData(IEnumerable<IFormFile> files, Guid CompanyId)
        { 
            string directory = "Photos";
            List<Photos> listPhotos = new List<Photos>();
            foreach (IFormFile file in files)
            {
                var photo = await SaveFile(file, CompanyId, directory);
                    listPhotos.Add(photo);
                
            }
            return listPhotos;
        }
        [NonAction]
        private async Task<Photos> SaveFile(IFormFile file, Guid CompanyId, string directory)
        {
            Photos photoSave = new Photos();
           
                if (file != null && file.Length > 0)
                {
                    string extFile = Path.GetExtension(file.FileName);
                    string fileName = Guid.NewGuid().ToString() + extFile;
                    Photos photo = new Photos { CompanyId = CompanyId, FileName = fileName, PhotoId = Guid.NewGuid() }; //Path.Combine("\\Files", fileName) };
                    photos.Create(photo);
                    photos.Save();
                    string photopath = Path.Combine(env.WebRootPath, "Files", directory, fileName);
                    using (var fileStream = new FileStream(photopath, FileMode.Create))
                    {
                        await file.CopyToAsync(fileStream);
                    }
                photoSave = photo;
                }
            
            return photoSave;
        }


        public ActionResult Delete(Guid id)
        {
            try
            {
                var photoDelete = photos.Get(id);

                photos.Delete(id);
                photos.Save();
                var photoPath = Path.Combine(env.WebRootPath, "Files", "Photos", photoDelete.FileName);
                if (System.IO.File.Exists(photoPath))
                {
                    System.IO.File.Delete(photoPath);
                    //var fileInfo = new FileInfo(photoPath);
                    //fileInfo.Delete();
                }
                return Json("OK");
            }
            catch (Exception exc)
            {
                return Json($"Bad\n{exc}");
            }
        }      
    }
}
