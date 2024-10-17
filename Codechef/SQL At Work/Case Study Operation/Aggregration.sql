-- Write a query to output the following

-- 1.  Type of pizza, Average time required to cook, Average time required to pack, Average delay time - grouped by the type of pizza

-- 2.  Rename the Average time required to cook column as 'Average_cook'

-- 3.  Rename the Average time required to pack column as 'Average_pack'

-- 4.  Rename the Average delay time as ''Average_delay'

-- 5.  Round the average time to 1 digit after the decimal





SELECT item, 
ROUND(AVG(cook_time),1) AS Average_cook, 
ROUND(AVG(pack_time),1) AS Average_pack,
ROUND(AVG(delay_time),1) AS Average_delay
FROM Orders
GROUP BY item;