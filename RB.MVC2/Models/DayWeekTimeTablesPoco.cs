using RB.DAL.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace RB.MVC.Models
{
    public class DayWeekTimeTablesPoco
    {


        public int Index { get; set; }
        public Guid DayWeekTimeTableId { get; set; }
        public Guid? CompanyId { get; set; }

        [Display(Name = "")]
        public bool IsDayOn { get; set; }

        [Display(Name = "")]
        public bool IsLunchBreakOn { get; set; }

        public string WeekDay { get; set; }
        public string WeekDayLocal { get; set; }

        public string DayStartHours { get; set; }
        public string DayStartMinutes { get; set; }
        public string DayEndHours { get; set; }
        public string DayEndMinutes { get; set; }

        public string LunchBreakStartHours { get; set; }
        public string LunchBreakStartMinutes { get; set; }
        public string LunchBreakEndHours { get; set; }
        public string LunchBreakEndMinutes { get; set; }

        //public DayWeekTimeTables DayWeekTimeTables { get; set; }


        // конструктор для существующих "рабочих" дней
        public DayWeekTimeTablesPoco()
        {

        }

        public DayWeekTimeTablesPoco(DayWeekTimeTables DayWeekTimeTables, int index)
        {
            //this.DayWeekTimeTables = DayWeekTimeTables;

            this.Index = index;

            //this.IsDayOn = true;
            //this.IsLunchBreakOn = DayWeekTimeTables.LunchBreakStart != null; // ? true : false

            this.DayWeekTimeTableId = DayWeekTimeTables.DayWeekTimeTableId;
            this.CompanyId = DayWeekTimeTables.CompanyId;

            SetWeekDay(DayWeekTimeTables.WeekDay);

            int dayIsSet = 0;
            if (DayWeekTimeTables.DayStart == string.Empty || DayWeekTimeTables.DayStart.Length == 1)
            {
                this.DayStartHours = string.Empty;
                this.DayStartMinutes = string.Empty;
            }
            else
            {
                var d1 = DayWeekTimeTables.DayStart.Split(new char[] { ':' });
                this.DayStartHours = d1[0];
                this.DayStartMinutes = d1[1];
                dayIsSet++;
            }

            if (DayWeekTimeTables.DayEnd == string.Empty || DayWeekTimeTables.DayEnd.Length == 1)
            {
                this.DayEndHours = string.Empty;
                this.DayEndMinutes = string.Empty;
            }
            else
            {
                var d2 = DayWeekTimeTables.DayEnd.Split(new char[] { ':' });
                this.DayEndHours = d2[0];
                this.DayEndMinutes = d2[1];
                dayIsSet++;
            }

            if (dayIsSet == 2)
            {
                this.IsDayOn = true;
            }



            int lunchBreakIsSet = 0;
            if (DayWeekTimeTables.LunchBreakStart == string.Empty || DayWeekTimeTables.LunchBreakStart.Length == 1)
            {
                this.LunchBreakStartHours = string.Empty;
                this.LunchBreakStartMinutes = string.Empty;
            }
            else
            {
                var d3 = DayWeekTimeTables.LunchBreakStart.Split(new char[] { ':' });
                this.LunchBreakStartHours = d3[0];
                this.LunchBreakStartMinutes = d3[1];
                lunchBreakIsSet++;
            }


            if (DayWeekTimeTables.LunchBreakEnd == string.Empty || DayWeekTimeTables.LunchBreakEnd.Length == 1)
            {
                this.LunchBreakEndHours = string.Empty;
                this.LunchBreakEndMinutes = string.Empty;
            }
            else
            {
                var d3 = DayWeekTimeTables.LunchBreakEnd.Split(new char[] { ':' });
                this.LunchBreakEndHours = d3[0];
                this.LunchBreakEndMinutes = d3[1];
                lunchBreakIsSet++;
            }

            if (dayIsSet == 2 && lunchBreakIsSet == 2)
            {
                this.IsLunchBreakOn = true;
            }

        }

        // конструктор для несуществующих "рабочих" дней
        public DayWeekTimeTablesPoco(DaysWeek daysWeek, int index)
        {
            this.Index = index;

            SetWeekDay(daysWeek);
        }


        private void SetWeekDay(DaysWeek dayWeek)
        {
            SetWeekDay($"{((int)dayWeek)}");
        }

        private void SetWeekDay(string str)
        {
            int weekDay = Convert.ToInt32(str);
            this.WeekDay = $"{weekDay}";
            this.WeekDayLocal = Enum.GetName(typeof(DaysWeek), (DaysWeek)weekDay);
        }





        public enum DaysWeek
        {
            Monday = 1,
            Tuesday = 2,
            Wednesday = 3,
            Thursday = 4,
            Friday = 5,
            Saturday = 6,
            Sunday = 7,
        }
    }
}
