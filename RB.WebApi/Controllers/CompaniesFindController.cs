using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Models;

namespace RB.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompaniesFindController : ControllerBase
    {
        //IGenericRepository<Companies, Guid> companies;
        private readonly RBContext _context;

        public CompaniesFindController(RBContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("Find/{compName}")]
        public ActionResult<IEnumerable<object>> FindByCompName(string compName)
        {
            var query = _context.Companies
                .Where(c => c.CompanyName.Contains(compName))
                .Select(c => new
                {
                    c.CompanyId,
                    c.CompanyName
                });

            return Ok(query);
        }

        [HttpGet]
        [Route("Find/{director}")]
        public ActionResult<IEnumerable<object>> FindByDirector(string director)
        {
            var query = _context.Companies
                .Where(d => d.Director.Contains(director))
                .Select(d => new
                {
                    d.CompanyId,
                    d.Director
                });

            return Ok(query);
        }

        [HttpGet]
        [Route("Find/{descrShort}")]
        public ActionResult<IEnumerable<object>> FindByDescrShort(string descrShort)
        {
            var query = _context.Companies
                .Where(d => d.DescriptionShort.Contains(descrShort))
                .Select(d => new
                {
                    d.CompanyId,
                    d.DescriptionShort
                });

            return Ok(query);
        }

        [HttpGet]
        [Route("Find/{descrFull}")]
        public ActionResult<IEnumerable<object>> FindByDescrFull(string descrFull)
        {
            var query = _context.Companies
                .Where(d => d.DescriptionFull.Contains(descrFull))
                .Select(d => new
                {
                    d.CompanyId,
                    d.DescriptionFull
                });

            return Ok(query);
        }

        [HttpGet]
        [Route("Find/{webSite}")]
        public ActionResult<IEnumerable<object>> FindBySite(string webSite)
        {
            var query = _context.Companies
                .Where(w => w.WebSite.Contains(webSite))
                .Select(w => new
                {
                    w.CompanyId,
                    w.WebSite
                });

            return Ok(query);
        }
    }
}
