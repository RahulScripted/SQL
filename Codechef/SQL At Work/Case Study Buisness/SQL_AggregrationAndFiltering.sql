-- Write a query to output the following

-- 1.  Order date, Average time required to cook, Average time required to pack, Average delay time- grouped by the order date

-- 2.  Rename the Average time required to cook column as 'Average_cook'

-- 3.  Rename the Average time required to pack column as 'Average_pack'

-- 4.  Rename the Average delay time as 'Average_delay'

-- 5.  Round the average time to 1 digit after the decimal

-- 6.  Remember that we want to see this only for the pizza type 'Cheese Pizza', 'Margherita pizza', 'Farm pizza' or 'Sundried tomatoes pizza'





SELECT order_date, 
ROUND(AVG(cook_time),1) AS Average_cook,
ROUND(AVG(pack_time),1) AS Average_pack,
ROUND(AVG(delay_time),1) AS Average_delay
FROM Orders
WHERE (item = 'Cheese Pizza' OR item = 'Margherita pizza' OR item = 'Farm pizza' OR item = 'Sundried tomatoes pizza')
GROUP BY order_date;