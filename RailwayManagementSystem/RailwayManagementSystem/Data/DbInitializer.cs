using RailwayManagementSystem.Models;
using System;
using System.Linq;

namespace RailwayManagementSystem.Data
{
    public static class DbInitializer
    {
        public static void Initialize(RailwayContext context)
        {
            context.Database.EnsureCreated();

            // Check if Countries already exist
            if (context.Countries.Any())
            {
                return; // DB has been seeded
            }

            var countries = new Country[]
            {
                new Country { CountryName = "Cilicia", Continent = "Asia", Region = "Western Asia", Population = 2968000, Area = 29743.00M },
            };
            foreach (var c in countries)
            {
                context.Countries.Add(c);
            }
            context.SaveChanges();
        }
    }
}