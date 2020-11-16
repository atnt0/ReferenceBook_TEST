using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Common;
using RB.DAL.Models;

namespace RB.WEBAPI1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompaniesController : ControllerBase
    {
        readonly IGenericRepository<Companies, Guid> comp;

        public CompaniesController(IGenericRepository<Companies, Guid> companies)
        {
            comp = companies;
        }

        [HttpGet]
        public ActionResult<IQueryable<Companies>> GetAll()
        {
            try
            {
                var collection = comp.GetAll();
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
                Companies compan = comp.Get(id);
                if (comp == null)
                {
                    return NotFound($"By id={id} - object not found");
                }
                return Ok(compan);
            }
            catch (Exception)
            {
                return StatusCode(500, "Server Error");
            }
        }
    }
}
