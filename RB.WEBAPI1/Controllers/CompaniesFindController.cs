using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Models;

namespace RB.WEBAPI1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompaniesFindController : ControllerBase
    {
        private readonly RBContext _context;

        public CompaniesFindController(RBContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("Find/{compName}")]
        public ActionResult<IEnumerable<object>> FindByCompName(string compName)
        {
            try
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
            catch (Exception)
            {
                return StatusCode(500, "Server Error");
            }
        }

        [HttpGet]
        [Route("Find/{director}")]
        public ActionResult<IEnumerable<object>> FindByDirector(string director)
        {
            try
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
            catch (Exception)
            {
                return StatusCode(500, "Server Error");
            }
        }

        [HttpGet]
        [Route("Find/{descrShort}")]
        public ActionResult<IEnumerable<object>> FindByDescrShort(string descrShort)
        {
            try
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
            catch (Exception)
            {
                return StatusCode(500, "Server Error");
            }
        }

        [HttpGet]
        [Route("Find/{descrFull}")]
        public ActionResult<IEnumerable<object>> FindByDescrFull(string descrFull)
        {
            try
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
            catch (Exception)
            {
                return StatusCode(500, "Server Error");
            }
        }

        [HttpGet]
        [Route("Find/{webSite}")]
        public ActionResult<IEnumerable<object>> FindBySite(string webSite)
        {
            try
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
            catch (Exception)
            {
                return StatusCode(500, "Server Error");
            }
        }
    }
}
