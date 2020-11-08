using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FilmDB_MVC.Data
{
    public static class ApplicationDbInitializer
    {
        public static void SeedRoles(RoleManager<IdentityRole> roleManager)
        {
            if (roleManager.FindByNameAsync("Admin").Result == null)
            {
                IdentityRole role = new IdentityRole
                {
                    Name = "Admin",
                    NormalizedName = "Admin".ToUpper()
                };
                IdentityResult result = roleManager.CreateAsync(role).Result;
            }

            if (roleManager.FindByNameAsync("Editor").Result == null)
            {
                IdentityRole role = new IdentityRole
                {
                    Name = "Editor",
                    NormalizedName = "Editor".ToUpper()
                };
                IdentityResult result = roleManager.CreateAsync(role).Result;
            }

            if (roleManager.FindByNameAsync("ClientCompany").Result == null)
            {
                IdentityRole role = new IdentityRole
                {
                    Name = "ClientCompany",
                    NormalizedName = "ClientCompany".ToUpper()
                };
                IdentityResult result = roleManager.CreateAsync(role).Result;
            }

            if (roleManager.FindByNameAsync("Client").Result == null)
            {
                IdentityRole role = new IdentityRole
                {
                    Name = "Client",
                    NormalizedName = "Client".ToUpper()
                };
                IdentityResult result = roleManager.CreateAsync(role).Result;
            }

            if (roleManager.FindByNameAsync("User").Result == null)
            {
                IdentityRole role = new IdentityRole
                {
                    Name = "User",
                    NormalizedName = "User".ToUpper()
                };
                IdentityResult result = roleManager.CreateAsync(role).Result;
            }

        }

        public static void SeedUsers(UserManager<IdentityUser> userManager)
        {
            if (userManager.FindByEmailAsync("vasyaxhd5@gmail.com").Result == null)
            {
                IdentityUser user = new IdentityUser
                {
                    UserName = "vasyaxhd5@gmail.com",
                    Email = "vasyaxhd5@gmail.com",
                    EmailConfirmed = true
                };

                IdentityResult result = userManager.CreateAsync(user, "Qwerty123!@#").Result;

                if (result.Succeeded)
                {
                    userManager.AddToRoleAsync(user, "Admin").Wait();
                }
            }
           
        }
    }
}
