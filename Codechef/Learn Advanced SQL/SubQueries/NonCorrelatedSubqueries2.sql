-- Write a query to fetch Name and type of the food from the table 'food' which has got rating less than 3 in the table 'ratings'





SELECT f_name, f_type
FROM food
WHERE f_id in (
    SELECT f_id
    FROM ratings
    WHERE f_rating < 3
);