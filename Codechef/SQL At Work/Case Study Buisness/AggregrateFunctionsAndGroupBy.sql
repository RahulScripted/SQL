-- Write a query which does the following

-- 1.  Output the columns Product_type, Total revenue and Total Profit_loss. Group by the product_type

-- 2.  Rename the columns as 'Annual_Revenue' and 'Annual_PnL' respectively





SELECT product_type, sum(revenue) AS Annual_revenue, sum(profit_loss) AS Annual_PnL
FROM Financials
GROUP BY product_type;