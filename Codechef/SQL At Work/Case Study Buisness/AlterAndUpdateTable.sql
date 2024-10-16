-- Write a query which does the following

-- 1.   Add a column - 'Remarks' - at the end of the table
-- 2.   Add the following remark to all entries
-- 3.   For the month 'Mar', 'Apr', 'May' - the remark should be 'Loss due to Covid'
-- 4.   For all other months - the remark should be 'This is fine'





ALTER TABLE Financials
ADD Remarks TEXT DEFAULT 'This is fine';

UPDATE Financials
SET Remarks = 'Loss due to Covid'
WHERE profit_loss <= 0;

SELECT * FROM Financials
LIMIT 10;
