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
        IGenericRepository<Cities, Guid> cities;
        AdapterCities_To_CitiesPOCO adapterCities_To_CitiesPOCO;

        public CitiesController(IGenericRepository<Cities, Guid> cities, AdapterCities_To_CitiesPOCO adapterCities_To_CitiesPOCO)
        {
            this.cities = cities;
            this.adapterCities_To_CitiesPOCO = adapterCities_To_CitiesPOCO;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Cities>> GetAll()
        {
            try
            {
                var citiesList = cities.GetAll().ToList();
                List<CitiesPOCO> citiesPOCOs = new List<CitiesPOCO>();
                foreach (var item in citiesList)
                {
                    citiesPOCOs.Add(adapterCities_To_CitiesPOCO.GetCitiesPOCO(item));
                }
                return Ok(citiesPOCOs);
            }
            catch (Exception)
            {
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpGet("{id}")]
        public ActionResult<Cities> Get(Guid id)
        {
            try
            {
                var city = cities.Get(id);
                if (city == null)
                {
                    return NotFound();
                }
                var citiesPOCO = adapterCities_To_CitiesPOCO.GetCitiesPOCO(city);
                return Ok(citiesPOCO);
            }
            catch (Exception)
            {
                return StatusCode(500, "Internal server error");
            }
        }
    }
}
