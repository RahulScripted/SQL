-- You need to output entries from the table which meet the following conditions: Destination is 'Cairo' & Entries are ordered by passenger_name in a descending order





SELECT *
FROM Flights
WHERE Destination = "Cairo"
ORDER BY Passenger_name DESC;