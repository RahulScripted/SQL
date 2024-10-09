-- Consider the same supermarket database we used in the previous problem. Write a query to output the name of the fruits (f_name) from the table 'fruit' which are not present in the table inventory. f_name column has the name of the fruits and inv_name has the name of the items in inventory.





SELECT f_name 
FROM fruit
EXCEPT
SELECT inv_name 
FROM inventory;