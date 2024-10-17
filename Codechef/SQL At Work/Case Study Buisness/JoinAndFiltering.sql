-- High margin products are super important for ABC Retail's profitability. Write a query to output the following

-- 1.  product_type, product_id, units_sold and month for all 'High_Margin' products sold in the year

-- 2.  JOIN 'monthly_sales' on 'division_product_sales' on the column 'month'





SELECT dps.product_type, 
       dps.product_id, 
       dps.units_sold, 
       dps.month
FROM division_product_sales as dps
JOIN monthly_sales as ms ON (dps.month = ms.month)
WHERE type_of_product = 'High_Margin';