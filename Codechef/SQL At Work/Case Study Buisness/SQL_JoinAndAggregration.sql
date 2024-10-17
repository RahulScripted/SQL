--  SQL Join and Aggregation





SELECT p.product_id,p.selling_price, MAX(d.units_sold) AS max_sold,d.month
FROM product_catalog AS p
JOIN division_product_sales AS d
ON p.product_id=d.product_id
GROUP BY month
ORDER BY max_sold DESC,selling_price DESC;