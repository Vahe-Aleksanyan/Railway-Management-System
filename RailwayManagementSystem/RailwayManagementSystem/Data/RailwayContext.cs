/*
using Microsoft.EntityFrameworkCore;
using RailwayManagementSystem.Models;

namespace RailwayManagementSystem.Data
{
    public class RailwayContext : DbContext
    {
        public RailwayContext(DbContextOptions<RailwayContext> options)
            : base(options)
        {
        }

        // DbSet for each table
        public DbSet<Country> Countries { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<Station> Stations { get; set; }
        public DbSet<Passenger> Passengers { get; set; }
        public DbSet<Ticket> Tickets { get; set; }
        public DbSet<Seat> Seats { get; set; }
        public DbSet<TicketLeg> TicketLegs { get; set; }
        public DbSet<Railway> Railways { get; set; }
        public DbSet<Schedule> Schedules { get; set; }
        public DbSet<Models.Route> Routes { get; set; }
        public DbSet<RouteStop> RouteStops { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Country Table Mapping
            modelBuilder.Entity<Country>().ToTable("country"); // Ensure table name matches the database

            // Map properties explicitly to database columns
            modelBuilder.Entity<Country>()
                .Property(c => c.CountryID).HasColumnName("countryid"); // Map to lowercase column name
            modelBuilder.Entity<Country>()
                .Property(c => c.CountryName).HasColumnName("countryname");
            modelBuilder.Entity<Country>()
                .Property(c => c.Longitude).HasColumnName("longitude");
            modelBuilder.Entity<Country>()
                .Property(c => c.Latitude).HasColumnName("latitude");
            modelBuilder.Entity<Country>()
                .Property(c => c.Population).HasColumnName("population");
            modelBuilder.Entity<Country>()
                .Property(c => c.Continent).HasColumnName("continent");
            modelBuilder.Entity<Country>()
                .Property(c => c.Region).HasColumnName("region");
            modelBuilder.Entity<Country>()
                .Property(c => c.Area).HasColumnName("area");
        

            // City Table Mapping
            modelBuilder.Entity<City>().ToTable("city");

            // Station Table Mapping
            modelBuilder.Entity<Station>().ToTable("station");

            // Passenger Table Mapping
            modelBuilder.Entity<Passenger>().ToTable("passenger");

            // Ticket Table Mapping
            modelBuilder.Entity<Ticket>().ToTable("ticket");

            // Seat Table Mapping
            modelBuilder.Entity<Seat>().ToTable("seat");
            modelBuilder.Entity<Seat>()
                .HasIndex(s => new { s.RailwayID, s.CarriageNumber, s.SeatNumber })
                .IsUnique();

            // TicketLeg Table Mapping
            modelBuilder.Entity<TicketLeg>().ToTable("ticket_leg");
            modelBuilder.Entity<TicketLeg>()
                .HasIndex(tl => new { tl.SeatID, tl.ScheduleID })
                .IsUnique();
            modelBuilder.Entity<TicketLeg>()
                .HasIndex(tl => new { tl.TicketID, tl.LegOrder })
                .IsUnique();

            // TicketLeg Relationships
            modelBuilder.Entity<TicketLeg>()
                .HasOne(tl => tl.BoardingStation)
                .WithMany()
                .HasForeignKey(tl => tl.BoardingStationID)
                .OnDelete(DeleteBehavior.Restrict);
            modelBuilder.Entity<TicketLeg>()
                .HasOne(tl => tl.AlightingStation)
                .WithMany()
                .HasForeignKey(tl => tl.AlightingStationID)
                .OnDelete(DeleteBehavior.Restrict);

            // Railway Table Mapping
            modelBuilder.Entity<Railway>().ToTable("railway");

            // Schedule Table Mapping
            modelBuilder.Entity<Schedule>().ToTable("schedule");

            // Route Table Mapping
            modelBuilder.Entity<Models.Route>().ToTable("route");

            // RouteStop Table Mapping
            modelBuilder.Entity<RouteStop>().ToTable("route_stop");

            // Relationships and Foreign Keys
            modelBuilder.Entity<Station>()
                .HasOne(s => s.City)
                .WithMany(c => c.Stations)
                .HasForeignKey(s => s.CityID)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<RouteStop>()
                .HasOne(rs => rs.Route)
                .WithMany(r => r.RouteStops)
                .HasForeignKey(rs => rs.RouteID)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<RouteStop>()
                .HasOne(rs => rs.Station)
                .WithMany()
                .HasForeignKey(rs => rs.StationID)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Schedule>()
                .HasOne(sc => sc.Route)
                .WithMany(r => r.Schedules)
                .HasForeignKey(sc => sc.RouteID)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Schedule>()
                .HasOne(sc => sc.Railway)
                .WithMany(r => r.Schedules)
                .HasForeignKey(sc => sc.RailwayID)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
*/

