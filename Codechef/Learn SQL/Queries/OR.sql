-- The OR clause is used along with WHERE to filter the table which meets any one of the given multiple conditions.




SELECT * 
FROM Flights
WHERE Origin = "Mumbai" OR Destination = "Mumbai";