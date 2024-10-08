-- Write a query to do the following

-- 1.  Output a table with the list of all items in the supermarket.

-- 2.  The table 'Item' has the list of items in the store and the table 'Item_adn' has the list of items in the warehouse





SELECT *
FROM Item
UNION
SELECT *
FROM Item_adn;