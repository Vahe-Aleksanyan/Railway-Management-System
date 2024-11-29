using System.ComponentModel.DataAnnotations;

namespace RailwayManagementSystem.Models
{
    public class TicketLeg
    {
        public int TicketLegID { get; set; }

        [Required]
        public int LegOrder { get; set; }

        [Required]
        public decimal LegPrice { get; set; }

        // Foreign Keys
        [Required]
        public int BoardingStationID { get; set; }

        [Required]
        public int AlightingStationID { get; set; }

        [Required]
        public int SeatID { get; set; }

        [Required]
        public int TicketID { get; set; }

        [Required]
        public int ScheduleID { get; set; }

        // Navigation Properties
        public Station BoardingStation { get; set; }
        public Station AlightingStation { get; set; }
        public Seat Seat { get; set; }
        public Ticket Ticket { get; set; }
        public Schedule Schedule { get; set; }
    }
}