using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RB_DAL.Models
{
    public partial class Companies
    {
        public Companies()
        {
            CompaniesCategories = new HashSet<CompaniesCategories>();
            CompaniesSubcategories = new HashSet<CompaniesSubcategories>();
            Emails = new HashSet<Emails>();
            InverseParentCompany = new HashSet<Companies>();
            Phones = new HashSet<Phones>();
            Photos = new HashSet<Photos>();
            SocialNets = new HashSet<SocialNets>();
            UsersCompanies = new HashSet<UsersCompanies>();
        }

        [Key]
        public Guid CompanyId { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? CreatedOn { get; set; }
        [Required]
        [StringLength(256)]
        public string CompanyName { get; set; }
        public Guid? ParentCompanyId { get; set; }
        [Required]
        [StringLength(256)]
        public string Director { get; set; }
        [StringLength(200)]
        public string DescriptionShort { get; set; }
        [StringLength(2000)]
        public string DescriptionFull { get; set; }
        [StringLength(256)]
        public string WebSite { get; set; }
        public Guid? AddressId { get; set; }
        public int Popularity { get; set; }

        [ForeignKey(nameof(AddressId))]
        [InverseProperty(nameof(Addresses.Companies))]
        public virtual Addresses Address { get; set; }
        [ForeignKey(nameof(ParentCompanyId))]
        [InverseProperty(nameof(Companies.InverseParentCompany))]
        public virtual Companies ParentCompany { get; set; }
        [InverseProperty("Company")]
        public virtual ICollection<CompaniesCategories> CompaniesCategories { get; set; }
        [InverseProperty("Company")]
        public virtual ICollection<CompaniesSubcategories> CompaniesSubcategories { get; set; }
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
        public virtual ICollection<UsersCompanies> UsersCompanies { get; set; }
    }
}
