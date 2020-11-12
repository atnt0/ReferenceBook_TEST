using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using RB.DAL.Infrastructure;
using RB.WebApi.Adapters;

namespace RB.WebApi
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMyService(Configuration);
            services.AddSwaggerGen();
            services.AddScoped<AdapterAddresses_To_AddressesPOCO>();
            services.AddScoped<AdapterCategories_To_CategoriesPOCO>();
            services.AddScoped<AdapterCities_To_CitiesPOCO>();
            services.AddScoped<AdapterCompaniesCategories_To_CompaniesCategoriesPOCO>();
            services.AddScoped<AdapterCompanies_To_CompaniesPOCO>();
            services.AddScoped<AdapterCompaniesSubcategories_To_CompaniesSubcategoriesPOCO>();
            services.AddScoped<AdapterDayWeekTimeTables_To_DayWeekTimeTablesPOCO>();
            services.AddScoped<AdapterEmails_To_EmailsPOCO>();
            services.AddScoped<AdapterLogos_To_LogosPOCO>();
            services.AddScoped<AdapterPhones_To_PhonesPOCO>();
            services.AddScoped<AdapterPhotos_To_PhotosPOCO>();
            services.AddScoped<AdapterSocialNetNames_To_SocialNetNamesPOCO>();
            services.AddScoped<AdapterSocialNets_To_SocialNetsPOCO>();
            services.AddScoped<AdapterStreets_To_StreetsPOCO>();
            services.AddScoped<AdapterSubcategories_To_SubcategoriesPOCO>();
            services.AddScoped<AdapterUsersCompanies_To_UsersCompaniesPOCO>();
            services.AddScoped<AdapterZipCodes_To_ZipCodesPOCO>();

            services.AddControllers();
            //services.AddScoped<IGenericRepository, GenericRepository<Categories, int>>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseSwagger();

            // Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.),
            // specifying the Swagger JSON endpoint.
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1");
            });


            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
