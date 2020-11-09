using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using RB.MVC.Models;
using RB_DAL.Models;
using RB.DAL.Common;

namespace RB.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompaniesController : ControllerBase
    {
        readonly IGenericRepository<Companies, Guid> companies;

        public CompaniesController(IGenericRepository<Companies, Guid> companies)
        {
            this.companies = companies;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Companies>> GetAll()
        {
            try
            {
                var collection = companies.GetAll();
                return Ok(collection);
            }
            catch (Exception)
            {
                return StatusCode(500, "Server Error");
            }
        }

        [HttpGet("{id}")]
        public ActionResult<Companies> Get(Guid id)
        {
            try
            {
                Companies comp = companies.Get(id);
                if (comp == null)
                {
                    return NotFound($"By id={id} - object not found");
                }
                return Ok(comp);
            }
            catch (Exception)
            {
                return StatusCode(500, "Server Error");
            }
        }
    }
}
