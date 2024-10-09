-- Write a query to do the following. Try and use the concept of sub-queries.

-- 1.  You need to output details of the dish - 'f_name', 'f_cost' and 'f_type' ONLY if the following condition is satisfied

-- 2.  Average rating of the dish is greater than or equal to 4





SELECT f_name, f_cost, f_type
FROM food
WHERE f_id IN (
    SELECT f_id
    FROM ratings
    GROUP BY f_id
    HAVING AVG(f_rating) >= 4
);