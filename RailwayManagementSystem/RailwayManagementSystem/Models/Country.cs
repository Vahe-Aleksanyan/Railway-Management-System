using System.ComponentModel.DataAnnotations;

namespace RailwayManagementSystem.Models
{
    public class Country
    {
        public int CountryID { get; set; } // Standard PascalCase
        public string CountryName { get; set; }
        public decimal? Longitude { get; set; }
        public decimal? Latitude { get; set; }
        public long? Population { get; set; }
        public string Continent { get; set; }
        public string Region { get; set; }
        public decimal? Area { get; set; }
    }
}