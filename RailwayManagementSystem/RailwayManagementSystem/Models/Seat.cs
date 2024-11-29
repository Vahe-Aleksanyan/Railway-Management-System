using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace RailwayManagementSystem.Models
{
    public class Seat
    {
        public int SeatID { get; set; }

        [Required]
        public int CarriageNumber { get; set; }

        [Required]
        public int SeatNumber { get; set; }

        [Required]
        public string Class { get; set; }

        // Foreign Key
        public int RailwayID { get; set; }

        // Navigation Properties
        public Railway Railway { get; set; }
        public ICollection<TicketLeg> TicketLegs { get; set; }
    }
}