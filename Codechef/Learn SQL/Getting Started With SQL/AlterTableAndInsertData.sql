-- Write a query which does the following

-- Take the table from the previous problem and add an additional column 'email' to the table 'customer'. Consider the table 'customer' to be empty and insert the below data

-- Output all the entires in the table.

-- Id	    Name	    Age	    address	      email

-- 1	John Smith	     25	    Main St	    john@ex.com

-- 2	Sarah Johnson	 30	    Broadway	sarah@ex.com





ALTER TABLE customer
ADD COLUMN email TEXT;
INSERT INTO customer(Id,Name,Age,Address,email)
VALUES (1, 'John Smith', 25,  'Main St','john@ex.com'),
       (2, 'Sarah Johnson', 30,'Broadway','sarah@ex.com');

select  * from customer;