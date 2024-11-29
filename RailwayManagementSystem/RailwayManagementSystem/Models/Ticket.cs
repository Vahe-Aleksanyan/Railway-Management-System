using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace RailwayManagementSystem.Models
{
    public class Ticket
    {
        public int TicketID { get; set; }

        [Required]
        public string TicketStatus { get; set; }

        [Required]
        public DateTime PurchaseDate { get; set; } = DateTime.Now;

        public string PaymentMethod { get; set; }

        public decimal DiscountApplied { get; set; } = 0.0m;

        [Required]
        public string BookingReference { get; set; }

        public decimal RefundAmount { get; set; } = 0.0m;

        [Required]
        public decimal TotalPrice { get; set; }

        // Foreign Key
        public int PassengerID { get; set; }

        // Navigation Properties
        public Passenger Passenger { get; set; }
        public ICollection<TicketLeg> TicketLegs { get; set; }
    }
}