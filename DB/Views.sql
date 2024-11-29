--Shows the availability of seats for each schedule, indicating which seats are booked and which are available.

CREATE OR REPLACE VIEW SeatAvailability AS
SELECT
    s.ScheduleID,
    s.ScheduleDate,
    s.DepartureTime,
    s.ArrivalTime,
    ry.TrainName,
    ry.TrainType,
    st.SeatID,
    st.CarriageNumber,
    st.SeatNumber,
    st.Class,
    CASE WHEN tl.SeatID IS NULL THEN 'Available' ELSE 'Booked' END AS SeatStatus
FROM Schedule s
JOIN Railway ry ON s.RailwayID = ry.RailwayID
JOIN Seat st ON ry.RailwayID = st.RailwayID
LEFT JOIN (
    SELECT DISTINCT SeatID, ScheduleID FROM TicketLeg
) tl ON st.SeatID = tl.SeatID AND s.ScheduleID = tl.ScheduleID
ORDER BY s.ScheduleID, st.CarriageNumber, st.SeatNumber;


SELECT * FROM SeatAvailability WHERE ScheduleID = 1 AND SeatStatus = 'Available';


--Aggregates revenue data, showing total earnings per schedule, route, or date.

CREATE OR REPLACE VIEW RevenueSummary AS
SELECT
    s.ScheduleID,
    s.ScheduleDate,
    s.TrainNumber,
    r.RouteName,
    SUM(t.TotalPrice - t.RefundAmount) AS TotalRevenue,
    COUNT(DISTINCT t.TicketID) AS TicketsSold
FROM Schedule s
JOIN Route r ON s.RouteID = r.RouteID
JOIN TicketLeg tl ON s.ScheduleID = tl.ScheduleID
JOIN Ticket t ON tl.TicketID = t.TicketID
WHERE t.TicketStatus = 'Confirmed'
GROUP BY s.ScheduleID, s.ScheduleDate, s.TrainNumber, r.RouteName
ORDER BY s.ScheduleDate DESC, s.TrainNumber;

SELECT * FROM RevenueSummary WHERE ScheduleDate = '2024-11-27';



-- Shows the capacity utilization of trains on each schedule, indicating how full each train is.
CREATE OR REPLACE VIEW TrainCapacityUtilization AS
SELECT
    s.ScheduleID,
    s.ScheduleDate,
    s.TrainNumber,
    ry.TrainName,
    ry.Capacity,
    COUNT(DISTINCT t.TicketID) AS TicketsSold,
    (COUNT(DISTINCT t.TicketID)::DECIMAL / ry.Capacity) * 100 AS UtilizationPercentage
FROM Schedule s
JOIN Railway ry ON s.RailwayID = ry.RailwayID
JOIN TicketLeg tl ON s.ScheduleID = tl.ScheduleID
JOIN Ticket t ON tl.TicketID = t.TicketID
WHERE t.TicketStatus = 'Confirmed'
GROUP BY s.ScheduleID, s.ScheduleDate, s.TrainNumber, ry.TrainName, ry.Capacity
ORDER BY s.ScheduleDate DESC, s.TrainNumber;


SELECT * FROM TrainCapacityUtilization WHERE ScheduleDate = '2024-11-27';

