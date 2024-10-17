-- Write a query to output the following for the 'division_product_sales' table

-- 1.  product_id, product_type, average units sold in the year

-- 2.  group by the product_id

-- 3.  rename the average units sold column as 'avg_sold'





SELECT  product_id,
        product_type,
        AVG(units_sold) AS avg_sold
FROM division_product_sales
GROUP BY product_id;