using Microsoft.EntityFrameworkCore;
using RailwayManagementSystem.Models;

namespace RailwayManagementSystem.Data
{
    public class RailwayContext : DbContext
    {
        public RailwayContext(DbContextOptions<RailwayContext> options)
            : base(options)
        {
        }

        // DbSet for each table
        public DbSet<Country> Countries { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<Station> Stations { get; set; }
        public DbSet<Models.Route> Routes { get; set; }
        public DbSet<RouteStop> RouteStops { get; set; }
        public DbSet<Railway> Railways { get; set; }
        public DbSet<Schedule> Schedules { get; set; }
        public DbSet<Passenger> Passengers { get; set; }
        public DbSet<Ticket> Tickets { get; set; }
        public DbSet<Seat> Seats { get; set; }
        public DbSet<TicketLeg> TicketLegs { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Country Table Mapping
            modelBuilder.Entity<Country>().ToTable("country");
            modelBuilder.Entity<Country>().Property(c => c.CountryID).HasColumnName("countryid");
            modelBuilder.Entity<Country>().Property(c => c.CountryName).HasColumnName("countryname");
            modelBuilder.Entity<Country>().Property(c => c.Longitude).HasColumnName("longitude");
            modelBuilder.Entity<Country>().Property(c => c.Latitude).HasColumnName("latitude");
            modelBuilder.Entity<Country>().Property(c => c.Population).HasColumnName("population");
            modelBuilder.Entity<Country>().Property(c => c.Continent).HasColumnName("continent");
            modelBuilder.Entity<Country>().Property(c => c.Region).HasColumnName("region");
            modelBuilder.Entity<Country>().Property(c => c.Area).HasColumnName("area");

            // City Table Mapping
            modelBuilder.Entity<City>().ToTable("city");
            modelBuilder.Entity<City>().Property(c => c.CityID).HasColumnName("cityid");
            modelBuilder.Entity<City>().Property(c => c.CityName).HasColumnName("cityname");
            modelBuilder.Entity<City>().Property(c => c.Longitude).HasColumnName("longitude");
            modelBuilder.Entity<City>().Property(c => c.Latitude).HasColumnName("latitude");
            modelBuilder.Entity<City>().Property(c => c.Population).HasColumnName("population");
            modelBuilder.Entity<City>().Property(c => c.IsCapital).HasColumnName("iscapital");
            modelBuilder.Entity<City>().Property(c => c.CountryID).HasColumnName("countryid");

            // Station Table Mapping
            modelBuilder.Entity<Station>().ToTable("station");
            modelBuilder.Entity<Station>().Property(s => s.StationID).HasColumnName("stationid");
            modelBuilder.Entity<Station>().Property(s => s.StationName).HasColumnName("stationname");
            modelBuilder.Entity<Station>().Property(s => s.Latitude).HasColumnName("latitude");
            modelBuilder.Entity<Station>().Property(s => s.Longitude).HasColumnName("longitude");
            modelBuilder.Entity<Station>().Property(s => s.StationCode).HasColumnName("stationcode");
            modelBuilder.Entity<Station>().Property(s => s.StationType).HasColumnName("stationtype");
            modelBuilder.Entity<Station>().Property(s => s.NumberOfPlatforms).HasColumnName("numberofplatforms");
            modelBuilder.Entity<Station>().Property(s => s.Facilities).HasColumnName("facilities");
            modelBuilder.Entity<Station>().Property(s => s.OperationalStatus).HasColumnName("operationalstatus");
            modelBuilder.Entity<Station>().Property(s => s.CityID).HasColumnName("cityid");

            // Route Table Mapping
            modelBuilder.Entity<Models.Route>().ToTable("route");
            modelBuilder.Entity<Models.Route>().Property(r => r.RouteID).HasColumnName("routeid");
            modelBuilder.Entity<Models.Route>().Property(r => r.RouteName).HasColumnName("routename");
            modelBuilder.Entity<Models.Route>().Property(r => r.OperationalDays).HasColumnName("operationaldays");
            modelBuilder.Entity<Models.Route>().Property(r => r.Frequency).HasColumnName("frequency");
            modelBuilder.Entity<Models.Route>().Property(r => r.TotalDistance).HasColumnName("totaldistance");
            modelBuilder.Entity<Models.Route>().Property(r => r.EstimatedTravelTime).HasColumnName("estimatedtraveltime");
            modelBuilder.Entity<Models.Route>().Property(r => r.RouteType).HasColumnName("routetype");

            // RouteStop Table Mapping
            modelBuilder.Entity<RouteStop>().ToTable("routestop");
            modelBuilder.Entity<RouteStop>().Property(rs => rs.RouteStopID).HasColumnName("routestopid");
            modelBuilder.Entity<RouteStop>().Property(rs => rs.PlatformNumber).HasColumnName("platformnumber");
            modelBuilder.Entity<RouteStop>().Property(rs => rs.StopOrder).HasColumnName("stoporder");
            modelBuilder.Entity<RouteStop>().Property(rs => rs.StopDuration).HasColumnName("stopduration");
            modelBuilder.Entity<RouteStop>().Property(rs => rs.ArrivalTime).HasColumnName("arrivaltime");
            modelBuilder.Entity<RouteStop>().Property(rs => rs.DepartureTime).HasColumnName("departuretime");
            modelBuilder.Entity<RouteStop>().Property(rs => rs.DistanceFromPrevious).HasColumnName("distancefromprevious");
            modelBuilder.Entity<RouteStop>().Property(rs => rs.RouteID).HasColumnName("routeid");
            modelBuilder.Entity<RouteStop>().Property(rs => rs.StationID).HasColumnName("stationid");

            // Railway Table Mapping
            modelBuilder.Entity<Railway>().ToTable("railway");
            modelBuilder.Entity<Railway>().Property(r => r.RailwayID).HasColumnName("railwayid");
            modelBuilder.Entity<Railway>().Property(r => r.TrainName).HasColumnName("trainname");
            modelBuilder.Entity<Railway>().Property(r => r.Capacity).HasColumnName("capacity");
            modelBuilder.Entity<Railway>().Property(r => r.MaximumSpeed).HasColumnName("maximumspeed");
            modelBuilder.Entity<Railway>().Property(r => r.YearOfManufacture).HasColumnName("yearofmanufacture");
            modelBuilder.Entity<Railway>().Property(r => r.Manufacturer).HasColumnName("manufacturer");
            modelBuilder.Entity<Railway>().Property(r => r.EconomyClassSeats).HasColumnName("economyclassseats");
            modelBuilder.Entity<Railway>().Property(r => r.BusinessClassSeats).HasColumnName("businessclassseats");
            modelBuilder.Entity<Railway>().Property(r => r.TrainType).HasColumnName("traintype");

            // Schedule Table Mapping
            modelBuilder.Entity<Schedule>().ToTable("schedule");
            modelBuilder.Entity<Schedule>().Property(sc => sc.ScheduleID).HasColumnName("scheduleid");
            modelBuilder.Entity<Schedule>().Property(sc => sc.Frequency).HasColumnName("frequency");
            modelBuilder.Entity<Schedule>().Property(sc => sc.DepartureTime).HasColumnName("departuretime");
            modelBuilder.Entity<Schedule>().Property(sc => sc.ArrivalTime).HasColumnName("arrivaltime");
            modelBuilder.Entity<Schedule>().Property(sc => sc.TotalDuration).HasColumnName("totalduration");
            modelBuilder.Entity<Schedule>().Property(sc => sc.ScheduleDate).HasColumnName("scheduledate");
            modelBuilder.Entity<Schedule>().Property(sc => sc.DaysOfOperation).HasColumnName("daysofoperation");
            modelBuilder.Entity<Schedule>().Property(sc => sc.TrainNumber).HasColumnName("trainnumber");
            modelBuilder.Entity<Schedule>().Property(sc => sc.Status).HasColumnName("status");
            modelBuilder.Entity<Schedule>().Property(sc => sc.RailwayID).HasColumnName("railwayid");
            modelBuilder.Entity<Schedule>().Property(sc => sc.RouteID).HasColumnName("routeid");

            // Passenger Table Mapping
            modelBuilder.Entity<Passenger>().ToTable("passenger");
            modelBuilder.Entity<Passenger>().Property(p => p.PassengerID).HasColumnName("passengerid");
            modelBuilder.Entity<Passenger>().Property(p => p.FirstName).HasColumnName("firstname");
            modelBuilder.Entity<Passenger>().Property(p => p.LastName).HasColumnName("lastname");
            modelBuilder.Entity<Passenger>().Property(p => p.DateOfBirth).HasColumnName("dateofbirth");
            modelBuilder.Entity<Passenger>().Property(p => p.Gender).HasColumnName("gender");
            modelBuilder.Entity<Passenger>().Property(p => p.Email).HasColumnName("email");
            modelBuilder.Entity<Passenger>().Property(p => p.PhoneNumber).HasColumnName("phonenumber");
            modelBuilder.Entity<Passenger>().Property(p => p.Address).HasColumnName("address");
            modelBuilder.Entity<Passenger>().Property(p => p.EmergencyContact).HasColumnName("emergencycontact");

            // Ticket Table Mapping
            modelBuilder.Entity<Ticket>().ToTable("ticket");
            modelBuilder.Entity<Ticket>().Property(t => t.TicketID).HasColumnName("ticketid");
            modelBuilder.Entity<Ticket>().Property(t => t.TicketStatus).HasColumnName("ticketstatus");
            modelBuilder.Entity<Ticket>().Property(t => t.PurchaseDate).HasColumnName("purchasedate");
            modelBuilder.Entity<Ticket>().Property(t => t.PaymentMethod).HasColumnName("paymentmethod");
            modelBuilder.Entity<Ticket>().Property(t => t.DiscountApplied).HasColumnName("discountapplied");
            modelBuilder.Entity<Ticket>().Property(t => t.BookingReference).HasColumnName("bookingreference");
            modelBuilder.Entity<Ticket>().Property(t => t.RefundAmount).HasColumnName("refundamount");
            modelBuilder.Entity<Ticket>().Property(t => t.TotalPrice).HasColumnName("totalprice");
            modelBuilder.Entity<Ticket>().Property(t => t.PassengerID).HasColumnName("passengerid");

            // Seat Table Mapping
            modelBuilder.Entity<Seat>().ToTable("seat");
            modelBuilder.Entity<Seat>().Property(s => s.SeatID).HasColumnName("seatid");
            modelBuilder.Entity<Seat>().Property(s => s.CarriageNumber).HasColumnName("carriagenumber");
            modelBuilder.Entity<Seat>().Property(s => s.SeatNumber).HasColumnName("seatnumber");
            modelBuilder.Entity<Seat>().Property(s => s.Class).HasColumnName("class");
            modelBuilder.Entity<Seat>().Property(s => s.RailwayID).HasColumnName("railwayid");

            // TicketLeg Table Mapping
            modelBuilder.Entity<TicketLeg>().ToTable("ticketleg");
            modelBuilder.Entity<TicketLeg>().Property(tl => tl.TicketLegID).HasColumnName("ticketlegid");
            modelBuilder.Entity<TicketLeg>().Property(tl => tl.LegOrder).HasColumnName("legorder");
            modelBuilder.Entity<TicketLeg>().Property(tl => tl.BoardingStationID).HasColumnName("boardingstationid");
            modelBuilder.Entity<TicketLeg>().Property(tl => tl.AlightingStationID).HasColumnName("alightingstationid");
            modelBuilder.Entity<TicketLeg>().Property(tl => tl.LegPrice).HasColumnName("legprice");
            modelBuilder.Entity<TicketLeg>().Property(tl => tl.SeatID).HasColumnName("seatid");
            modelBuilder.Entity<TicketLeg>().Property(tl => tl.TicketID).HasColumnName("ticketid");
            modelBuilder.Entity<TicketLeg>().Property(tl => tl.ScheduleID).HasColumnName("scheduleid");
        }
    }
}
