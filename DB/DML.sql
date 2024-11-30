-- Table: Country

INSERT INTO Country (CountryID, CountryName, Longitude, Latitude, Population, Continent, Region, Area)
VALUES
(1,'Armenia', 45.000000, 40.000000, 2968000, 'Asia', 'Western Asia', 29743.00),
(2,'Georgia', 43.356892, 41.716667, 3714000, 'Asia', 'Western Asia', 69700.00),
(3,'Azerbaijan', 47.576927, 40.143105, 10140000, 'Asia', 'Western Asia', 86600.00),
(4,'Turkey', 35.243322, 38.963745, 83155000, 'Asia', 'Western Asia', 783562.00),
(5,'Iran', 53.688046, 32.427908, 83290000, 'Asia', 'Southern Asia', 1648195.00),
(6,'France', 34.012000, 47.005600, 10978000, 'Asia', 'Europe', 329743.00),
(7,'Germany', 34.126892, 43.711267, 8715000, 'Asia', 'Europe', 349700.00),
(8,'Austria', 57.576927, 30.143105, 2010000, 'Asia', 'Europe', 99600.00),
(9,'Spain', 65.243322, 28.963495, 13157000, 'Asia', 'Europe', 503562.00),
(10,'Finland', 23.008036, 13.420008, 1290000, 'Asia', 'Europe', 200195.00),
(11, 'Italy', 12.496365, 41.902783, 59554000, 'Europe', 'Southern Europe', 301340.00),
(12, 'Poland', 19.145136, 51.919438, 38386000, 'Europe', 'Eastern Europe', 312696.00),
(13, 'Sweden', 18.643501, 60.128161, 10353442, 'Europe', 'Northern Europe', 450295.00),
(14, 'Norway', 8.468946, 60.472024, 5379475, 'Europe', 'Northern Europe', 385207.00),
(15, 'Denmark', 9.501785, 56.263920, 5831404, 'Europe', 'Northern Europe', 42933.00),
(16, 'Netherlands', 5.291266, 52.132633, 17533405, 'Europe', 'Western Europe', 41543.00),
(17, 'Belgium', 4.469936, 50.503887, 11589623, 'Europe', 'Western Europe', 30528.00),
(18, 'Switzerland', 8.227512, 46.818188, 8654622, 'Europe', 'Western Europe', 41285.00),
(19, 'Portugal', -8.224454, 39.399872, 10276617, 'Europe', 'Southern Europe', 92212.00),
(20, 'Greece', 21.824312, 39.074208, 10715549, 'Europe', 'Southern Europe', 131957.00);

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
(10, 'Abovyan', 44.6260, 40.2679, 44496, FALSE, 1),
(11, 'Rome', 12.4964, 41.9028, 2872800, TRUE, 11),
(12, 'Milan', 9.1900, 45.4642, 1378689, FALSE, 11),
(13, 'Naples', 14.2681, 40.8518, 962003, FALSE, 11),
(14, 'Warsaw', 21.0122, 52.2297, 1790658, TRUE, 12),
(15, 'Krakow', 19.9445, 50.0647, 779115, FALSE, 12),
(16, 'Gdansk', 18.6466, 54.3520, 470907, FALSE, 12),
(17, 'Stockholm', 18.0686, 59.3293, 975551, TRUE, 13),
(18, 'Gothenburg', 11.9746, 57.7089, 607882, FALSE, 13),
(19, 'Malmö', 13.0038, 55.6040, 347949, FALSE, 13),
(20, 'Oslo', 10.7522, 59.9139, 709037, TRUE, 14),
(21, 'Bergen', 5.3221, 60.3913, 286930, FALSE, 14),
(22, 'Trondheim', 10.3951, 63.4305, 205163, FALSE, 14),
(23, 'Copenhagen', 12.5683, 55.6761, 1345118, TRUE, 15),
(24, 'Aarhus', 10.2039, 56.1629, 282910, FALSE, 15),
(25, 'Odense', 10.3884, 55.4038, 179601, FALSE, 15),
(26, 'Amsterdam', 4.9041, 52.3676, 872757, TRUE, 16),
(27, 'Rotterdam', 4.4777, 51.9244, 651446, FALSE, 16),
(28, 'The Hague', 4.3007, 52.0705, 551695, FALSE, 16),
(29, 'Brussels', 4.3517, 50.8503, 1851034, TRUE, 17),
(30, 'Antwerp', 4.4025, 51.2194, 530504, FALSE, 17),
(31, 'Ghent', 3.7174, 51.0543, 262219, FALSE, 17),
(32, 'Zurich', 8.5417, 47.3769, 428737, FALSE, 18),
(33, 'Geneva', 6.1432, 46.2044, 203856, FALSE, 18),
(34, 'Bern', 7.4474, 46.9481, 133115, TRUE, 18),
(35, 'Lisbon', -9.1391, 38.7223, 544851, TRUE, 19),
(36, 'Athens', 23.7275, 37.9838, 664046, TRUE, 20);

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

