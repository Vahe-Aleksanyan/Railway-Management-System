using System;
using System.ComponentModel.DataAnnotations;

namespace RailwayManagementSystem.Models
{
    public class RouteStop
    {
        public int RouteStopID { get; set; }

        [Required]
        public int PlatformNumber { get; set; }

        [Required]
        public int StopOrder { get; set; }

        public TimeSpan? StopDuration { get; set; }

        public TimeSpan? ArrivalTime { get; set; }

        public TimeSpan? DepartureTime { get; set; }

        public decimal? DistanceFromPrevious { get; set; }

        // Foreign Keys
        [Required]
        public int RouteID { get; set; }

        [Required]
        public int StationID { get; set; }

        // Navigation Properties
        public Route Route { get; set; }
        public Station Station { get; set; }
    }
}