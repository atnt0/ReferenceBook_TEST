using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB_DAL.Models
{
    public partial class UsersCompanies
    {
        [Key]
        public Guid UserCompanyId { get; set; }
        public Guid? UserId { get; set; }
        public Guid? CompanyId { get; set; }

        [ForeignKey(nameof(CompanyId))]
        [InverseProperty(nameof(Companies.UsersCompanies))]
        public virtual Companies Company { get; set; }
    }
}
