-- Create a table 'customer'. Add the below mentioned data to the table 'customer'. Output the entire table.


-- Id	       Name	           Age	           address
-- 1	    John Smith          25	         123 Main St
-- 2	    Sarah Johnson       30	         456 Broadway
-- 3	    Michael Brown       45	         789 5th Ave
-- 4	    Jessica Davis	    28	         321 Elm St
-- 5	      David Lee	        35	         555 Park Ave





CREATE TABLE customer(
    Id INT PRIMARY KEY,
    Name TEXT,
    Age INT,
    address TEXT
);

INSERT INTO customer(Id,Name,Age,address)
VALUES (1, "John Smith", 25, "123 Main St"),
       (2, "Sarah Johnson", 30, "456 Broadway"),
       (3, "Michael Brown", 45, "789 5th Ave"),
       (4, "Jessica Davis", 28, "321 Elm St"),
       (5, "David Lee", 35, "555 Park Ave");
       
SELECT * FROM customer;