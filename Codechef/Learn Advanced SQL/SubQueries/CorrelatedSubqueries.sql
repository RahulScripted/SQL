-- Write a query to retrieve the names of food items which cost less than the average cost of 'Continental' food type(f_type).





SELECT f_name
FROM food as f
WHERE f_cost < (SELECT avg(f_cost)
                FROM food
                WHERE f_type = 'Continental'
);