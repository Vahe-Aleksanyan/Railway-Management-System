-- Table: Country

-- Table: Country

INSERT INTO Country (CountryID, CountryName, Longitude, Latitude, Population, Continent, Region, Area)
VALUES
(1,'Armenia', 45.000000, 40.000000, 2968000, 'Asia', 'Western Asia', 29743.00),
(2,'Georgia', 43.356892, 41.716667, 3714000, 'Asia', 'Western Asia', 69700.00),
(3,'Azerbaijan', 47.576927, 40.143105, 10140000, 'Asia', 'Western Asia', 86600.00),
(4,'Turkey', 35.243322, 38.963745, 83155000, 'Asia', 'Western Asia', 783562.00),
(5,'Iran', 53.688046, 32.427908, 83290000, 'Asia', 'Southern Asia', 1648195.00);

-- Table: City

-- Table: City

INSERT INTO City (CityID, CityName, Longitude, Latitude, Population, IsCapital, CountryID)
VALUES
(1, 'Yerevan', 44.5126, 40.1811, 1075800, TRUE, 1),
(2, 'Gyumri', 43.8453, 40.7894, 121976, FALSE, 1),
(3, 'Vanadzor', 44.4939, 40.8128, 86199, FALSE, 1),
(4, 'Dilijan', 44.8610, 40.7410, 17412, FALSE, 1),
(5, 'Sevan', 44.9488, 40.5500, 23000, FALSE, 1),
(6, 'Goris', 46.3387, 39.5101, 23143, FALSE, 1),
(7, 'Kapan', 46.4058, 39.2075, 34500, FALSE, 1),
(8, 'Ijevan', 45.1499, 40.8783, 21081, FALSE, 1),
(9, 'Hrazdan', 44.7613, 40.4975, 40700, FALSE, 1),
(10, 'Abovyan', 44.6260, 40.2679, 44496, FALSE, 1);

-- Table: Station
INSERT INTO Station (StationID, StationName, Latitude, Longitude, StationCode, StationType, NumberOfPlatforms, Facilities, OperationalStatus, CityID)
VALUES
(1, 'Yerevan Central Station', 44.5126, 40.1811, 'YVN', 'Passenger', 5, 'Wi-Fi, Restrooms, Restaurants', 'Operational', 1),
(2, 'Gyumri Station', 43.8453, 40.7894, 'GYU', 'Passenger', 3, 'Restrooms, Shops', 'Operational', 2),
(3, 'Vanadzor Station', 44.4939, 40.8128, 'VAN', 'Passenger', 2, 'Restrooms', 'Operational', 3),
(4, 'Dilijan Station', 44.8610, 40.7410, 'DLJ', 'Passenger', 2, 'Restrooms', 'Operational', 4),
(5, 'Sevan Station', 44.9488, 40.5500, 'SVN', 'Passenger', 2, 'Restrooms, Shops', 'Operational', 5),
(6, 'Goris Station', 46.3387, 39.5101, 'GOR', 'Passenger', 2, 'Restrooms', 'Operational', 6),
(7, 'Kapan Station', 46.4058, 39.2075, 'KAP', 'Passenger', 2, 'Restrooms', 'Operational', 7),
(8, 'Ijevan Station', 45.1499, 40.8783, 'IJV', 'Passenger', 1, 'Restrooms', 'Operational', 8),
(9, 'Hrazdan Station', 44.7613, 40.4975, 'HRZ', 'Passenger', 2, 'Restrooms', 'Operational', 9),
(10, 'Abovyan Station', 44.6260, 40.2679, 'ABV', 'Passenger', 1, 'Restrooms', 'Operational', 10);

-- Table: Route

INSERT INTO Route (RouteID, RouteName, OperationalDays, Frequency, TotalDistance, EstimatedTravelTime, RouteType)
VALUES
(1, 'Yerevan to Gyumri', 'Mon, Tue, Wed, Thu, Fri, Sat, Sun', 'Daily', 120.00, '02:00:00', 'Passenger'),
(2, 'Yerevan to Sevan', 'Mon, Wed, Fri', 'Three times a week', 70.00, '01:30:00', 'Passenger'),
(3, 'Yerevan to Goris', 'Tue, Thu, Sat', 'Three times a week', 250.00, '04:00:00', 'Passenger'),
(4, 'Yerevan Circular Route', 'Mon, Tue, Wed, Thu, Fri', 'Daily', 200.00, '03:30:00', 'Passenger'),
(5, 'Gyumri to Vanadzor', 'Mon, Tue, Wed, Thu, Fri, Sat, Sun', 'Daily', 65.00, '01:00:00', 'Passenger');

-- Table: RouteStop

-- For RouteID=1 (Yerevan to Gyumri)
INSERT INTO RouteStop (RouteStopID, PlatformNumber, StopOrder, StopDuration, ArrivalTime, DepartureTime, DistanceFromPrevious, RouteID, StationID)
VALUES
(1, 1, 1, '00:10:00', NULL, '08:00:00', 0.00, 1, 1),
(2, 2, 2, '00:05:00', '09:00:00', '09:05:00', 70.00, 1, 3),
(3, 1, 3, NULL, '10:00:00', NULL, 50.00, 1, 2);

