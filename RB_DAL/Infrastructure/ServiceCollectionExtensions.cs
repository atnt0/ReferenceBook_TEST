
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using RB.DAL.Common;
using RB.DAL.Repositories;
using RB_DAL.Models;
using RB_DAL.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace FilmDB_DAL.Infrastructure
{
    public static class ServiceCollectionExtensions
    {
        public static IServiceCollection AddMyService(this IServiceCollection services, IConfiguration configuration)
        {



            services.AddScoped<IGenericRepository<Companies, Guid>, CompaniesRepository>();
            services.AddScoped<IGenericRepository<Categories, int>, CategoriesRepository>();
            services.AddScoped<IGenericRepository<CompaniesCategories, Guid>, CompanyCategoriesRepository>();
            services.AddScoped<IGenericRepository<CompaniesSubcategories, Guid>, CompanySubcategoriesRepository>();
            services.AddScoped<IGenericRepository<Emails, Guid>, EmailsRepository>();
            services.AddScoped<IGenericRepository<Phones, Guid>, PhonesRepository>();
            services.AddScoped<IGenericRepository<Photos, Guid>, PhotosRepository>();
            services.AddScoped<IGenericRepository<SocialNets, Guid>, SocialNetsRepository>();
            services.AddScoped<IGenericRepository<Subcategories, int>, SubcategoriesRepository>();
            services.AddScoped<IGenericRepository<UsersCompanies, Guid>, UserCompaniesRepository>();
            services.AddScoped<IGenericRepository<Cities, Guid>, CitiesRepository>();
            services.AddScoped<IGenericRepository<Addresses, Guid>, AdressesRepository>();
            services.AddScoped<IGenericRepository<Streets, Guid>, StreetsRepository>();
            services.AddScoped<IGenericRepository<SocialNetNames, int>, SocialNetNamesRepository>();
            services.AddScoped<IGenericRepository<ZipCodes, Guid>, ZipCodesRepository>();
            services.AddScoped<IGenericRepository<Logos, Guid>, LogosRepository>();
            services.AddScoped<DbContext, RBContext>();

            string connection = configuration.GetConnectionString("DefaultConnection");
            services.AddDbContext<RBContext>(options =>
                options.UseSqlServer(connection));
            return services;
        }
    }
}
