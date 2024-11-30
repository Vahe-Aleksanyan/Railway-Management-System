-- Ensure that a seat cannot be booked by more than one passenger on the same schedule.

-- Trigger Function
CREATE OR REPLACE FUNCTION prevent_double_booking()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM TicketLeg
        WHERE SeatID = NEW.SeatID
          AND ScheduleID = NEW.ScheduleID
          AND TicketLegID <> NEW.TicketLegID
    ) THEN
        RAISE EXCEPTION 'Seat % is already booked for Schedule %', NEW.SeatID, NEW.ScheduleID;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER trg_prevent_double_booking
BEFORE INSERT OR UPDATE ON TicketLeg
FOR EACH ROW EXECUTE FUNCTION prevent_double_booking();


-- will say  Seat 1 is already booked for Schedule 1
INSERT INTO TicketLeg (LegOrder,TicketLegID, BoardingStationID, AlightingStationID, LegPrice, SeatID, TicketID, ScheduleID)
VALUES (1, 11, 2, 3, 5000.00, 1, 11, 1);


-- Compute the total price of a ticket by summing up the prices of its ticket legs.

CREATE OR REPLACE FUNCTION calculate_total_ticket_price(p_ticket_id INT)
RETURNS NUMERIC(10, 2) AS $$
DECLARE
    v_total_price NUMERIC(10, 2);
BEGIN
    SELECT SUM(LegPrice)
    INTO v_total_price
    FROM TicketLeg
    WHERE TicketID = p_ticket_id;

    RETURN COALESCE(v_total_price, 0.00);
END;
$$ LANGUAGE plpgsql;

SELECT calculate_total_ticket_price(1) AS total_price;


-- Automatically update the TotalPrice in the Ticket table whenever a new ticket leg is added or updated.

-- Trigger Function
CREATE OR REPLACE FUNCTION update_ticket_total_price()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Ticket
    SET TotalPrice = calculate_total_ticket_price(NEW.TicketID)
    WHERE TicketID = NEW.TicketID;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER trg_update_ticket_total_price
AFTER INSERT OR UPDATE ON TicketLeg
FOR EACH ROW EXECUTE FUNCTION update_ticket_total_price();


-- test
-- Assume TicketID=5 exists and initial TotalPrice is some value
-- Check initial TotalPrice
SELECT TotalPrice FROM Ticket WHERE TicketID = 5;

-- Insert a new TicketLeg for TicketID=5
INSERT INTO TicketLeg (TicketLegID, LegOrder, BoardingStationID, AlightingStationID, LegPrice, SeatID, TicketID, ScheduleID)
VALUES (15, 2, 5, 6, 3000.00, 8, 5, 3);

-- Check updated TotalPrice
SELECT TotalPrice FROM Ticket WHERE TicketID = 5;


-- Check if a specific seat is available for a given schedule.

CREATE OR REPLACE FUNCTION is_seat_available(p_seat_id INT, p_schedule_id INT)
RETURNS BOOLEAN AS $$
DECLARE
    v_count INT;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM TicketLeg
    WHERE SeatID = p_seat_id
      AND ScheduleID = p_schedule_id;

    RETURN v_count = 0;
END;
$$ LANGUAGE plpgsql;

SELECT is_seat_available(1, 1) AS seat_available;




-- Ensure that discounts applied to tickets do not exceed a certain percentage, e.g., maximum 50% discount.

-- Trigger Function
CREATE OR REPLACE FUNCTION enforce_discount_limit()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.DiscountApplied < 0 OR NEW.DiscountApplied > 50 THEN
        RAISE EXCEPTION 'DiscountApplied % is out of allowed range (0-50)', NEW.DiscountApplied;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER trg_enforce_discount_limit
BEFORE INSERT OR UPDATE ON Ticket
FOR EACH ROW EXECUTE FUNCTION enforce_discount_limit();


-- test

-- Attempt to insert a ticket with a 60% discount
INSERT INTO Ticket (TicketStatus, PaymentMethod, DiscountApplied, BookingReference, TotalPrice, PassengerID)
VALUES ('Confirmed', 'Credit Card', 60.00, 'BR-1012', 2000.00, 3);


--Get the list of upcoming train schedules that stop at a particular station on a given date.

CREATE OR REPLACE FUNCTION get_upcoming_schedules(p_station_id INT, p_schedule_date DATE)
RETURNS TABLE (
    ScheduleID INT,
    TrainNumber VARCHAR,
    DepartureTime TIME,
    ArrivalTime TIME,
    Status VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        s.ScheduleID,
        s.TrainNumber,
        rs.DepartureTime,
        rs.ArrivalTime,
        s.Status
    FROM Schedule s
    JOIN RouteStop rs ON s.RouteID = rs.RouteID
    WHERE rs.StationID = p_station_id
      AND s.ScheduleDate = p_schedule_date
    ORDER BY rs.DepartureTime;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM get_upcoming_schedules(1, '2024-11-27');


-- Compute the total distance of a route by summing the distances between its stops.

CREATE OR REPLACE FUNCTION calculate_route_total_distance(p_route_id INT)
RETURNS NUMERIC(10, 2) AS $$
DECLARE
    v_total_distance NUMERIC(10, 2);
BEGIN
    SELECT SUM(DistanceFromPrevious)
    INTO v_total_distance
    FROM RouteStop
    WHERE RouteID = p_route_id;

    RETURN COALESCE(v_total_distance, 0.00);
END;
$$ LANGUAGE plpgsql;

SELECT calculate_route_total_distance(1) AS total_distance;



-- Retrieve the travel history of a passenger, including all tickets and journeys they've taken.

CREATE OR REPLACE FUNCTION get_passenger_travel_history(p_passenger_id INT)
RETURNS TABLE (
    TicketID INT,
    PurchaseDate TIMESTAMP,
    TicketStatus VARCHAR,
    LegOrder INT,
    BoardingStation VARCHAR,
    AlightingStation VARCHAR,
    ScheduleDate DATE,
    TrainNumber VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        t.TicketID,
        t.PurchaseDate,
        t.TicketStatus,
        tl.LegOrder,
        bs.StationName AS BoardingStation,
        als.StationName AS AlightingStation,
        s.ScheduleDate,
        s.TrainNumber
    FROM Ticket t
    JOIN TicketLeg tl ON t.TicketID = tl.TicketID
    JOIN Station bs ON tl.BoardingStationID = bs.StationID
    JOIN Station als ON tl.AlightingStationID = als.StationID
    JOIN Schedule s ON tl.ScheduleID = s.ScheduleID
    WHERE t.PassengerID = p_passenger_id
    ORDER BY t.PurchaseDate DESC, tl.LegOrder;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM get_passenger_travel_history(1);
