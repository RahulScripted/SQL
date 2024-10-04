-- Write a query which meets the following conditions : Passenger_id is blank or null & Order by passenger_name




SELECT *
FROM Flights
WHERE Passenger_id IS NULL
ORDER BY Passenger_name;