-- Write a query to group the dishes based on the price as:

-- High - If Price more than 18
-- Medium - If Price of the dishes is between 10 and 18
-- Low - If the price is less than 10.
-- The final output table should have the following 2 columns

-- The price group aliased as 'Pay_Category' as above. The count of the dishes falling in the respective category aliased as 'dish_count'






SELECT
CASE
    WHEN price > 18 THEN 'High'
    WHEN price BETWEEN 10 AND 18 THEN 'Medium'
    WHEN price < 10 THEN 'Low'
    ELSE 'NA'
    END AS Pay_Category,
COUNT(*) as Dish_count
FROM Orders
GROUP BY 1;