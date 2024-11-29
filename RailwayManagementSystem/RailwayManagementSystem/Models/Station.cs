using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RailwayManagementSystem.Models
{
    public class Station
    {
        public int StationID { get; set; }

        [Required]
        public string StationName { get; set; }

        [Required]
        public decimal Latitude { get; set; }

        [Required]
        public decimal Longitude { get; set; }

        [Required]
        public string StationCode { get; set; }

        [Required]
        public string StationType { get; set; }

        [Required]
        public int NumberOfPlatforms { get; set; }

        public string Facilities { get; set; }

        [Required]
        public string OperationalStatus { get; set; }

        // Foreign Key
        public int CityID { get; set; }

        // Navigation Property
        public City City { get; set; }
    }
}