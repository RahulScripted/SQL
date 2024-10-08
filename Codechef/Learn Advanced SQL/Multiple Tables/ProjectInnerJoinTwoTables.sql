-- Write a query which does the following

-- 1.  Join the table 'Customer' and 'Purchase' using Customer_id as the common column in the table.

-- 2.  Output all entries from the joined table.





SELECT *
FROM Customer C
JOIN Purchase P
ON C.Customer_id = P.Customer_id;