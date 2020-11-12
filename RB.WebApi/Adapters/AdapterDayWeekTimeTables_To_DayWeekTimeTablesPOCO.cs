using RB.DAL.Common;
using RB.DAL.Models;
using RB.WebApi.Models;
using System;

namespace RB.WebApi.Adapters
{
    public class AdapterDayWeekTimeTables_To_DayWeekTimeTablesPOCO
    {
        IGenericRepository<DayWeekTimeTables, Guid> dayweektimeTables;
        AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO;
        public AdapterDayWeekTimeTables_To_DayWeekTimeTablesPOCO(IGenericRepository<DayWeekTimeTables, Guid> dayweektimeTables, AdapterCompanies_To_CompaniesPOCO adapterCompanies_To_CompaniesPOCO)
        {
            this.dayweektimeTables = dayweektimeTables;
            this.adapterCompanies_To_CompaniesPOCO = adapterCompanies_To_CompaniesPOCO;
        }
        public DayWeekTimeTablesPOCO GetDayWeekTimeTablesPOCO(DayWeekTimeTables dayweektimeTables)
        {
            DayWeekTimeTablesPOCO dayweektimeTablesPOCO = new DayWeekTimeTablesPOCO()
            {
                Company = adapterCompanies_To_CompaniesPOCO.GetCompaniesPOCO(dayweektimeTables.Company),
                CompanyId = dayweektimeTables.CompanyId,
                DayEnd = dayweektimeTables.DayEnd,
                DayStart = dayweektimeTables.DayStart,
                DayWeekTimeTableId = dayweektimeTables.DayWeekTimeTableId,
                LunchBreakEnd = dayweektimeTables.LunchBreakEnd,
                LunchBreakStart = dayweektimeTables.LunchBreakStart,
                WeekDay = dayweektimeTables.WeekDay
            };
            return dayweektimeTablesPOCO;
        }
    }
}