-- For RouteID=2 (Yerevan to Sevan)
INSERT INTO RouteStop (RouteStopID, PlatformNumber, StopOrder, StopDuration, ArrivalTime, DepartureTime, DistanceFromPrevious, RouteID, StationID)
VALUES
(4, 2, 1, '00:10:00', NULL, '07:30:00', 0.00, 2, 1),
(5, 1, 2, '00:05:00', '08:30:00', '08:35:00', 50.00, 2, 9),
(6, 1, 3, NULL, '09:00:00', NULL, 20.00, 2, 5);

-- For RouteID=3 (Yerevan to Goris)
INSERT INTO RouteStop (RouteStopID, PlatformNumber, StopOrder, StopDuration, ArrivalTime, DepartureTime, DistanceFromPrevious, RouteID, StationID)
VALUES
(7, 1, 1, '00:10:00', NULL, '07:00:00', 0.00, 3, 1),
(8, 1, 2, '00:05:00', '09:00:00', '09:05:00', 150.00, 3, 4),
(9, 1, 3, NULL, '11:00:00', NULL, 100.00, 3, 6);


-- Table: Railway

INSERT INTO Railway (RailwayID, TrainName, Capacity, MaximumSpeed, YearOfManufacture, Manufacturer, EconomyClassSeats, BusinessClassSeats, TrainType)
VALUES
(1, 'Armenia Express', 200, 120.00, 2015, 'Siemens', 150, 50, 'High-Speed'),
(2, 'Sevan Lake Liner', 150, 100.00, 2010, 'Alstom', 120, 30, 'Passenger'),
(3, 'Southern Star', 180, 110.00, 2012, 'Bombardier', 140, 40, 'Passenger'),
(4, 'Northern Breeze', 160, 105.00, 2018, 'Hyundai Rotem', 130, 30, 'Passenger'),
(5, 'Mountain Climber', 100, 90.00, 2008, 'CAF', 80, 20, 'Passenger');

-- Table: Schedule

INSERT INTO Schedule (ScheduleID, Frequency, DepartureTime, ArrivalTime, TotalDuration, ScheduleDate, DaysOfOperation, TrainNumber, Status, RailwayID, RouteID)
VALUES
(1, 'Daily', '08:00:00', '10:00:00', '02:00:00', '2024-11-27', 'Mon, Tue, Wed, Thu, Fri, Sat, Sun', 'AE-001', 'On Time', 1, 1),
(2, 'Daily', '14:00:00', '16:00:00', '02:00:00', '2024-11-27', 'Mon, Tue, Wed, Thu, Fri, Sat, Sun', 'AE-002', 'On Time', 1, 1),
(3, 'Three times a week', '07:30:00', '09:00:00', '01:30:00', '2024-11-27', 'Mon, Wed, Fri', 'SL-101', 'On Time', 2, 2),
(4, 'Three times a week', '15:00:00', '19:00:00', '04:00:00', '2024-11-27', 'Tue, Thu, Sat', 'SS-201', 'On Time', 3, 3),
(5, 'Daily', '09:00:00', '10:00:00', '01:00:00', '2024-11-27', 'Mon, Tue, Wed, Thu, Fri, Sat, Sun', 'NB-301', 'On Time', 4, 5);

-- Table: Passenger

INSERT INTO Passenger (PassengerID, FirstName, LastName, DateOfBirth, Gender, Email, PhoneNumber, Address, EmergencyContact)
VALUES
(1, 'Anna', 'Sargsyan', '1990-05-15', 'Female', 'anna.sargsyan@aua.edu.am', '+37477123456', 'Yerevan, Armenia', 'Mother: Anahit Sargsyan, +37477111222'),
(2, 'Vahe', 'Hakobyan', '1985-08-20', 'Male', 'vahe.hakobyan@aua.edu.am', '+37477123457', 'Gyumri, Armenia', 'Father: Hakob Hakobyan, +37477111223'),
(3, 'Karine', 'Martirosyan', '1992-11-30', 'Female', 'karine.martirosyan@aua.edu.am', '+37477123458', 'Vanadzor, Armenia', 'Sister: Lilit Martirosyan, +37477111224'),
(4, 'Arman', 'Petrosyan', '1988-03-25', 'Male', 'arman.petrosyan@aua.edu.am', '+37477123459', 'Dilijan, Armenia', 'Wife: Ani Petrosyan, +37477111225'),
(5, 'Mariam', 'Avetisyan', '1995-07-10', 'Female', 'mariam.avetisyan@aua.edu.am', '+37477123460', 'Sevan, Armenia', 'Brother: Aram Avetisyan, +37477111226'),
(6, 'Hayk', 'Ghazaryan', '1991-02-18', 'Male', 'hayk.ghazaryan@aua.edu.am', '+37477123461', 'Goris, Armenia', 'Mother: Sona Ghazaryan, +37477111227'),
(7, 'Lilit', 'Karapetyan', '1987-09-12', 'Female', 'lilit.karapetyan@aua.edu.am', '+37477123462', 'Kapan, Armenia', 'Father: Karen Karapetyan, +37477111228'),
(8, 'Gor', 'Mkrtchyan', '1993-12-05', 'Male', 'gor.mkrtchyan@aua.edu.am', '+37477123463', 'Ijevan, Armenia', 'Sister: Narine Mkrtchyan, +37477111229'),
(9, 'Ani', 'Harutyunyan', '1990-06-22', 'Female', 'ani.harutyunyan@aua.edu.am', '+37477123464', 'Hrazdan, Armenia', 'Husband: Armen Harutyunyan, +37477111230'),
(10, 'Levon', 'Simonyan', '1989-01-17', 'Male', 'levon.simonyan@aua.edu.am', '+37477123465', 'Abovyan, Armenia', 'Mother: Nune Simonyan, +37477111231');

