-- Write a query that does the following

-- 1.  Join the table 'Customer' and 'Purchase' using Customer_id as the common column in the table.

-- 2.  Output the joined table. The output should include the list of customers who haven't made any purchases yet.






SELECT *
FROM Customer
LEFT JOIN Purchase
ON Customer.Customer_id = Purchase.Customer_id;