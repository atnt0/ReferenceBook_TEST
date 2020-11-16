using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using RB.DAL.Common;
using RB.DAL.Models;
using RB.MVC.Models;
using static RB.MVC.Models.DayWeekTimeTablesPoco;

namespace RB.MVC.Controllers
{
    public class TimeTableController : Controller
    {
        IGenericRepository<Companies, Guid> companies;
        IGenericRepository<DayWeekTimeTables, Guid> timetables;

        public TimeTableController(IGenericRepository<Companies, Guid> companies, IGenericRepository<DayWeekTimeTables, Guid> timetables)        
        {
            this.companies = companies;
            this.timetables = timetables;        
        }


        // пока не используется
        //public IActionResult Index(Guid companyId)
        //{
        //    var listOriginalDays = timetables.FindBy(p => p.CompanyId == companyId).ToList();
        //    var listNew = new List<DayWeekTimeTablesPoco>();

        //    var listDaysOfWeek = new List<DaysWeek>() {
        //        DaysWeek.Monday,
        //        DaysWeek.Tuesday,
        //        DaysWeek.Wednesday,
        //        DaysWeek.Thursday,
        //        DaysWeek.Friday,
        //        DaysWeek.Saturday,
        //        DaysWeek.Sunday,
        //    };

        //    listDaysOfWeek.ForEach(dayWeek => {
        //        var dayTime = listOriginalDays.FirstOrDefault(item => (DaysWeek)Convert.ToInt32(item.WeekDay) == dayWeek );

        //        if (dayTime != null)
        //            listNew.Add(new DayWeekTimeTablesPoco(dayTime));
        //        else
        //            listNew.Add(new DayWeekTimeTablesPoco(dayWeek));
        //    });

        //    return PartialView(listNew);
        //}

        // get view
        public IActionResult GetTimeTables(Guid companyId)
        {
            TempData["CompanyId"] = companyId;

            var listOriginalDays = timetables.FindBy(p => p.CompanyId == companyId).ToList();
            var timeTablesCollection = new CompanyTimeTablesCollectionPoco(listOriginalDays, companyId);

            ViewBag.CompanyId = companyId;
            ViewBag.ListHours = timeTablesCollection.Hours;
            ViewBag.ListMinutes = timeTablesCollection.Minutes;
            return PartialView("GetTimeTables", timeTablesCollection.Days);
        }

        // get edit
        public IActionResult Edit(Guid companyId)
        {
            var listOriginalDays = timetables.FindBy(p => p.CompanyId == companyId).ToList();
            var timeTablesCollection = new CompanyTimeTablesCollectionPoco(listOriginalDays, companyId);

            ViewBag.CompanyId = companyId;
            ViewBag.ListHours = timeTablesCollection.Hours;
            ViewBag.ListMinutes = timeTablesCollection.Minutes;
            return PartialView("Edit", timeTablesCollection.Days);
        }

        // save and get view
        [HttpPost]
        public IActionResult EditTimeTable(IEnumerable<DayWeekTimeTablesPoco> Days, Guid CompanyId)
        {
            if (Days == null || CompanyId == Guid.Empty)
                return BadRequest();

            foreach (var dayWeek in Days)
            {
                string DayStart = string.Empty, DayEnd = string.Empty, LunchBreakStart = string.Empty, LunchBreakEnd = string.Empty;

                if (dayWeek.IsDayOn)
                {

                    if (dayWeek.DayStartHours == string.Empty && dayWeek.DayStartMinutes == string.Empty)
                    {
                        DayStart = string.Empty;
                    }
                    else
                    {
                        DayStart = $"{dayWeek.DayStartHours}:{dayWeek.DayStartMinutes}";
                    }

                    if (dayWeek.DayEndHours == string.Empty && dayWeek.DayEndMinutes == string.Empty)
                    {
                        DayEnd = string.Empty;
                    }
                    else
                    {
                        DayEnd = $"{dayWeek.DayEndHours}:{dayWeek.DayEndMinutes}";
                    }


                    if (dayWeek.IsLunchBreakOn)
                    {
                        if (dayWeek.LunchBreakStartHours == string.Empty && dayWeek.LunchBreakStartMinutes == string.Empty)
                        {
                            LunchBreakStart = string.Empty;
                        }
                        else
                        {
                            LunchBreakStart = $"{dayWeek.LunchBreakStartHours}:{dayWeek.LunchBreakStartMinutes}";
                        }

                        if (dayWeek.LunchBreakEndHours == string.Empty && dayWeek.LunchBreakEndMinutes == string.Empty)
                        {
                            LunchBreakEnd = string.Empty;
                        }
                        else
                        {
                            LunchBreakEnd = $"{dayWeek.LunchBreakEndHours}:{dayWeek.LunchBreakEndMinutes}";
                        }
                    }
                    else
                    {
                        LunchBreakStart = string.Empty;
                        LunchBreakEnd = string.Empty;
                    }
                }
                else
                {
                    DayStart = string.Empty;
                    DayEnd = string.Empty;
                    LunchBreakStart = string.Empty;
                    LunchBreakEnd = string.Empty;
                }


                if (dayWeek.DayWeekTimeTableId == Guid.Empty)
                {
                    DayWeekTimeTables timeTable = new DayWeekTimeTables()
                    {
                        DayWeekTimeTableId = Guid.NewGuid(),
                        CompanyId = CompanyId,
                        WeekDay = dayWeek.WeekDay,
                        DayStart = DayStart,
                        DayEnd = DayEnd,
                        LunchBreakStart = LunchBreakStart,
                        LunchBreakEnd = LunchBreakEnd,
                    };

                    timetables.Create(timeTable);
                    timetables.Save();
                }
                else
                {
                    //timetables.Update(timeTable); // ошибка с "tracking'ом"
                    //timetables.Save();
                    var aergh = timetables.FindBy(tt => tt.DayWeekTimeTableId == dayWeek.DayWeekTimeTableId).FirstOrDefault();
                    if (aergh != null)
                    {
                        Guid TimeTableGuid = dayWeek.DayWeekTimeTableId;

                        DayWeekTimeTables timeTable = new DayWeekTimeTables()
                        {
                            DayWeekTimeTableId = TimeTableGuid,
                            CompanyId = CompanyId,
                            WeekDay = dayWeek.WeekDay,
                            DayStart = DayStart,
                            DayEnd = DayEnd,
                            LunchBreakStart = LunchBreakStart,
                            LunchBreakEnd = LunchBreakEnd,
                        };

                        timetables.Delete(TimeTableGuid);
                        //timetables.Save();

                        timetables.Create(timeTable);
                        timetables.Save();
                    }
                    //}
                    //else // если день "выходной" - удалить запись
                    //{
                    //    Guid TimeTableGuid = dayWeek.DayWeekTimeTableId;
                    //    if (dayWeek.DayWeekTimeTableId != Guid.Empty)
                    //    {
                    //        var timeTable = timetables.FindBy(tt => tt.DayWeekTimeTableId == dayWeek.DayWeekTimeTableId).FirstOrDefault();
                    //        if (timeTable != null)
                    //        {
                    //            //timetables.Delete(TimeTableGuid);
                    //            //timetables.Save();
                    //        }
                    //    }
                    //}

                }

            }

            var listOriginalDays = timetables.FindBy(p => p.CompanyId == CompanyId).ToList();
            var timeTablesCollection = new CompanyTimeTablesCollectionPoco(listOriginalDays, CompanyId);

            ViewBag.CompanyId = CompanyId;
            return PartialView("GetTimeTables", timeTablesCollection.Days);

        }
    }
}
