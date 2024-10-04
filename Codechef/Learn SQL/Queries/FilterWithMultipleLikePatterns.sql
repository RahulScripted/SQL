-- Filter with multiple Like patterns




SELECT * 
FROM Flights
WHERE Destination LIKE '%o' AND Origin LIKE 'M%';