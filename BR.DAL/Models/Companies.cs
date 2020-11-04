using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB.DAL.Models
{
    public partial class Companies
    {
        public Companies()
        {
            CompanyCategories = new HashSet<CompanyCategories>();
            CompanySubcategories = new HashSet<CompanySubcategories>();
            Emails = new HashSet<Emails>();
            InverseParentCompany = new HashSet<Companies>();
            Phones = new HashSet<Phones>();
            Photos = new HashSet<Photos>();
            SocialNets = new HashSet<SocialNets>();
            UserCompanies = new HashSet<UserCompanies>();
        }

        [Key]
        public Guid CompanyId { get; set; }
        [Required]
        [StringLength(256)]
        public string CompanyName { get; set; }
        public Guid? ParentCompanyId { get; set; }
        [StringLength(200)]
        public string DescriptionShort { get; set; }
        [StringLength(2000)]
        public string DescriptionFull { get; set; }
        [StringLength(256)]
        public string WebSite { get; set; }

        [ForeignKey(nameof(ParentCompanyId))]
        [InverseProperty(nameof(Companies.InverseParentCompany))]
        public virtual Companies ParentCompany { get; set; }
        [InverseProperty("Company")]
        public virtual ICollection<CompanyCategories> CompanyCategories { get; set; }
        [InverseProperty("Company")]
        public virtual ICollection<CompanySubcategories> CompanySubcategories { get; set; }
        [InverseProperty("Company")]
        public virtual ICollection<Emails> Emails { get; set; }
        [InverseProperty(nameof(Companies.ParentCompany))]
        public virtual ICollection<Companies> InverseParentCompany { get; set; }
        [InverseProperty("Company")]
        public virtual ICollection<Phones> Phones { get; set; }
        [InverseProperty("Company")]
        public virtual ICollection<Photos> Photos { get; set; }
        [InverseProperty("Company")]
        public virtual ICollection<SocialNets> SocialNets { get; set; }
        [InverseProperty("Company")]
        public virtual ICollection<UserCompanies> UserCompanies { get; set; }
    }
}