--test inputs
INSERT INTO Route (RouteID, RouteName, OperationalDays, Frequency, TotalDistance, EstimatedTravelTime, RouteType)
VALUES
(7, 'International: Armenia-Italy-Poland', 'Tue, Thu, Sat', 'Three times a week', 500.00, '08:00:00', 'International');

INSERT INTO Station (StationID, StationName, Latitude, Longitude, StationCode, StationType, NumberOfPlatforms, Facilities, OperationalStatus, CityID)
VALUES
(11, 'Italy Central Station', 41.7172, 44.7845, 'MLS', 'Passenger', 7, 'Wi-Fi, Restrooms, Shops', 'Operational', 7),
(12, 'Poland Station', 40.6078, 43.0975, 'KRS', 'Passenger', 3, 'Restrooms, Restaurants', 'Operational', 15);

INSERT INTO Station (StationID, StationName, Latitude, Longitude, StationCode, StationType, NumberOfPlatforms, Facilities, OperationalStatus, CityID)
VALUES
(13, 'Portugal Central Station', 41.7172, 44.7845, 'LBS', 'Passenger', 7, 'Wi-Fi, Restrooms, Shops', 'Operational', 35);

INSERT INTO RouteStop (RouteStopID, PlatformNumber, StopOrder, StopDuration, ArrivalTime, DepartureTime, DistanceFromPrevious, RouteID, StationID)
VALUES
(13, 1, 1, '00:10:00', NULL, '06:00:00', 0.00, 7, 1);

INSERT INTO RouteStop (RouteStopID, PlatformNumber, StopOrder, StopDuration, ArrivalTime, DepartureTime, DistanceFromPrevious, RouteID, StationID)
VALUES
(14, 2, 2, '00:20:00', '09:00:00', '09:20:00', 300.00, 7, 11);

INSERT INTO RouteStop (RouteStopID, PlatformNumber, StopOrder, StopDuration, ArrivalTime, DepartureTime, DistanceFromPrevious, RouteID, StationID)
VALUES
(15, 1, 3, NULL, '13:00:00', NULL, 200.00, 7, 12);

INSERT INTO RouteStop (RouteStopID, PlatformNumber, StopOrder, StopDuration, ArrivalTime, DepartureTime, DistanceFromPrevious, RouteID, StationID)
VALUES
(16, 1, 4, NULL, '14:00:00', NULL, 100.00, 7, 13);

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
(10, 'Levon', 'Simonyan', '1989-01-17', 'Male', 'levon.simonyan@aua.edu.am', '+37477123465', 'Abovyan, Armenia', 'Mother: Nune Simonyan, +37477111231'),
(11, 'Narek', 'Hovhannisyan', '1993-03-15', 'Male', 'narek.hovhannisyan@aua.edu.am', '+37477123466', 'Ashtarak, Armenia', 'Father: Hovhannes Hovhannisyan, +37477111232'),
(12, 'Sona', 'Mkrtchyan', '1990-10-10', 'Female', 'sona.mkrtchyan@aua.edu.am', '+37477123467', 'Echmiadzin, Armenia', 'Mother: Narine Mkrtchyan, +37477111233'),
(13, 'Artur', 'Manukyan', '1992-08-12', 'Male', 'artur.manukyan@aua.edu.am', '+37477123468', 'Hrazdan, Armenia', 'Sister: Ani Manukyan, +37477111234'),
(14, 'Gohar', 'Baghdasaryan', '1994-06-09', 'Female', 'gohar.baghdasaryan@aua.edu.am', '+37477123469', 'Kapan, Armenia', 'Brother: Aram Baghdasaryan, +37477111235'),
(15, 'Armen', 'Davtyan', '1987-01-20', 'Male', 'armen.davtyan@aua.edu.am', '+37477123470', 'Gyumri, Armenia', 'Father: Davit Davtyan, +37477111236'),
(16, 'Tigran', 'Petrosyan', '1991-12-25', 'Male', 'tigran.petrosyan@aua.edu.am', '+37477123471', 'Vanadzor, Armenia', 'Mother: Anahit Petrosyan, +37477111237'),
(17, 'Hasmik', 'Avagyan', '1989-04-18', 'Female', 'hasmik.avagyan@aua.edu.am', '+37477123472', 'Yerevan, Armenia', 'Father: Armen Avagyan, +37477111238'),
(18, 'Araks', 'Melkonyan', '1995-07-07', 'Female', 'araks.melkonyan@aua.edu.am', '+37477123473', 'Goris, Armenia', 'Brother: Tigran Melkonyan, +37477111239'),
(19, 'Narine', 'Asatryan', '1992-03-13', 'Female', 'narine.asatryan@aua.edu.am', '+37477123474', 'Sevan, Armenia', 'Husband: Vardan Asatryan, +37477111240'),
(20, 'Suren', 'Karapetyan', '1990-11-11', 'Male', 'suren.karapetyan@aua.edu.am', '+37477123475', 'Ijevan, Armenia', 'Father: Karen Karapetyan, +37477111241');

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
(10, 'Confirmed', '2024-11-27 12:45:00', 'Cash', 0.00, 'BR-1010', 0.00, 5000.00, 10),
(11, 'Confirmed', '2024-11-27 13:30:00', 'Credit Card', 5.00, 'BR-1011', 0.00, 4750.00, 11),
(12, 'Confirmed', '2024-11-27 14:15:00', 'Cash', 0.00, 'BR-1012', 0.00, 5000.00, 12),
(13, 'Confirmed', '2024-11-27 15:00:00', 'Credit Card', 10.00, 'BR-1013', 0.00, 4500.00, 13),
(14, 'Confirmed', '2024-11-27 16:00:00', 'Credit Card', 0.00, 'BR-1014', 0.00, 5000.00, 14),
(15, 'Confirmed', '2024-11-27 16:45:00', 'Cash', 0.00, 'BR-1015', 0.00, 5000.00, 15),
(16, 'Confirmed', '2024-11-28 09:00:00', 'Credit Card', 0.00, 'BR-1016', 0.00, 5000.00, 16),
(17, 'Confirmed', '2024-11-28 10:30:00', 'Cash', 5.00, 'BR-1017', 0.00, 4750.00, 17),
(18, 'Confirmed', '2024-11-28 11:15:00', 'Credit Card', 0.00, 'BR-1018', 0.00, 5000.00, 18),
(19, 'Confirmed', '2024-11-28 12:45:00', 'Credit Card', 10.00, 'BR-1019', 0.00, 4500.00, 19),
(20, 'Confirmed', '2024-11-28 13:30:00', 'Cash', 0.00, 'BR-1020', 0.00, 5000.00, 20);

