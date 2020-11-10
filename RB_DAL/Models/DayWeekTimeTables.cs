using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB.DAL.Models
{
    public partial class DayWeekTimeTables
    {
        [Key]
        public Guid DayWeekTimeTableId { get; set; }
        public Guid? CompanyId { get; set; }
        [Required]
        [StringLength(16)]
        public string WeekDay { get; set; }
        [Required]
        [StringLength(8)]
        public string DayStart { get; set; }
        [Required]
        [StringLength(8)]
        public string DayEnd { get; set; }
        [StringLength(8)]
        public string LunchBreakStart { get; set; }
        [StringLength(8)]
        public string LunchBreakEnd { get; set; }

        [ForeignKey(nameof(CompanyId))]
        [InverseProperty(nameof(Companies.DayWeekTimeTables))]
        public virtual Companies Company { get; set; }
    }
}
