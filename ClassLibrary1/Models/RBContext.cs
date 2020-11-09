using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace RB_DAL.Models
{
    public partial class RBContext : DbContext
    {
        public RBContext()
        {
        }

        public RBContext(DbContextOptions<RBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Addresses> Addresses { get; set; }
        public virtual DbSet<Categories> Categories { get; set; }
        public virtual DbSet<Cities> Cities { get; set; }
        public virtual DbSet<Companies> Companies { get; set; }
        public virtual DbSet<CompaniesCategories> CompaniesCategories { get; set; }
        public virtual DbSet<CompaniesSubcategories> CompaniesSubcategories { get; set; }
        public virtual DbSet<DayWeekTimeTables> DayWeekTimeTables { get; set; }
        public virtual DbSet<Emails> Emails { get; set; }
        public virtual DbSet<Logos> Logos { get; set; }
        public virtual DbSet<Phones> Phones { get; set; }
        public virtual DbSet<Photos> Photos { get; set; }
        public virtual DbSet<SocialNetNames> SocialNetNames { get; set; }
        public virtual DbSet<SocialNets> SocialNets { get; set; }
        public virtual DbSet<Streets> Streets { get; set; }
        public virtual DbSet<Subcategories> Subcategories { get; set; }
        public virtual DbSet<UsersCompanies> UsersCompanies { get; set; }
        public virtual DbSet<ZipCodes> ZipCodes { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=localhost;Initial Catalog=DB_A69E5E_refbook;Integrated Security=SSPI;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Addresses>(entity =>
            {
                entity.HasKey(e => e.AddressId)
                    .HasName("PK__Addresse__091C2AFBF0E82C30");

                entity.Property(e => e.AddressId).ValueGeneratedNever();

                entity.HasOne(d => d.City)
                    .WithMany(p => p.Addresses)
                    .HasForeignKey(d => d.CityId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Addresses__CityI__1ED998B2");

                entity.HasOne(d => d.Street)
                    .WithMany(p => p.Addresses)
                    .HasForeignKey(d => d.StreetId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Addresses__Stree__1FCDBCEB");

                entity.HasOne(d => d.ZipCode)
                    .WithMany(p => p.Addresses)
                    .HasForeignKey(d => d.ZipCodeId)
                    .HasConstraintName("FK__Addresses__ZipCo__1DE57479");
            });

            modelBuilder.Entity<Categories>(entity =>
            {
                entity.HasKey(e => e.CategoryId)
                    .HasName("PK__Categori__19093A0BF687E095");
            });

            modelBuilder.Entity<Cities>(entity =>
            {
                entity.HasKey(e => e.CityId)
                    .HasName("PK__Cities__F2D21B76CF3B9280");

                entity.Property(e => e.CityId).ValueGeneratedNever();
            });

            modelBuilder.Entity<Companies>(entity =>
            {
                entity.HasKey(e => e.CompanyId)
                    .HasName("PK__Companie__2D971CAC28D888D9");

                entity.Property(e => e.CompanyId).ValueGeneratedNever();

                entity.HasOne(d => d.Address)
                    .WithMany(p => p.Companies)
                    .HasForeignKey(d => d.AddressId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Companies__Addre__239E4DCF");

                entity.HasOne(d => d.ParentCompany)
                    .WithMany(p => p.InverseParentCompany)
                    .HasForeignKey(d => d.ParentCompanyId)
                    .HasConstraintName("FK__Companies__Paren__22AA2996");
            });

            modelBuilder.Entity<CompaniesCategories>(entity =>
            {
                entity.HasKey(e => e.CompanyCategoryId)
                    .HasName("PK__Companie__0DD411303AD5BD0F");

                entity.Property(e => e.CompanyCategoryId).ValueGeneratedNever();

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.CompaniesCategories)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Companies__Categ__286302EC");

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.CompaniesCategories)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Companies__Compa__276EDEB3");
            });

            modelBuilder.Entity<CompaniesSubcategories>(entity =>
            {
                entity.HasKey(e => e.CompanySubcategoryId)
                    .HasName("PK__Companie__A5B77AEE3C6E81D2");

                entity.Property(e => e.CompanySubcategoryId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.CompaniesSubcategories)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Companies__Compa__2B3F6F97");

                entity.HasOne(d => d.Subcategory)
                    .WithMany(p => p.CompaniesSubcategories)
                    .HasForeignKey(d => d.SubcategoryId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Companies__Subca__2C3393D0");
            });

            modelBuilder.Entity<DayWeekTimeTables>(entity =>
            {
                entity.HasKey(e => e.DayWeekTimeTableId)
                    .HasName("PK__DayWeekT__265E736193CA00D7");

                entity.Property(e => e.DayWeekTimeTableId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.DayWeekTimeTables)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__DayWeekTi__Compa__412EB0B6");
            });

            modelBuilder.Entity<Emails>(entity =>
            {
                entity.HasKey(e => e.EmailId)
                    .HasName("PK__Emails__7ED91ACFAA27E1D5");

                entity.Property(e => e.EmailId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.Emails)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Emails__CompanyI__34C8D9D1");
            });

            modelBuilder.Entity<Logos>(entity =>
            {
                entity.HasKey(e => e.PhotoId)
                    .HasName("PK__Logos__21B7B5E2B0AB8D96");

                entity.Property(e => e.PhotoId).ValueGeneratedNever();

                entity.HasOne(d => d.Photo)
                    .WithOne(p => p.Logos)
                    .HasForeignKey<Logos>(d => d.PhotoId)
                    .HasConstraintName("FK__Logos__PhotoId__31EC6D26");
            });

            modelBuilder.Entity<Phones>(entity =>
            {
                entity.HasKey(e => e.PhoneId)
                    .HasName("PK__Phones__F3EE4BB03E1CEFE5");

                entity.Property(e => e.PhoneId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.Phones)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Phones__CompanyI__37A5467C");
            });

            modelBuilder.Entity<Photos>(entity =>
            {
                entity.HasKey(e => e.PhotoId)
                    .HasName("PK__Photos__21B7B5E29A3F713B");

                entity.Property(e => e.PhotoId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.Photos)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Photos__CompanyI__2F10007B");
            });

            modelBuilder.Entity<SocialNetNames>(entity =>
            {
                entity.HasKey(e => e.SocialNetNameId)
                    .HasName("PK__SocialNe__EE4492AE5FC4A77B");
            });

            modelBuilder.Entity<SocialNets>(entity =>
            {
                entity.HasKey(e => e.SocialNetId)
                    .HasName("PK__SocialNe__606691030EE69028");

                entity.Property(e => e.SocialNetId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.SocialNets)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__SocialNet__Compa__3A81B327");

                entity.HasOne(d => d.SocialNetName)
                    .WithMany(p => p.SocialNets)
                    .HasForeignKey(d => d.SocialNetNameId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__SocialNet__Socia__3B75D760");
            });

            modelBuilder.Entity<Streets>(entity =>
            {
                entity.HasKey(e => e.StreetId)
                    .HasName("PK__Streets__6270EB3A0328FB48");

                entity.Property(e => e.StreetId).ValueGeneratedNever();

                entity.HasOne(d => d.City)
                    .WithMany(p => p.Streets)
                    .HasForeignKey(d => d.CityId)
                    .HasConstraintName("FK__Streets__CityId__164452B1");
            });

            modelBuilder.Entity<Subcategories>(entity =>
            {
                entity.HasKey(e => e.SubcategoryId)
                    .HasName("PK__Subcateg__9C4E705D9B484C21");
            });

            modelBuilder.Entity<UsersCompanies>(entity =>
            {
                entity.HasKey(e => e.UserCompanyId)
                    .HasName("PK__UsersCom__E9E9A294E96CBA9B");

                entity.Property(e => e.UserCompanyId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.UsersCompanies)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__UsersComp__Compa__3E52440B");
            });

            modelBuilder.Entity<ZipCodes>(entity =>
            {
                entity.HasKey(e => e.ZipCodeId)
                    .HasName("PK__ZipCodes__36DEF3090B486507");

                entity.Property(e => e.ZipCodeId).ValueGeneratedNever();

                entity.HasOne(d => d.City)
                    .WithMany(p => p.ZipCodes)
                    .HasForeignKey(d => d.CityId)
                    .HasConstraintName("FK__ZipCodes__CityId__1B0907CE");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
