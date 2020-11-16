using RB.DAL.Common;
using RB.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static RB.MVC.Models.DayWeekTimeTablesPoco;

namespace RB.MVC.Models
{
    public class CompanyTimeTablesCollectionPoco // array days of company
    {
        //ICollection<DayWeekTimeTables> timetables;

        public Guid CompanyId { get; set; }

        public List<DayWeekTimeTablesPoco> Days { get; set; }

        public Dictionary<string, string> Hours { get; set; }
        public Dictionary<string, string> Minutes { get; set; }


        public CompanyTimeTablesCollectionPoco()
        {
            //this.timetables = new List<DayWeekTimeTables>();

            GenerateOptionsForHoursAndMinutes();
        }


        public CompanyTimeTablesCollectionPoco(ICollection<DayWeekTimeTables> timetables, Guid companyId)
        {
            //ICollection timetables = timetables;
            this.CompanyId = companyId;

            Days = new List<DayWeekTimeTablesPoco>();

            GenerateOptionsForHoursAndMinutes();

            var listDaysOfWeek = new List<DaysWeek>() {
                DaysWeek.Monday, DaysWeek.Tuesday, DaysWeek.Wednesday, DaysWeek.Thursday,
                DaysWeek.Friday, DaysWeek.Saturday, DaysWeek.Sunday,
            };
            int i = 0;
            listDaysOfWeek.ForEach(dayWeek => {
                var dayTime = timetables.FirstOrDefault(item => (DaysWeek)Convert.ToInt32(item.WeekDay) == dayWeek);
                i++;
                Days.Add((dayTime != null ? new DayWeekTimeTablesPoco(dayTime, i) : new DayWeekTimeTablesPoco(dayWeek, i)));
            });

        }



        private void GenerateOptionsForHoursAndMinutes()
        {
            Hours = new Dictionary<string, string>();
            Minutes = new Dictionary<string, string>();

            string postFixHours = " ч";
            for (int ki = 0; ki < 24; ki++)
            {
                var value = (ki < 10 ? $"0{ki}" : $"{ki}");
                Hours.Add($"{value}", $"{value}{postFixHours}");
            }

            string postFixMinutes = " м";
            for (int kj = 0; kj < 60; kj += 5)
            {
                var value = (kj < 10 ? $"0{kj}" : $"{kj}");
                Minutes.Add($"{value}", $"{value}{postFixMinutes}");
            }
        }



    }
}
