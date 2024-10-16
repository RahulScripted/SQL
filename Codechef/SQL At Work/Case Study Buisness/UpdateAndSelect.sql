-- Write a query which does the following

-- 1.  Update the table to reflect these entries

-- 2.  Revenue in 'Jul' for 'Low_Margin' 'Menswear' needs to be updated to 25000

-- 3.  Revenue in 'Aug' for 'New_Products' 'Womenswear' needs to be updated to 10000

-- 4.  Output all entries of these 2 rows to validate that the updates have been completed





UPDATE Financials 
SET revenue = 25000
WHERE month = 'Jul' and (division = 'Menswear' and product_type = 'Low_Margin');

UPDATE Financials 
SET revenue = 10000
WHERE month = 'Aug' and (division = 'Womenswear' and product_type = 'New_Products');


SELECT * FROM Financials
WHERE (month = 'Jul' and division = 'Menswear' and product_type = 'Low_Margin')
OR (month = 'Aug' and division = 'Womenswear' and product_type = 'New_Products');