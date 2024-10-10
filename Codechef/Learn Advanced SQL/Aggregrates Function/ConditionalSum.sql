-- Write a query to do the following

-- 1.  Find the sum of prices of the dishes fall that under the category 'Non veg' for each cuisine.

-- 2.  The output table should have the types of Cuisines and the sum of prices of the 'Non veg' dishes(mentioned under the column 'category') for each cuisine. Alias the sum function as 'Non_Veg_Price'.






SELECT cuisine,
SUM(CASE WHEN category = 'Non veg' THEN price ELSE 0 END) AS Non_Veg_Price 
FROM Orders
GROUP BY 1;