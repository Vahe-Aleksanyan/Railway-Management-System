-- 1. Station and Route Configuration

-- Update station information


UPDATE Station
SET StationName = 'Yerevani Himnakan Kayaran', OperationalStatus = 'Operational'
WHERE StationID = 1;


-- Add a new route
INSERT INTO Route (RouteID, RouteName, OperationalDays, Frequency, TotalDistance, EstimatedTravelTime, RouteType)
VALUES (6, 'Gyumriic Vanadzor', 'Yerekushabti, Choreqshabti, Urbat', 'Ereq angam shabatakan', 70.00, '01:30:00', 'Passenger');

-- Add stops to a route
INSERT INTO RouteStop (PlatformNumber, StopOrder, StopDuration, ArrivalTime, DepartureTime, DistanceFromPrevious, RouteID, StationID)
VALUES 
(1, 1, '00:10:00', NULL, '08:00:00', 0.00, 6, 2),   -- Gyumri Kayaran
(1, 2, '00:15:00', '09:15:00', '09:30:00', 40.00, 6, 3), -- Vanadzor Kayaran
(1, 3, NULL, '10:15:00', NULL, 30.00, 6, 4);        -- Dilijan Kayaran






--average waiting time

SELECT
    S.StationName,
    AVG(RS.StopDuration) AS AverageStopDuration
FROM
    RouteStop RS
JOIN
    Station S ON RS.StationID = S.StationID
WHERE
    RS.StationID = 1
GROUP BY
    S.StationName;


--ticket sales
SELECT
    S.Class AS SeatClass,
    R.RouteName,
    SUM(T.TotalPrice) AS TotalRevenue
FROM
    Ticket T
JOIN
    TicketLeg TL ON T.TicketID = TL.TicketID
JOIN
    Schedule SC ON TL.ScheduleID = SC.ScheduleID
JOIN
    Route R ON SC.RouteID = R.RouteID
JOIN
    Seat S ON TL.SeatID = S.SeatID
WHERE
    T.PurchaseDate >= '2024-11-26' AND T.PurchaseDate < '2024-11-27'
GROUP BY
    S.Class,
    R.RouteName
ORDER BY
    R.RouteName,
    S.Class;


--high demand routes

SELECT
    R.RouteName,
    COUNT(T.TicketID) AS TicketCount
FROM
    Ticket T
JOIN
    TicketLeg TL ON T.TicketID = TL.TicketID
JOIN
    Schedule SC ON TL.ScheduleID = SC.ScheduleID
JOIN
    Route R ON SC.RouteID = R.RouteID
GROUP BY
    R.RouteName
ORDER BY
    TicketCount DESC
LIMIT 5;

--busiest station based on routes

SELECT
    S.StationName,
    COUNT(DISTINCT RS.RouteID) AS NumberOfRoutes
FROM
    RouteStop RS
JOIN
    Station S ON RS.StationID = S.StationID
GROUP BY
    S.StationName
ORDER BY
    NumberOfRoutes DESC
LIMIT 1;




--Trains Traveling Between Two Specific Cities

SELECT DISTINCT r.RouteName, 
       rs1.StationID AS StartStationID, 
       s1.StationName AS StartStation, 
       rs2.StationID AS EndStationID, 
       s2.StationName AS EndStation, 
       ARRAY_AGG(DISTINCT si.StationName) AS IntermediateStops, 
       r.TotalDistance, 
       r.EstimatedTravelTime
FROM Route r
JOIN RouteStop rs1 ON r.RouteID = rs1.RouteID
JOIN Station s1 ON rs1.StationID = s1.StationID
JOIN RouteStop rs2 ON r.RouteID = rs2.RouteID
JOIN Station s2 ON rs2.StationID = s2.StationID
LEFT JOIN RouteStop ri ON r.RouteID = ri.RouteID AND ri.StationID NOT IN (rs1.StationID, rs2.StationID)
LEFT JOIN Station si ON ri.StationID = si.StationID
WHERE s1.CityID = 1 AND s2.CityID = 2 -- Replace with specific CityIDs
GROUP BY r.RouteName, rs1.StationID, s1.StationName, rs2.StationID, s2.StationName, r.TotalDistance, r.EstimatedTravelTime;




--Total Number of Business and Economy Class Seats for a Specific Route
SELECT r.RouteName, 
       SUM(rw.BusinessClassSeats) AS TotalBusinessSeats, 
       SUM(rw.EconomyClassSeats) AS TotalEconomySeats
FROM Route r
JOIN Schedule sch ON r.RouteID = sch.RouteID
JOIN Railway rw ON sch.RailwayID = rw.RailwayID
WHERE r.RouteID = 2 -- Replace with specific RouteID
GROUP BY r.RouteName;



--Routes Passing Through the Most Countries
SELECT r.RouteName, 
       COUNT(DISTINCT c.CountryID) AS CountryCount
FROM Route r
JOIN RouteStop rs ON r.RouteID = rs.RouteID
JOIN Station s ON rs.StationID = s.StationID
JOIN City ci ON s.CityID = ci.CityID
JOIN Country c ON ci.CountryID = c.CountryID
GROUP BY r.RouteName
ORDER BY CountryCount DESC
LIMIT 8; -- Adjust to show more routes if needed




--Report of Routes Sorted by Total Distance

SELECT RouteName, TotalDistance
FROM Route
ORDER BY TotalDistance DESC;



-- Update for Business Class Seats:
UPDATE Railway
SET BusinessClassSeats = BusinessClassSeats - 1
WHERE RailwayID = (
    SELECT DISTINCT sch.RailwayID
    FROM Schedule sch
    JOIN TicketLeg tl ON sch.ScheduleID = tl.ScheduleID
    JOIN Seat s ON s.SeatID = tl.SeatID
    WHERE tl.TicketID = 1 AND s.Class = 'Business'
    LIMIT 1  -- Ensure only one RailwayID is returned
);

