using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Adapters;
using RB.WebApi.Models;

namespace RB.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CitiesController : ControllerBase
    {
        readonly IGenericRepository<Cities, Guid> cities;
        readonly Companies_To_CompaniesPOCO companies_To;

        public CitiesController(IGenericRepository<Cities, Guid> cities, Companies_To_CompaniesPOCO companies_To)
        {
            this.cities = cities;
            this.companies_To = companies_To;
        }

        [HttpGet]
        public ActionResult<IQueryable<Cities>> GetAll()
        {
            var citiesList = cities.GetAll().ToList();
            List<CitiesPOCO> citiesPOCOs = new List<CitiesPOCO>();
            foreach (var item in citiesList)
            {
                citiesPOCOs.Add(companies_To.GetCitiesPOCO(item));
            }
            return Ok(citiesPOCOs);
        }

        [HttpGet("{id}")]
        public ActionResult<Cities> Get(Guid id)
        {
            var city = cities.Get(id);
            if (city == null)
            {
                return NotFound();
            }
            var citiesPOCO = companies_To.GetCitiesPOCO(city);
            return Ok(citiesPOCO);
        }
    }
}
