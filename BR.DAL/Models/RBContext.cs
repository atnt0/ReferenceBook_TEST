﻿using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace RB.DAL.Models
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

        public virtual DbSet<Categories> Categories { get; set; }
        public virtual DbSet<Companies> Companies { get; set; }
        public virtual DbSet<CompanyCategories> CompanyCategories { get; set; }
        public virtual DbSet<CompanySubcategories> CompanySubcategories { get; set; }
        public virtual DbSet<Emails> Emails { get; set; }
        public virtual DbSet<Phones> Phones { get; set; }
        public virtual DbSet<Photos> Photos { get; set; }
        public virtual DbSet<SocialNets> SocialNets { get; set; }
        public virtual DbSet<Subcategories> Subcategories { get; set; }
        public virtual DbSet<UserCompanies> UserCompanies { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=SQL5097.site4now.net;Initial Catalog=DB_A69E5E_refbook;User Id=DB_A69E5E_refbook_admin;Password=CommandBB20");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Categories>(entity =>
            {
                entity.HasKey(e => e.CategoryId)
                    .HasName("PK__Categori__19093A0BDE72DB15");
            });

            modelBuilder.Entity<Companies>(entity =>
            {
                entity.HasKey(e => e.CompanyId)
                    .HasName("PK__Companie__2D971CAC402D0216");

                entity.Property(e => e.CompanyId).ValueGeneratedNever();

                entity.HasOne(d => d.ParentCompany)
                    .WithMany(p => p.InverseParentCompany)
                    .HasForeignKey(d => d.ParentCompanyId)
                    .HasConstraintName("FK__Companies__Paren__03F0984C");
            });

            modelBuilder.Entity<CompanyCategories>(entity =>
            {
                entity.HasKey(e => e.CompanyCategories1)
                    .HasName("PK__CompanyC__394F207D981C4B60");

                entity.Property(e => e.CompanyCategories1).ValueGeneratedNever();

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.CompanyCategories)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__CompanyCa__Categ__07C12930");

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.CompanyCategories)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__CompanyCa__Compa__06CD04F7");
            });

            modelBuilder.Entity<CompanySubcategories>(entity =>
            {
                entity.HasKey(e => e.CompanySubcategories1)
                    .HasName("PK__CompanyS__913925F19A5057FB");

                entity.Property(e => e.CompanySubcategories1).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.CompanySubcategories)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__CompanySu__Compa__0A9D95DB");

                entity.HasOne(d => d.Subcategory)
                    .WithMany(p => p.CompanySubcategories)
                    .HasForeignKey(d => d.SubcategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__CompanySu__Subca__0B91BA14");
            });

            modelBuilder.Entity<Emails>(entity =>
            {
                entity.Property(e => e.EmailsId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.Emails)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Emails__CompanyI__114A936A");
            });

            modelBuilder.Entity<Phones>(entity =>
            {
                entity.Property(e => e.PhonesId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.Phones)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Phones__CompanyI__14270015");
            });

            modelBuilder.Entity<Photos>(entity =>
            {
                entity.HasKey(e => e.PhotoId)
                    .HasName("PK__Photos__21B7B5E246C3C00C");

                entity.Property(e => e.PhotoId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.Photos)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Photos__CompanyI__0E6E26BF");
            });

            modelBuilder.Entity<SocialNets>(entity =>
            {
                entity.HasKey(e => e.SocialNetId)
                    .HasName("PK__SocialNe__606691032FB7C2FE");

                entity.Property(e => e.SocialNetId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.SocialNets)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__SocialNet__Compa__17036CC0");
            });

            modelBuilder.Entity<Subcategories>(entity =>
            {
                entity.HasKey(e => e.SubcategoryId)
                    .HasName("PK__Subcateg__9C4E705DE4E614A4");
            });

            modelBuilder.Entity<UserCompanies>(entity =>
            {
                entity.Property(e => e.UserCompaniesId).ValueGeneratedNever();

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.UserCompanies)
                    .HasForeignKey(d => d.CompanyId)
                    .HasConstraintName("FK__UserCompa__Compa__19DFD96B");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}