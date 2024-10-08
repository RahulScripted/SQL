-- Write a query which does the following

-- 1.  Output a table with the list of customer - purchase item combinations using CROSS JOIN.

-- 2.  The output table should contain the columns 'Customer_Name' and 'Item_Name'.





SELECT Customer_Name,Item_Name
FROM Customer
CROSS JOIN Item;