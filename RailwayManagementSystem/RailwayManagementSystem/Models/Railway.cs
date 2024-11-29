using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace RailwayManagementSystem.Models
{
    public class Railway
    {
        public int RailwayID { get; set; }

        [Required]
        public string TrainName { get; set; }

        [Required]
        public int Capacity { get; set; }

        [Required]
        public decimal MaximumSpeed { get; set; }

        [Required]
        public int YearOfManufacture { get; set; }

        [Required]
        public string Manufacturer { get; set; }

        [Required]
        public int EconomyClassSeats { get; set; }

        [Required]
        public int BusinessClassSeats { get; set; }

        [Required]
        public string TrainType { get; set; }

        // Navigation Properties
        public ICollection<Seat> Seats { get; set; }
        public ICollection<Schedule> Schedules { get; set; }
    }
}