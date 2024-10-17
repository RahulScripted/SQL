-- Correlated Sub-query and Table Join





SELECT pc.product_id,
        dps.min_sold, 
        dps.month
FROM product_catalog AS pc

join (
    SELECT 
        s1.product_id,
        s1.units_sold AS min_sold,
        s1.month 
    FROM division_product_sales AS s1
    WHERE s1.units_sold = (
        SELECT 
            MIN(s2.units_sold) 
        FROM division_product_sales AS s2 
        WHERE s2.product_id = s1.product_id
        )
    ) AS dps
ON (pc.product_id = dps.product_id)
ORDER BY pc.product_id;