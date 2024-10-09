-- Consider a supermarket database

-- 1.  Table 'fruit' has the list of all fruits available in the market(few of them could be out of stock).

-- 2.  Table 'inventory' has the updated list of items in the supermarket.

-- Write a query to find the list of fruits available in the supermarket. (f_name column has the name of the fruits and inv_name has the name of the items in the inventory, you are suppose to output the name of the fruits.)





SELECT f_name 
FROM fruit
INTERSECT
SELECT  inv_name 
FROM inventory;