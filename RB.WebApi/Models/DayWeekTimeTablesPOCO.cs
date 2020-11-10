using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RB.WebApi.Models
{
    public class DayWeekTimeTablesPOCO
    {
        public Guid DayWeekTimeTableId { get; set; }
        public Guid? CompanyId { get; set; }
        public string WeekDay { get; set; }
        public string DayStart { get; set; }
        public string DayEnd { get; set; }
        public string LunchBreakStart { get; set; }
        public string LunchBreakEnd { get; set; }
        public CompaniesPOCO Company { get; set; }

    }
}
