using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RailwayManagementSystem.Models
{
    public class City
    {
        public int CityID { get; set; }

        [Required]
        public string CityName { get; set; }

        [Required]
        public decimal Longitude { get; set; }

        [Required]
        public decimal Latitude { get; set; }

        [Required]
        public int Population { get; set; }

        public bool IsCapital { get; set; } = false;

        // Foreign Key
        public int CountryID { get; set; }

        // Navigation Property
        public Country Country { get; set; }

        public ICollection<Station> Stations { get; set; }
    }
}