-- 	Orders
-- 		Order_id		Customer_id			Order_date			 Total_amount
-- 			1				101				2024-01-10				150.00
-- 			2				102				2024-01-15				250.00
-- 			3				103				2024-01-20				100.00
-- 			4				104				2024-02-01				200.00
-- 			5				101				2024-02-10				300.00

-- Customers
-- 		Customer_id			First_name			Last_name			City
-- 			101				  Alice				 Johnson		  New York
-- 			102				   Bob				  Smith			Los Angeles
-- 			103				  Charlie			  Brown			   Chicago
-- 			104				  Diana				  Wilson	       Houston
-- 			105				   Eve				  Davis			   Phoenix

-- Order_items
-- 		Order_item_id			Order_id			Product_id			Quantity			Price
-- 				1					1					201					1				50.00
-- 				2					1					202					2				50.00
-- 				3					2					203					5				50.00
-- 				4					3					204					2				50.00
-- 				5					4					205					4				50.00
-- 				6					5					202					3			    100.00

-- Products
-- 		Product_id			Product_name			Category			Price
-- 			201				  Widget A				Gadgets				50.00
-- 			202				  Widget B				Gadgets				50.00
-- 			203					Gizmo				 Tools				50.00
-- 			204				    Doodad			   Accessories			50.00
-- 			205				  Thingamajig			 Tools				50.00

-- Questions
-- Q1: List all orders along with the customer names and cities.
-- Q2: Find the total amount spent by each customer.
-- Q3: Identify the products ordered by each customer.
-- Q4: List the names of customers who have placed orders in January 2024.
-- Q5: Get the average order amount for each customer.
-- Q6: Find the total number of products ordered in each order.
-- Q7: List the products that have been ordered more than once.
-- Q8: Identify the customer who has spent the most.
-- Q9: Get the details of orders that include 'Widget A'.
-- Q10: Calculate the total quantity of each product ordered.
-- Q11: List the customers who have placed more than one order.
-- Q12: Find the products that have not been ordered yet.
-- Q13: Identify the orders with a total amount greater than $200.
-- Q14: Get the names and total amounts of orders for each customer, sorted by total amount in descending order.



CREATE DATABASE IF NOT EXISTS July27Problem;
USE July27Problem;

CREATE TABLE Orders(
	Order_id INT PRIMARY KEY,
    Customer_id INT,
    Order_date DATE,
    Total_amount DECIMAL
);

INSERT INTO Orders
(Order_id,Customer_id,Order_date,Total_amount)
VALUES
(1,101,"2024-01-10",150.00),
(2,102,"2024-01-15",250.00),
(3,103,"2024-01-20",100.00),
(4,104,"2024-02-01",200.00),
(5,101,"2024-02-10",300.00);

