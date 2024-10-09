-- Write a query to do the following

-- 1.  Find the dishes which cost more than the average cost of all the dishes at the restaurant

-- 2.  You need to output f_name, f_cost, f_type for such dishes





SELECT f_name, f_cost, f_type
FROM food
WHERE f_cost > (SELECT AVG(f_cost) FROM food);