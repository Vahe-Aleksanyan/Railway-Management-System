-- Table: Country
CREATE TABLE Country (
    CountryID SERIAL PRIMARY KEY,                 -- Unique identifier for each country
    CountryName VARCHAR(255) NOT NULL,            -- Name of the country
    Longitude NUMERIC(9, 6),                      -- Longitude of the country's center
    Latitude NUMERIC(9, 6),                       -- Latitude of the country's center
    Population BIGINT,                            -- Population of the country
    Continent VARCHAR(100),                       -- Continent where the country is located
    Region VARCHAR(100),                          -- Sub-region or area for classification
    Area DECIMAL(18, 2)                           -- Area of the country in square kilometers
);

-- Table: City
CREATE TABLE City (
    CityID SERIAL PRIMARY KEY,                    -- Unique identifier for each city
    CityName VARCHAR(255) NOT NULL,               -- Name of the city
    Longitude NUMERIC(9, 6) NOT NULL,             -- Longitude coordinate of the city
    Latitude NUMERIC(9, 6) NOT NULL,              -- Latitude coordinate of the city
    Population INT NOT NULL,                      -- Population of the city
    IsCapital BOOLEAN DEFAULT FALSE,              -- Indicates if the city is the capital
    CountryID INT NOT NULL,                       -- Many-to-one relationship with Country
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

-- Table: Station
CREATE TABLE Station (
    StationID SERIAL PRIMARY KEY,                   -- Unique identifier for each station
    StationName VARCHAR(255) NOT NULL,              -- Name of the station
    Latitude NUMERIC(9, 6) NOT NULL,                -- Latitude coordinate of the station
    Longitude NUMERIC(9, 6) NOT NULL,               -- Longitude coordinate of the station
    StationCode VARCHAR(10) UNIQUE NOT NULL,        -- Unique code for the station
    StationType VARCHAR(50) NOT NULL,               -- Type of station (e.g., Passenger, Freight)
    NumberOfPlatforms INT NOT NULL,                 -- Number of platforms at the station
    Facilities TEXT,                                -- Facilities available at the station
    OperationalStatus VARCHAR(50) NOT NULL,         -- Status of the station
    CityID INT NOT NULL,                            -- Many-to-one relationship with City
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

-- Table: Route
CREATE TABLE Route (
    RouteID SERIAL PRIMARY KEY,                   -- Unique identifier for each route
    RouteName VARCHAR(255) NOT NULL,              -- Name of the route
    OperationalDays VARCHAR(100) NOT NULL,        -- Days the route is operational
    Frequency VARCHAR(50) NOT NULL,               -- Frequency of the route
    TotalDistance NUMERIC(10, 2) NOT NULL,        -- Total distance in kilometers
    EstimatedTravelTime INTERVAL NOT NULL,        -- Estimated travel time
    RouteType VARCHAR(100) NOT NULL               -- Type of route
);

-- Table: RouteStop
CREATE TABLE RouteStop (
    RouteStopID SERIAL PRIMARY KEY,                 -- Unique identifier for each route stop
    PlatformNumber INT NOT NULL,                    -- Platform number at the stop
    StopOrder INT NOT NULL,                         -- Order of the stop in the route
    StopDuration INTERVAL,                          -- Duration of the stop
    ArrivalTime TIME,                               -- Expected arrival time at the stop
    DepartureTime TIME,                             -- Expected departure time from the stop
    DistanceFromPrevious NUMERIC(10, 2),            -- Distance from the previous stop
    RouteID INT NOT NULL,                           -- Many-to-one relationship with Route
    StationID INT NOT NULL,                         -- Many-to-one relationship with Station
    FOREIGN KEY (RouteID) REFERENCES Route(RouteID),
    FOREIGN KEY (StationID) REFERENCES Station(StationID),
    UNIQUE (RouteID, StopOrder),                    -- Prevents duplicate stop orders
    UNIQUE (RouteID, StationID)                     -- Prevents duplicate stations in the same route
);

-- Table: Railway
CREATE TABLE Railway (
    RailwayID SERIAL PRIMARY KEY,              -- Unique identifier for each railway
    TrainName VARCHAR(255) NOT NULL,           -- Name of the train
    Capacity INT NOT NULL,                     -- Total seating capacity
    MaximumSpeed NUMERIC(5, 2) NOT NULL,       -- Maximum speed in km/h
    YearOfManufacture INT NOT NULL,            -- Year of manufacture
    Manufacturer VARCHAR(255) NOT NULL,        -- Manufacturer's name
    EconomyClassSeats INT NOT NULL,            -- Number of Economy class seats
    BusinessClassSeats INT NOT NULL,           -- Number of Business class seats
    TrainType VARCHAR(100) NOT NULL            -- Type of train
);

-- Table: Schedule
CREATE TABLE Schedule (
    ScheduleID SERIAL PRIMARY KEY,                 -- Unique identifier for each schedule
    Frequency VARCHAR(100) NOT NULL,               -- Frequency of the schedule
    DepartureTime TIME NOT NULL,                   -- Departure time
    ArrivalTime TIME NOT NULL,                     -- Arrival time
    TotalDuration INTERVAL NOT NULL,               -- Total duration
    ScheduleDate DATE NOT NULL,                    -- Date of the schedule
    DaysOfOperation VARCHAR(100) NOT NULL,         -- Days of operation
    TrainNumber VARCHAR(50) NOT NULL,              -- Train number
    Status VARCHAR(50) NOT NULL,                   -- Status of the schedule
    RailwayID INT NOT NULL,                        -- Many-to-one relationship with Railway
    RouteID INT NOT NULL,                          -- Many-to-one relationship with Route
    FOREIGN KEY (RailwayID) REFERENCES Railway(RailwayID),
    FOREIGN KEY (RouteID) REFERENCES Route(RouteID)
);

-- Table: Passenger
CREATE TABLE Passenger (
    PassengerID SERIAL PRIMARY KEY,                -- Unique identifier for each passenger
    FirstName VARCHAR(100) NOT NULL,               -- First name
    LastName VARCHAR(100) NOT NULL,                -- Last name
    DateOfBirth DATE NOT NULL,                     -- Date of birth
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')), -- Gender with constraint
    Email VARCHAR(255) UNIQUE,                     -- Email address
    PhoneNumber VARCHAR(15),                       -- Phone number
    Address TEXT,                                  -- Address
    EmergencyContact VARCHAR(255)                  -- Emergency contact information
);

-- Table: Ticket
CREATE TABLE Ticket (
    TicketID SERIAL PRIMARY KEY,                     -- Unique identifier for each ticket
    TicketStatus VARCHAR(50) NOT NULL,               -- Status of the ticket
    PurchaseDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- Purchase date and time
    PaymentMethod VARCHAR(50),                       -- Payment method used
    DiscountApplied NUMERIC(5, 2) DEFAULT 0.0,       -- Discount applied
    BookingReference VARCHAR(50) UNIQUE NOT NULL,    -- Unique booking reference
    RefundAmount NUMERIC(10, 2) DEFAULT 0.0,         -- Refund amount, if applicable
    TotalPrice NUMERIC(10, 2) NOT NULL,              -- Total price of the ticket
    PassengerID INT NOT NULL,                        -- Many-to-one relationship with Passenger
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID)
);

-- Table: Seat
CREATE TABLE Seat (
    SeatID SERIAL PRIMARY KEY,                     -- Unique identifier for each seat
    CarriageNumber INT NOT NULL,                   -- Carriage number
    SeatNumber INT NOT NULL,                       -- Seat number within the carriage
    Class VARCHAR(50) NOT NULL,                    -- Class of the seat
    RailwayID INT NOT NULL,                        -- Many-to-one relationship with Railway
    FOREIGN KEY (RailwayID) REFERENCES Railway(RailwayID),
    UNIQUE (RailwayID, CarriageNumber, SeatNumber) -- Ensures seat uniqueness within a train
);

-- Table: TicketLeg
CREATE TABLE TicketLeg (
    TicketLegID SERIAL PRIMARY KEY,                 -- Unique identifier for each ticket leg
    LegOrder INT NOT NULL,                          -- Order of the leg in the journey
    BoardingStationID INT NOT NULL,                 -- Boarding station
    AlightingStationID INT NOT NULL,                -- Alighting station
    LegPrice NUMERIC(10, 2) NOT NULL,               -- Price for this leg
    SeatID INT NOT NULL,                            -- Assigned seat for this leg
    TicketID INT NOT NULL,                          -- Many-to-one relationship with Ticket
    ScheduleID INT NOT NULL,                        -- Many-to-one relationship with Schedule
    FOREIGN KEY (SeatID) REFERENCES Seat(SeatID),
    FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID),
    FOREIGN KEY (BoardingStationID) REFERENCES Station(StationID),
    FOREIGN KEY (AlightingStationID) REFERENCES Station(StationID),
    FOREIGN KEY (ScheduleID) REFERENCES Schedule(ScheduleID),
    UNIQUE (SeatID, ScheduleID),                    -- Ensures seat is assigned only once per schedule
    UNIQUE (TicketID, LegOrder)                     -- Ensures unique leg order per ticket
);
