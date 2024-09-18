-- orders
-- 	Order_id		Customer_id			Order_date			Total_amount
-- 		1				 101			2024-01-15				1500
-- 		2				 102			2024-02-20				 300
-- 		3				 101			2024-03-05				 700
-- 		4				 103			2024-04-10				 450
-- 		5				 104			2024-05-18				1200

-- customers
-- 	Customer_id			First_name			Last_name			 City
-- 		101				   Alice			 Johnson		   New York
-- 		102					Bob				  Smith				Chicago
-- 		103				  Charlie			  Davis			  San Francisco
-- 		104				   Diana			  Wilson			 Miami

-- Questions
-- Q1: List all orders along with the customer names.
-- Q2: Find the total amount spent by each customer.
-- Q3: Identify the orders placed in the month of March 2024.
-- Q4: Get the average order amount.
-- Q5: List the customers who have placed more than one order.
-- Q6: Find the total number of orders for each city.
-- Q7: Identify the customer with the highest total amount spent.
-- Q8: Get the details of the most recent order.
-- Q9: Calculate the total amount spent in each city.
-- Q10: List all customers who have not placed any orders.
-- Q11: List all customers who have placed orders worth more than $1000 in total.
-- Q12: Get the details of orders placed by customers from 'New York'.
-- Q13: Calculate the total number of orders placed in each month. 

CREATE DATABASE IF NOT EXISTS July19Problem;
USE July19Problem;

CREATE TABLE Orders(
	Order_id INT PRIMARY KEY,
    Customer_id INT,
    Order_date DATE,
    Total_amount INT
);

INSERT INTO Orders
(Order_id,Customer_id,Order_date,Total_amount)
VALUES
(1,101,"2024-01-15",1500),
(2,102,"2024-02-20",300),
(3,101,"2024-03-05",700),
(4,103,"2024-04-10",450),
(5,104,"2024-05-18",1200);

CREATE TABLE Customers(
	Customer_id INT PRIMARY KEY,
    First_name VARCHAR(20),
    Last_name VARCHAR(20),
    City VARCHAR(20)
);

INSERT INTO Customers
(Customer_id,First_name,Last_name,City)
VALUES
(101,"Alice","Johnson","New York"),
(102,"Bob","Smith","Chicago"),
(103,"Charlie","Davis","San Francisco"),
(104,"Diana","Wilson","Miami");


-- Q1: List all orders along with the customer names.
SELECT O.Customer_id,C.First_name,C.Last_name
FROM Orders O
JOIN Customers C
ON O.Customer_id = C.Customer_id;

-- Q2: Find the total amount spent by each customer.
SELECT O.Customer_id,C.First_name,C.Last_name,SUM(O.Total_amount) AS TotalSpent
FROM Orders O
JOIN Customers C
ON O.Customer_id = C.Customer_id
GROUP BY O.Customer_id ;

-- Q3: Identify the orders placed in the month of March 2024.
SELECT O.Order_date
FROM Orders O
WHERE  YEAR(O.Order_date) = "2024" AND MONTH(O.Order_date) = "03";

-- Q4: Get the average order amount.
SELECT AVG(O.Total_amount) AS AverageAmount
FROM Orders O;

-- Q5: List the customers who have placed more than one order.
SELECT O.Customer_id,C.First_name,C.Last_name
FROM Orders O
JOIN Customers C
ON O.Customer_id = C.Customer_id
GROUP BY C.Customer_id
HAVING COUNT(O.Order_id) > 1;

-- Q6: Find the total number of orders for each city.
SELECT COUNT(*) AS TotalAmount,C.City
FROM Orders O
JOIN Customers C
ON O.Customer_id = C.Customer_id
GROUP BY C.City;

-- Q7: Identify the customer with the highest total amount spent.
SELECT O.Customer_id,C.First_name,C.Last_name,SUM(O.Total_amount) AS TotalSpent
FROM Orders O
JOIN Customers C
ON O.Customer_id = C.Customer_id
GROUP BY C.Customer_id
ORDER BY TotalSpent DESC
LIMIT 1;

-- Q8: Get the details of the most recent order.
SELECT O.Customer_id,C.First_name,C.Last_name
FROM Orders O
JOIN Customers C
ON O.Customer_id = C.Customer_id
ORDER BY O.Order_date DESC
LIMIT 1;

-- Q10: List all customers who have not placed any orders.
SELECT O.Customer_id,C.First_name,C.Last_name
FROM Orders O
LEFT JOIN Customers C
ON O.Customer_id = C.Customer_id
WHERE O.Customer_id IS NULL;

-- Q11: List all customers who have placed orders worth more than $1000 in total.
SELECT O.Customer_id,C.First_name,C.Last_name,SUM(O.Total_amount) AS TotalSpent
FROM Orders O
JOIN Customers C
ON O.Customer_id = C.Customer_id
GROUP BY O.Customer_id 
HAVING TotalSpent > 1000;

-- Q12: Get the details of orders placed by customers from 'New York'.
SELECT *
FROM Orders O
JOIN Customers C
ON O.Customer_id = C.Customer_id
WHERE C.City = "New York";


-- Q13: Calculate the total number of orders placed in each month. 
SELECT MONTH(O.Order_date) AS OrderMonth,COUNT(*) AS TotalOrders
FROM Orders O
GROUP BY MONTH(O.Order_date)
ORDER BY OrderMonth;