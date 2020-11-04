using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB.DAL.Models
{
    public partial class UserCompanies
    {
        [Key]
        public Guid UserCompaniesId { get; set; }
        public Guid UserId { get; set; }
        public Guid? CompanyId { get; set; }

        [ForeignKey(nameof(CompanyId))]
        [InverseProperty(nameof(Companies.UserCompanies))]
        public virtual Companies Company { get; set; }
    }
}
