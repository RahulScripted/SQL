-- In which months of the year was the units sold higher than the annual average for the each product_id? Write a query to output the following product_id, product_type, units_sold and the month where the units sold is higher than annual average for the given product_id






SELECT  dps.product_id, 
        dps.product_type,
        dps.units_sold,
        dps.month
FROM division_product_sales AS dps
WHERE units_sold > (
    SELECT avg(dps1.units_sold)
    FROM division_product_sales AS dps1
    WHERE dps1.product_id = dps.product_id
);