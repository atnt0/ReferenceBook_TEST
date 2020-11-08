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
            optionsBuilder
            .UseLazyLoadingProxies();


        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Addresses>(entity =>
            {
                entity.HasKey(e => e.AddressId)
                    .HasName("PK__Addresse__091C2AFB6B25D32E");

                entity.Property(e => e.AddressId).ValueGeneratedNever();

                entity.HasOne(d => d.City)
                    .WithMany(p => p.Addresses)
                    .HasForeignKey(d => d.CityId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Addresses__CityI__6F7F8B4B");

                entity.HasOne(d => d.Street)
                    .WithMany(p => p.Addresses)
                    .HasForeignKey(d => d.StreetId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Addresses__Stree__7073AF84");

                entity.HasOne(d => d.ZipCode)
                    .WithMany(p => p.Addresses)
                    .HasForeignKey(d => d.ZipCodeId)
                    .HasConstraintName("FK__Addresses__ZipCo__6E8B6712");
            });

            modelBuilder.Entity<Categories>(entity =>
            {
                entity.HasKey(e => e.CategoryId)
                    .HasName("PK__Categori__19093A0B9A0461D9");
            });

            modelBuilder.Entity<Cities>(entity =>
            {
                entity.HasKey(e => e.CityId)
                    .HasName("PK__Cities__F2D21B76271080C9");

                entity.Property(e => e.CityId).ValueGeneratedNever();
            });

            modelBuilder.Entity<Companies>(entity =>
            {
                entity.HasKey(e => e.CompanyId)
                    .HasName("PK__Companie__2D971CACADE7C856");

                entity.Property(e => e.CompanyId).ValueGeneratedNever();

                entity.HasOne(d => d.Address)
                    .WithMany(p => p.Companies)
                    .HasForeignKey(d => d.AddressId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Companies__Addre__74444068");

                entity.HasOne(d => d.ParentCompany)
                    .WithMany(p => p.InverseParentCompany)
                    .HasForeignKey(d => d.ParentCompanyId)
                    .HasConstraintName("FK__Companies__Paren__73501C2F");
            });

            modelBuilder.Entity<CompaniesCategories>(entity =>
            {
                entity.HasKey(e => e.CompanyCategoryId)
                    .HasName("PK__Companie__0DD411304F60CCDF");

                entity.Property(e => e.CompanyCategoryId).ValueGeneratedNever();

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.CompaniesCategories)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Companies__Categ__7814D14C");

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.CompaniesCategories)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Companies__Compa__7720AD13");
            });

            modelBuilder.Entity<CompaniesSubcategories>(entity =>
            {
                entity.HasKey(e => e.CompanySubcategoryId)
                    .HasName("PK__Companie__A5B77AEED539EB93");

                entity.Property(e => e.CompanySubcategoryId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.CompaniesSubcategories)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Companies__Compa__7AF13DF7");

                entity.HasOne(d => d.Subcategory)
                    .WithMany(p => p.CompaniesSubcategories)
                    .HasForeignKey(d => d.SubcategoryId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Companies__Subca__7BE56230");
            });

            modelBuilder.Entity<Emails>(entity =>
            {
                entity.HasKey(e => e.EmailId)
                    .HasName("PK__Emails__7ED91ACFAB1AC8AD");

                entity.Property(e => e.EmailId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.Emails)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Emails__CompanyI__047AA831");
            });

            modelBuilder.Entity<Logos>(entity =>
            {
                entity.HasKey(e => e.PhotoId)
                    .HasName("PK__Logos__21B7B5E2F43D1E49");

                entity.Property(e => e.PhotoId).ValueGeneratedNever();

                entity.HasOne(d => d.Photo)
                    .WithOne(p => p.Logos)
                    .HasForeignKey<Logos>(d => d.PhotoId)
                    .HasConstraintName("FK__Logos__PhotoId__019E3B86");
            });

            modelBuilder.Entity<Phones>(entity =>
            {
                entity.HasKey(e => e.PhoneId)
                    .HasName("PK__Phones__F3EE4BB0C6C6CF1C");

                entity.Property(e => e.PhoneId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.Phones)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Phones__CompanyI__075714DC");
            });

            modelBuilder.Entity<Photos>(entity =>
            {
                entity.HasKey(e => e.PhotoId)
                    .HasName("PK__Photos__21B7B5E20EE76CB9");

                entity.Property(e => e.PhotoId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.Photos)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Photos__CompanyI__7EC1CEDB");
            });

            modelBuilder.Entity<SocialNetNames>(entity =>
            {
                entity.HasKey(e => e.SocialNetNameId)
                    .HasName("PK__SocialNe__EE4492AE3F868DD1");
            });

            modelBuilder.Entity<SocialNets>(entity =>
            {
                entity.HasKey(e => e.SocialNetId)
                    .HasName("PK__SocialNe__60669103A8BB2A28");

                entity.Property(e => e.SocialNetId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.SocialNets)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__SocialNet__Compa__0A338187");

                entity.HasOne(d => d.SocialNetName)
                    .WithMany(p => p.SocialNets)
                    .HasForeignKey(d => d.SocialNetNameId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__SocialNet__Socia__0B27A5C0");
            });

            modelBuilder.Entity<Streets>(entity =>
            {
                entity.HasKey(e => e.StreetId)
                    .HasName("PK__Streets__6270EB3AA98976EF");

                entity.Property(e => e.StreetId).ValueGeneratedNever();
            });

            modelBuilder.Entity<Subcategories>(entity =>
            {
                entity.HasKey(e => e.SubcategoryId)
                    .HasName("PK__Subcateg__9C4E705DA0F4A849");
            });

            modelBuilder.Entity<UsersCompanies>(entity =>
            {
                entity.HasKey(e => e.UserCompanyId)
                    .HasName("PK__UsersCom__E9E9A294A320C995");

                entity.Property(e => e.UserCompanyId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.UsersCompanies)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__UsersComp__Compa__0E04126B");
            });

            modelBuilder.Entity<ZipCodes>(entity =>
            {
                entity.HasKey(e => e.ZipCodeId)
                    .HasName("PK__ZipCodes__36DEF3099211A4D3");

                entity.Property(e => e.ZipCodeId).ValueGeneratedNever();

                entity.HasOne(d => d.City)
                    .WithMany(p => p.ZipCodes)
                    .HasForeignKey(d => d.CityId)
                    .HasConstraintName("FK__ZipCodes__CityId__6BAEFA67");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
