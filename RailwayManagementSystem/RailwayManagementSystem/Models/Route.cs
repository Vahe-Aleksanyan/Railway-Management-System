using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace RailwayManagementSystem.Models
{
    public class Route
    {
        public int RouteID { get; set; }

        [Required]
        public string RouteName { get; set; }

        [Required]
        public string OperationalDays { get; set; }

        [Required]
        public string Frequency { get; set;  }

        [Required]
        public decimal TotalDistance { get; set; }

        [Required]
        public TimeSpan EstimatedTravelTime { get; set; }

        [Required]
        public string RouteType { get; set; }

        // Navigation Properties
        public ICollection<RouteStop> RouteStops { get; set; }
        public ICollection<Schedule> Schedules { get; set; }
    }
}