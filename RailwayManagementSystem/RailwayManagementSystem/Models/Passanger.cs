using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace RailwayManagementSystem.Models
{
    public class Passenger
    {
        public int PassengerID { get; set; }

        [Required]
        [StringLength(100)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(100)]
        public string LastName { get; set; }

        [Required]
        public DateTime DateOfBirth { get; set; }

        [Required]
        [RegularExpression("Male|Female|Other", ErrorMessage = "Gender must be 'Male', 'Female', or 'Other'")]
        public string Gender { get; set; }

        [EmailAddress]
        public string Email { get; set; }

        [Phone]
        public string PhoneNumber { get; set; }

        public string Address { get; set; }

        public string EmergencyContact { get; set; }

        // Navigation Property
        public ICollection<Ticket> Tickets { get; set; }
    }
}