CREATE TABLE Customers(
	Customer_id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Customers
(Customer_id,First_name,Last_name,City)
VALUES
(101,"Alice","Johnson","New York"),
(102,"Bob","Smith","Los Angeles"),
(103,"Charlie","Brown","Chicago"),
(104,"Diana","Wilson","Houston"),
(105,"Eve","Davis","Phoenix");

CREATE TABLE Order_items(
	Order_item_id INT PRIMARY KEY,
    Order_id INT,
    Product_id INT,
    Quantity INT,
    Price DECIMAL
);

INSERT INTO Order_items
(Order_item_id,Order_id,Product_id,Quantity,Price)
VALUES
(1,1,201,1,50.00),
(2,1,202,2,50.00),
(3,2,203,5,50.00),
(4,3,204,2,50.00),
(5,4,205,4,50.00),
(6,5,202,3,100.00);

CREATE TABLE Products(
	Product_id INT PRIMARY KEY,
    Product_name VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL
);

INSERT INTO Products
(Product_id,Product_name,Category,Price)
VALUES
(201,"Widget A","Gadgets",50.00),
(202,"Widget B","Gadgets",50.00),
(203,"Gizmo","Tools",50.00),
(204,"Doodad","Accessories",50.00),
(205,"Thingamajig","Tools",50.00);


-- Q1: List all orders along with the customer names and cities.
SELECT O.Order_id,C.First_name,C.Last_name,C.City
FROM  Orders O
INNER JOIN Customers C
ON O.Customer_id = C.Customer_id;

-- Q2: Find the total amount spent by each customer.
SELECT C.Customer_id,C.First_name,C.Last_name, SUM(O.Quantity * P.Price) AS Total_Spent
FROM Customers C
INNER JOIN Orders OS 
ON C.Customer_id = OS.Customer_id
INNER JOIN Order_items O 
ON OS.Order_id = O.Order_id
INNER JOIN Products P 
ON O.Product_id = P.Product_id
GROUP BY C.Customer_id, C.First_name, C.Last_name;

-- Q3: Identify the products ordered by each customer.
SELECT C.Customer_id,C.First_name,C.Last_name, P.Product_name
FROM Customers C
INNER JOIN Orders OS 
ON C.Customer_id = OS.Customer_id
INNER JOIN Order_items O 
ON OS.Order_id = O.Order_id
INNER JOIN Products P 
ON O.Product_id = P.Product_id;

-- Q4: List the names of customers who have placed orders in January 2024.
SELECT C.Customer_id,C.First_name,C.Last_name,O.Order_date
FROM Customers C
INNER JOIN Orders O 
ON C.Customer_id = O.Customer_id
WHERE MONTH(O.Order_date) = 1 AND YEAR(O.Order_date) = 2024;

-- Q5: Get the average order amount for each customer.
SELECT C.Customer_id, C.First_name, C.Last_name, AVG(O.Quantity * P.Price) AS Average_Order_Amount
FROM Customers C
INNER JOIN Orders OS ON C.Customer_id = OS.Customer_id
INNER JOIN Order_items O ON OS.Order_id = O.Order_id
INNER JOIN Products P ON O.Product_id = P.Product_id
GROUP BY C.Customer_id, C.First_name, C.Last_name;

-- Q6: Find the total number of products ordered in each order.
SELECT O.Order_id,COUNT(OI.Product_id) AS Total_Products
FROM Orders O
INNER JOIN Order_items OI ON O.Order_id = OI.Order_id
GROUP BY O.Order_id;

-- Q7: List the products that have been ordered more than once.
SELECT O.Order_id,COUNT(OI.Product_id) AS Total_Products
FROM Orders O
INNER JOIN Order_items OI ON O.Order_id = OI.Order_id
GROUP BY O.Order_id
HAVING COUNT(OI.Product_id) > 1;

-- Q8: Identify the customer who has spent the most.
SELECT C.Customer_id,C.First_name,C.Last_name, SUM(O.Quantity * P.Price) AS Total_Spent
FROM Customers C
INNER JOIN Orders OS 
ON C.Customer_id = OS.Customer_id
INNER JOIN Order_items O 
ON OS.Order_id = O.Order_id
INNER JOIN Products P 
ON O.Product_id = P.Product_id
GROUP BY C.Customer_id, C.First_name, C.Last_name
ORDER BY Total_Spent DESC
LIMIT 1;

-- Q9: Get the details of orders that include 'Widget A'.
SELECT O.Order_id,O.Customer_id,O.Order_date,O.Total_amount
FROM Orders O
INNER JOIN Order_items OI ON O.Order_id = OI.Order_id
INNER JOIN Products P ON OI.Product_id = P.Product_id
WHERE P.Product_name = 'Widget A';

-- Q10: Calculate the total quantity of each product ordered.
SELECT P.Product_id,P.Product_name,SUM(OI.Quantity) AS Total_Quantity
FROM Products P
INNER JOIN Order_items OI ON OI.Product_id = P.Product_id
GROUP BY P.Product_id;

-- Q11: List the customers who have placed more than one order.
SELECT C.Customer_id,C.First_name,C.Last_name,COUNT(OS.Customer_id) AS Total_order_placed
FROM Customers C
INNER JOIN Orders OS 
ON C.Customer_id = OS.Customer_id
GROUP BY C.Customer_id
HAVING COUNT(OS.Customer_id) > 1;

-- Q12: Find the products that have not been ordered yet.
SELECT P.Product_id,P.Product_name
FROM Products P
LEFT JOIN Order_items OI ON OI.Product_id = P.Product_id
WHERE OI.Order_id IS NULL;

-- Q13: Identify the orders with a total amount greater than $200.
SELECT O.Order_id,O.Customer_id,O.Total_amount
FROM Orders O
WHERE O.Total_amount > 200;

-- Q14: Get the names and total amounts of orders for each customer, sorted by total amount in descending order.
SELECT C.Customer_id, C.First_name, C.Last_name, SUM(O.Quantity * P.Price) AS total_Amount
FROM Customers C
INNER JOIN Orders OS ON C.Customer_id = OS.Customer_id
INNER JOIN Order_items O ON OS.Order_id = O.Order_id
INNER JOIN Products P ON O.Product_id = P.Product_id
GROUP BY C.Customer_id, C.First_name, C.Last_name
ORDER BY total_Amount DESC;