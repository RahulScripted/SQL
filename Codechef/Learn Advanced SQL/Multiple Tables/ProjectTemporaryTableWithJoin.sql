-- Write a query which does the following

-- 1.  Identify the 3 highest value purchases from 'Purchase' using WITH and store them as 'top_purchase'

-- 2.  Join 'Customer' and 'Top_purchase' on the column 'Customer_id'

-- 3.  Output all entries in the joined table




With top_purchase AS(  
    SELECT Purchase_id,Customer_id,Purchase_Amt
    FROM Purchase
    ORDER BY Purchase_Amt DESC
    LIMIT 3
)
   
SELECT *
FROM Customer
JOIN top_purchase
ON Customer.Customer_id = top_purchase.Customer_id;