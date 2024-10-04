-- You are given a query which is trying to output entries that meets both the conditions: Passenger gender - Female AND Flight destination - Delhi.





SELECT * 
FROM flights
WHERE gender like '%Female%' AND destination like 'D%';