using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace RailwayManagementSystem.Models
{
    public class Schedule
    {
        public int ScheduleID { get; set; }

        [Required]
        public string Frequency { get; set; }

        [Required]
        public TimeSpan DepartureTime { get; set; }

        [Required]
        public TimeSpan ArrivalTime { get; set; }

        [Required]
        public TimeSpan TotalDuration { get; set; }

        [Required]
        public DateTime ScheduleDate { get; set; }

        [Required]
        public string DaysOfOperation { get; set; }

        [Required]
        public string TrainNumber { get; set; }

        [Required]
        public string Status { get; set; }

        // Foreign Keys
        public int RailwayID { get; set; }
        public int RouteID { get; set; }

        // Navigation Properties
        public Railway Railway { get; set; }
        public Route Route { get; set; }
        public ICollection<TicketLeg> TicketLegs { get; set; }
    }
}