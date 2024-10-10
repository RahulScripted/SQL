-- Write a query to do the following : Find out what percentage of the total revenue (sum of all orders) is contributed by American Cuisine. - Alias the percentage calculation function as 'American_Revenue'. Round the final value to 2 decimal places






SELECT ROUND((100*(SUM(CASE WHEN cuisine= 'American' THEN price ELSE 0 END))/SUM(price)),2) AS American_Revenue
FROM Orders;