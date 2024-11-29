# Railway-Management-System
scheduling trains, managing tickets, handling passenger information, and overseeing routes and stations


## **Key Features**

### **1. Database Schema**

The system utilizes a well-structured PostgreSQL database with the following key entities:

- **Country:** Stores information about countries, including name, population, area, and geographic coordinates.
- **City:** Contains city details, such as name, population, and whether it's a capital city linked to a country.
- **Station:** Represents railway stations with attributes like name, code, type, number of platforms, facilities, and operational status associated with a city.
- **Passenger:** Holds passenger details, including personal and contact information.
- **Ticket:** Manages ticket information, including status, purchase date, payment method, discount applied, booking reference, and total price linked to a passenger.
- **TicketLeg:** Represents individual legs of a journey within a ticket, including boarding and alighting stations, leg price, and associated schedule and seat.
- **Seat:** Details about seats, including carriage number, seat number, class, and associated railway (train).
- **Railway (Train):** Information about trains, such as name, capacity, maximum speed, year of manufacture, manufacturer, number of seats in each class, and type.
- **Schedule:** Manages train schedules, including departure and arrival times, total duration, schedule date, days of operation, train number, and status linked to a railway and route.
- **Route:** Defines routes with attributes like name, operational days, frequency, total distance, estimated travel time, and type.
- **RouteStop:** Details about stops along a route, including platform number, stop order, arrival and departure times, stop duration, and distance from the previous stop, associated with a route and station

### **2. Business Logic and Triggers**

To maintain data integrity and enforce business rules, the system implements several database triggers and functions:

- **Trigger for Seat Availability:** Ensures that a seat cannot be double-booked on the same schedule.
- **Trigger for Ticket Leg Order:** Validates that the leg orders within a ticket are sequential and unique.
- **Trigger for Ticket Price Calculation:** Automatically calculates and updates the total ticket price based on the sum of its ticket legs.
- **Trigger for Discount Enforcement:** Ensures that discounts applied to tickets do not exceed 50% and are not negative.


### **3. Web Application**

The front end of the system is a web application built using C# with ASP.NET Core MVC, providing an interface for users to interact with the railway management system.

- **Controllers and Views:**
  - **CountryController:** Handles CRUD operations for countries.
  - **CityController:** Manages cities, including linking them to countries.
  - **StationController:** Oversees station information and their associations with cities.
  - **PassengerController:** Manages passenger data.
  - **TicketController:** Handles ticket operations, including creating tickets and viewing ticket details.
  - **ScheduleController:** Displays train schedules and related information.
 
- - **User Interface:**
  - **Responsive Design:** Utilizes Bootstrap for styling to ensure the application is user-friendly and accessible on various devices.
  - **Navigation:** Provides intuitive navigation menus to access different parts of the application.
  - **Forms and Validations:** Implements forms for data entry with client-side and server-side validations to enhance data integrity.

### **4. Backend Logic**

- **Entity Framework Core:** Utilizes EF Core as the Object-Relational Mapping (ORM) tool to interact with the PostgreSQL database, allowing for seamless data operations using C# classes.
- **Dependency Injection:** Implements dependency injection for services and the database context to promote modularity and testability.
- **Asynchronous Programming:** Uses asynchronous methods (async and await) to improve application responsiveness and performance