-- Table: Seat

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
(10, 2, 5, 'Economy', 1),
(11, 1, 1, 'Business', 2),
(12, 1, 2, 'Business', 2),
(13, 1, 3, 'Business', 2),
(14, 1, 4, 'Business', 2),
(15, 1, 5, 'Business', 2),
(16, 2, 1, 'Economy', 2),
(17, 2, 2, 'Economy', 2),
(18, 2, 3, 'Economy', 2),
(19, 2, 4, 'Economy', 2),
(20, 2, 5, 'Economy', 2),
(21, 1, 1, 'Business', 3),
(22, 1, 2, 'Business', 3),
(23, 1, 3, 'Business', 3),
(24, 1, 4, 'Business', 3),
(25, 1, 5, 'Business', 3),
(26, 2, 1, 'Economy', 3),
(27, 2, 2, 'Economy', 3),
(28, 2, 3, 'Economy', 3),
(29, 2, 4, 'Economy', 3),
(30, 2, 5, 'Economy', 3),
(31, 1, 1, 'Business', 4),
(32, 1, 2, 'Business', 4),
(33, 1, 3, 'Business', 4),
(34, 1, 4, 'Business', 4),
(35, 1, 5, 'Business', 4),
(36, 2, 1, 'Economy', 4),
(37, 2, 2, 'Economy', 4),
(38, 2, 3, 'Economy', 4),
(39, 2, 4, 'Economy', 4),
(40, 2, 5, 'Economy', 4),
(41, 1, 1, 'Business', 5),
(42, 1, 2, 'Business', 5),
(43, 1, 3, 'Business', 5),
(44, 1, 4, 'Business', 5),
(45, 1, 5, 'Business', 5),
(46, 2, 1, 'Economy', 5),
(47, 2, 2, 'Economy', 5),
(48, 2, 3, 'Economy', 5),
(49, 2, 4, 'Economy', 5),
(50, 2, 5, 'Economy', 5);

-- Table: TicketLeg

INSERT INTO TicketLeg (TicketLegID, LegOrder, BoardingStationID, AlightingStationID, LegPrice, SeatID, TicketID, ScheduleID)
VALUES
(1, 1, 1, 2, 2500.00, 1, 1, 1),  
(2, 2, 2, 3, 2500.00, 2, 1, 1), 

(3, 1, 1, 3, 4500.00, 3, 2, 1),  

(4, 1, 3, 2, 0.00, 4, 3, 1),    

(5, 1, 1, 4, 3000.00, 5, 4, 3), 
(6, 2, 4, 6, 1750.00, 6, 4, 3), 

(7, 1, 6, 1, 5000.00, 7, 5, 4),  

(8, 1, 1, 6, 5000.00, 8, 6, 4),  

(9, 1, 1, 9, 5000.00, 9, 7, 5),  

(10, 1, 9, 5, 5000.00, 10, 8, 3);
