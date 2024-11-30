-- Table: Country
CREATE TABLE Country (
    CountryID SERIAL PRIMARY KEY,                
    CountryName VARCHAR(255) NOT NULL,         
    Longitude NUMERIC(9, 6),                     
    Latitude NUMERIC(9, 6),                      
    Population BIGINT,                           
    Continent VARCHAR(100),                      
    Region VARCHAR(100),                          
    Area DECIMAL(18, 2)                           
);

-- Table: City
CREATE TABLE City (
    CityID SERIAL PRIMARY KEY,                   
    CityName VARCHAR(255) NOT NULL,              
    Longitude NUMERIC(9, 6) NOT NULL,             
    Latitude NUMERIC(9, 6) NOT NULL,              
    Population INT NOT NULL,                      
    IsCapital BOOLEAN DEFAULT FALSE,             
    CountryID INT NOT NULL,                     
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

-- Table: Station
CREATE TABLE Station (
    StationID SERIAL PRIMARY KEY,                  
    StationName VARCHAR(255) NOT NULL,             
    Latitude NUMERIC(9, 6) NOT NULL,                
    Longitude NUMERIC(9, 6) NOT NULL,               
    StationCode VARCHAR(10) UNIQUE NOT NULL,        
    StationType VARCHAR(50) NOT NULL,               
    NumberOfPlatforms INT NOT NULL,                 
    Facilities TEXT,                                
    OperationalStatus VARCHAR(50) NOT NULL,         
    CityID INT NOT NULL,                            
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

-- Table: Route
CREATE TABLE Route (
    RouteID SERIAL PRIMARY KEY,                 
    RouteName VARCHAR(255) NOT NULL,              
    OperationalDays VARCHAR(100) NOT NULL,       
    Frequency VARCHAR(50) NOT NULL,               
    TotalDistance NUMERIC(10, 2) NOT NULL,       
    EstimatedTravelTime INTERVAL NOT NULL,       
    RouteType VARCHAR(100) NOT NULL               
);

-- Table: RouteStop
CREATE TABLE RouteStop (
    RouteStopID SERIAL PRIMARY KEY,                
    PlatformNumber INT NOT NULL,                    
    StopOrder INT NOT NULL,                        
    StopDuration INTERVAL,                         
    ArrivalTime TIME,                              
    DepartureTime TIME,                            
    DistanceFromPrevious NUMERIC(10, 2),           
    RouteID INT NOT NULL,                         
    StationID INT NOT NULL,                        
    FOREIGN KEY (RouteID) REFERENCES Route(RouteID),
    FOREIGN KEY (StationID) REFERENCES Station(StationID),
    UNIQUE (RouteID, StopOrder),                   
    UNIQUE (RouteID, StationID)                    
);

-- Table: Railway
CREATE TABLE Railway (
    RailwayID SERIAL PRIMARY KEY,             
    TrainName VARCHAR(255) NOT NULL,          
    Capacity INT NOT NULL,                    
    MaximumSpeed NUMERIC(5, 2) NOT NULL,       
    YearOfManufacture INT NOT NULL,            
    Manufacturer VARCHAR(255) NOT NULL,       
    EconomyClassSeats INT NOT NULL,            
    BusinessClassSeats INT NOT NULL,          
    TrainType VARCHAR(100) NOT NULL           
);

-- Table: Schedule
CREATE TABLE Schedule (
    ScheduleID SERIAL PRIMARY KEY,                 
    Frequency VARCHAR(100) NOT NULL,              
    DepartureTime TIME NOT NULL,                  
    ArrivalTime TIME NOT NULL,                    
    TotalDuration INTERVAL NOT NULL,              
    ScheduleDate DATE NOT NULL,                   
    DaysOfOperation VARCHAR(100) NOT NULL,        
    TrainNumber VARCHAR(50) NOT NULL,              
    Status VARCHAR(50) NOT NULL,                   
    RailwayID INT NOT NULL,                        
    RouteID INT NOT NULL,                          
    FOREIGN KEY (RailwayID) REFERENCES Railway(RailwayID),
    FOREIGN KEY (RouteID) REFERENCES Route(RouteID)
);

-- Table: Passenger
CREATE TABLE Passenger (
    PassengerID SERIAL PRIMARY KEY,               
    FirstName VARCHAR(100) NOT NULL,              
    LastName VARCHAR(100) NOT NULL,               
    DateOfBirth DATE NOT NULL,                     
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')), 
    Email VARCHAR(255) UNIQUE,                    
    PhoneNumber VARCHAR(15),                       
    Address TEXT,                                  
    EmergencyContact VARCHAR(255)                 
);

-- Table: Ticket
CREATE TABLE Ticket (
    TicketID SERIAL PRIMARY KEY,                    
    TicketStatus VARCHAR(50) NOT NULL,              
    PurchaseDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    PaymentMethod VARCHAR(50),                       
    DiscountApplied NUMERIC(5, 2) DEFAULT 0.0,       
    BookingReference VARCHAR(50) UNIQUE NOT NULL,    
    RefundAmount NUMERIC(10, 2) DEFAULT 0.0,        
    TotalPrice NUMERIC(10, 2) NOT NULL,              
    PassengerID INT NOT NULL,                        
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID)
);

-- Table: Seat
CREATE TABLE Seat (
    SeatID SERIAL PRIMARY KEY,                     
    CarriageNumber INT NOT NULL,                   
    SeatNumber INT NOT NULL,                      
    Class VARCHAR(50) NOT NULL,                   
    RailwayID INT NOT NULL,                       
    FOREIGN KEY (RailwayID) REFERENCES Railway(RailwayID),
    UNIQUE (RailwayID, CarriageNumber, SeatNumber) 
);

-- Table: TicketLeg
CREATE TABLE TicketLeg (
    TicketLegID SERIAL PRIMARY KEY,                 
    LegOrder INT NOT NULL,                         
    BoardingStationID INT NOT NULL,                 
    AlightingStationID INT NOT NULL,                
    LegPrice NUMERIC(10, 2) NOT NULL,              
    SeatID INT NOT NULL,                            
    TicketID INT NOT NULL,                         
    ScheduleID INT NOT NULL,                        
    FOREIGN KEY (SeatID) REFERENCES Seat(SeatID),
    FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID),
    FOREIGN KEY (BoardingStationID) REFERENCES Station(StationID),
    FOREIGN KEY (AlightingStationID) REFERENCES Station(StationID),
    FOREIGN KEY (ScheduleID) REFERENCES Schedule(ScheduleID),
    UNIQUE (SeatID, ScheduleID),                    
    UNIQUE (TicketID, LegOrder)                     
);


DROP VIEW IF EXISTS SeatAvailability; 
DROP VIEW IF EXISTS RevenueSummary;   
DROP VIEW IF EXISTS traincapacityutilization;   
DROP TABLE IF EXISTS TicketLeg;
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS Seat;
DROP TABLE IF EXISTS Schedule;
DROP TABLE IF EXISTS RouteStop;
DROP TABLE IF EXISTS Station;
DROP TABLE IF EXISTS Route;
DROP TABLE IF EXISTS Railway;
DROP TABLE IF EXISTS Passenger;
DROP TABLE IF EXISTS City;
DROP TABLE IF EXISTS Country;