-- Table: Ticket

INSERT INTO Ticket (TicketID, TicketStatus, PurchaseDate, PaymentMethod, DiscountApplied, BookingReference, RefundAmount, TotalPrice, PassengerID)
VALUES
(1, 'Confirmed', '2024-11-25 10:00:00', 'Credit Card', 0.00, 'BR-1001', 0.00, 5000.00, 1),
(2, 'Confirmed', '2024-11-25 12:00:00', 'Credit Card', 10.00, 'BR-1002', 0.00, 4500.00, 2),
(3, 'Cancelled', '2024-11-26 14:00:00', 'Cash', 0.00, 'BR-1003', 4500.00, 0.00, 3), -- Ticket with refund
(4, 'Confirmed', '2024-11-26 15:30:00', 'Credit Card', 5.00, 'BR-1004', 0.00, 4750.00, 4),
(5, 'Confirmed', '2024-11-26 16:00:00', 'Cash', 0.00, 'BR-1005', 0.00, 5000.00, 5),
(6, 'Confirmed', '2024-11-27 08:00:00', 'Credit Card', 0.00, 'BR-1006', 0.00, 5000.00, 6),
(7, 'Confirmed', '2024-11-27 09:30:00', 'Credit Card', 0.00, 'BR-1007', 0.00, 5000.00, 7),
(8, 'Confirmed', '2024-11-27 10:15:00', 'Cash', 0.00, 'BR-1008', 0.00, 5000.00, 8),
(9, 'Confirmed', '2024-11-27 11:00:00', 'Credit Card', 0.00, 'BR-1009', 0.00, 5000.00, 9),
(10, 'Confirmed', '2024-11-27 12:45:00', 'Cash', 0.00, 'BR-1010', 0.00, 5000.00, 10);

-- Table: Seat

-- Seats for RailwayID=1 (Armenia Express)
INSERT INTO Seat (SeatID, CarriageNumber, SeatNumber, Class, RailwayID)
VALUES
(1, 1, 1, 'Business', 1),
(2, 1, 2, 'Business', 1),
(3, 1, 3, 'Business', 1),
(4, 1, 4, 'Business', 1),
(5, 1, 5, 'Business', 1),
(6, 2, 1, 'Economy', 1),
(7, 2, 2, 'Economy', 1),
(8, 2, 3, 'Economy', 1),
(9, 2, 4, 'Economy', 1),
(10, 2, 5, 'Economy', 1);



INSERT INTO TicketLeg (TicketLegID, LegOrder, BoardingStationID, AlightingStationID, LegPrice, SeatID, TicketID, ScheduleID)
VALUES
-- Anna's journey (TicketID=1, ScheduleID=1)
(1, 1, 1, 2, 2500.00, 1, 1, 1),  -- First leg: Yerevan -> Gyumri
(2, 2, 2, 3, 2500.00, 2, 1, 1),  -- Second leg: Gyumri -> Vanadzor

-- Vahe's journey (TicketID=2, ScheduleID=1)
(3, 1, 1, 3, 4500.00, 3, 2, 1),  -- Single leg: Yerevan -> Vanadzor

-- Karine's cancelled ticket (TicketID=3, ScheduleID=1)
(4, 1, 3, 2, 0.00, 4, 3, 1),     -- Single leg: Vanadzor -> Gyumri (Cancelled)

-- Arman's journey (TicketID=4, ScheduleID=3)
(5, 1, 1, 4, 3000.00, 5, 4, 3),  -- First leg: Yerevan -> Dilijan
(6, 2, 4, 6, 1750.00, 6, 4, 3),  -- Second leg: Dilijan -> Goris

-- Mariam's journey (TicketID=5, ScheduleID=4)
(7, 1, 6, 1, 5000.00, 7, 5, 4),  -- Single leg: Goris -> Yerevan

-- Hayk's journey (TicketID=6, ScheduleID=4)
(8, 1, 1, 6, 5000.00, 8, 6, 4),  -- Single leg: Yerevan -> Goris

-- Lilit's journey (TicketID=7, ScheduleID=5)
(9, 1, 1, 9, 5000.00, 9, 7, 5),  -- Single leg: Yerevan -> Hrazdan

-- Gor's journey (TicketID=8, ScheduleID=3)
(10, 1, 9, 5, 5000.00, 10, 8, 3); -- Single leg: Hrazdan -> Sevan
