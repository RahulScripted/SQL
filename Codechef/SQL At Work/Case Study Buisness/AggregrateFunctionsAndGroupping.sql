-- Write a query to output the following

-- 1.  Month-wise revenue and loss for the complete year 2020

-- 2.  Order by decreasing profits for each month

-- 3.  Rename the monthwise revenue column as 'monthly_revenue' and montwise profit / loss column as 'monthly_pnl' while running the query






SELECT month, sum(revenue) AS monthly_revenue, sum(profit_loss) AS monthly_pnl
FROM financials
GROUP BY month
ORDER BY monthly_pnl DESC;