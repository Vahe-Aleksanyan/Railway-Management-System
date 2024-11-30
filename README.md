# Railway-Management-System

Scheduling trains, managing tickets, handling passenger information, and overseeing routes and stations


### Database Schema

This consists of a PostgreSQL database that contains the following tables:

- Country - Country information like name, population, area, and geographic coordinates
City - Information about the cities, like name, population, whether it is the capital of the country, etc.
- Station - The railway station information such as name, code, type, number of platforms, facilities, and operational status associated with a city.
- Passenger: Maintains passenger information, including personal and contact information.
- Ticket: Provides information about tickets, including status, purchase date, payment method, applied discount, booking reference, and total price for a passenger.
- TicketLeg: This is a part of the ticket; one ticket can have multiple legs; each leg of the journey has a boarding and alighting station, leg price, and an associated schedule and seat.
- Seat: Seat information includes carriage number, seat number, class, and associated railway (train).
- Railway: Train's details like name, capacity, maximum speed, year of manufacture, manufacturer, number of seats in each class, and type.
- Schedule: This stores the train schedule: departure time, arrival time, total duration, date of schedule, days in operation, number of the train, and status, all linked to a railway and route.
- Route: The details of the routes will contain name, operational days, frequency, total distance, estimated time to travel, and type.
- RouteStop: Details about stops along a route, including platform number, stop order, arrival and departure times, stop duration, and distance from the previous stop, associated with a route and station



### Web Application

The front end of the system is a web application built in C# using ASP.NET Core MVC, serving as an interface for users of the railway management system.

Some of the controllers and views include:

- Controllers and Views:
  - CountryController: Handles CRUD operations related to countries.
  - CityController: Handles cities and associates them with countries.
  - StationController: Provides information about stations and relates them to cities.
  - PassengerController: passenger information management.
- TicketController: This handles operations related to the ticket, thus creating tickets and viewing the ticket details.
  - ScheduleController: It shows the schedules of the trains and further details connected to it.

### User Interface
- Responsive Design: The application uses Bootstrap styling, hence this application is user-friendly and it can be accessed through any available device.
- Navigation: The navigation menus can be accessed with ease.
- Forms and Validations: Implements forms for data entry with client-side and server-side validations to enhance data integrity.

### Backend Logic

- Entity Framework Core: Utilizes EF Core as the Object-Relational Mapping (ORM) tool to interact with the PostgreSQL database, thus enabling seamless data operations using C# classes.
- Dependency Injection: Dependency injection for services and the database context is implemented to enable modularity and testability.
- Asynchronous Programming: Applies asynchronous methods for the responsiveness of an application, which improves its performance.


### Query Descriptions

1. Update Station Information  
   Updates the name and operational status of a specific station.

2. Average Waiting Time  
The Schedule table allows us to determine the average stopping/waiting time at a certain station based on all trains passing through it.
3. Ticket Sales  
Summarizes total revenue grouped by seat class and route from a given date.

4. High-Demand Routes  
 Most frequently used 5 routes can be determined using the bookings in the Schedule and Ticket tables to further analyze the needs of passengers.

5. Busiest Station  
This query would show which station is in the most routes and here the start, end and stop-over stations are considered.

6. Routes Passing Through Most Countries  
This report would contain routes that passed through the highest number of countries according to the geographical location of the start, intermediary stops and end stations.

7. Trains Between Cities  
This query would show all trains traveling between two given cities, their stops along the way and the total time for taking that route.

8. Total Seats by Class for a Route  
This would give a total of the seating capacity of the business class as well as the economy class in trains that move along a certain route.
9. Route Distance Report  
    Sorts routes by total distance in descending order.

10. Update Business Class Seats  
Decreases business class seat availability by one if needed.



### Function and Trigger Descriptions

1. Prevent Double Booking 
   Ensures multiple passengers cannot book a seat for the same schedule. In case of conflict, an error is raised.

2. Calculate Total Ticket Price 
   Calculates total ticket price by summing all associated ticket leg prices.

3. Update Ticket Total Price
Automatically recalculates the total ticket price when any ticket leg is added or updated.

4. Check Seat Availability  
   Checks whether a seat is available for a particular schedule. Returns TRUE if available, FALSE otherwise.

5. Enforce Discount Limit  
   Checks that discounts applied to tickets are within the allowed range (0-50%). Error is thrown if the rule is violated.

6. Get Upcoming Schedules  
   Retrieves a list of the upcoming train schedules stopping at a particular station on a given date.

7. Calculate Route Total Distance  
   Calculates a route's total distance based on the sum of all its stop distances.

8. Get Passenger Travel History
Provides a full history of a passenger's tickets and journeys, including boarding and alighting stations, scheduled dates, and train numbers.


### View Descriptions

1. SeatAvailability 
   Gives the availability of seats for each schedule, including information such as schedule date, details about the train, seat ID, carriage, and seat number. Also, each seat is marked as either 'Available' or 'Booked'.

2. RevenueSummary 
   Provides a summary of revenue by schedule, route, or date. Total earnings, number of tickets sold, and corresponding schedule and route information are included.

3. TrainCapacityUtilization
The report shows the train capacity utilization per schedule. It also shows train capacity, sold tickets, and utilization percentage for evaluation of occupancy of trains.



### Some tips for running the project.
1. Configure the database connection
2. Run all the SQL files in pgAdmin
3. You need to have .NET6 or newer version on your computer
4. Open the RailwayStationManagement Solution in IDE
5. Make sure all packages are installed
6. Make sure to have correct database credentials written in appsettings.json
7. Hit the run button in your IDE
