using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB_DAL.Models
{
    public partial class Logos
    {
        [Key]
        public Guid PhotoId { get; set; }

        [ForeignKey(nameof(PhotoId))]
        [InverseProperty(nameof(Photos.Logos))]
        public virtual Photos Photo { get; set; }
    }
}
