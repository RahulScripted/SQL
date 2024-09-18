-- Customers
-- 	Customer_id		First_name		Last_name			Email				Phone			  City			Join_date
-- 		1			  Alice			 Johnson	 alice.j@example.com	1234567890			New York		2022-01-15
-- 		2			   Bob			  Smith		  bob.s@example.com		2345678901		   Los Angeles		2021-07-22
-- 		3			 Charlie		  Brown		charlie.b@example.com	3456789012			 Chicago		2020-11-30
-- 		4			  Diana			  Wilson	 diana.w@example.com	4567890123			 Houston		2019-03-18
-- 		5			   Eve			  Davis		  eve.d@example.com		5678901234			 Phoenix		2021-05-05

-- Products
-- 	Product_id		 Product_name		  Category		Price		Stock_quantity
-- 		1			  Smartphone		Electronics		 699			  50
-- 		2				Laptop			Electronics		 999			  30
-- 		3			 Office Chair		 Furniture		 199			 100
-- 		4			 Water Bottle		  Kitchen		 29				 200
-- 		5			   Notebook			Stationery		  5				 500

-- Orders
-- 	order_id		customer_id			order_date		total_amount
-- 		1				1				2023-01-15			 729
-- 		2				2				2023-02-20			1024
-- 		3				3				2023-03-05			 204
-- 		4				4				2023-04-10			  58
-- 		5				5				2023-05-25			 104

-- OrderItems
-- 		Order_item_id			Order_id		Product_id			Quantity		Price
-- 				1					1				1					1			 699
-- 				2					1				4					1			  29
-- 				3					2				2					1			 999
-- 				4					2				5					5			  25
-- 				5					3				3					1			 199
-- 				6					3				4					1			   5
-- 				7					4				4					2			  29
-- 				8					5				5					2			   5
-- 				9					5				1					1			  99

-- Questions
-- Q1: List all customers along with their city and join date.
-- Q2: Find the total number of orders placed by each customer.
-- Q3: Identify the products ordered by each customer along with the quantity.
-- Q4: List the names of customers who placed orders in 2023.
-- Q5: Get the total amount spent by each customer.
-- Q6: Find the average price of products in each category.
-- Q7: List the products that are out of stock (stock quantity is zero).
-- Q8: Identify the customer who placed the order with the highest total amount.
-- Q9: Get the details of orders that include more than 3 items.
-- Q10: Calculate the total revenue generated from each product.
-- Q11: List the customers who have not placed any orders.
-- Q12: Find the products that have never been ordered.
-- Q13: Identify the orders where the total amount is greater than $500.
-- Q14: Get the names and total number of orders for each customer, sorted by total number of orders in descending order.
-- Q15: List the products ordered in the month of January 2023.



CREATE DATABASE IF NOT EXISTS August02Problem;
USE August02Problem;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(100),
    join_date DATE
);

INSERT INTO Customers (customer_id, first_name, last_name, email, phone, city, join_date)
VALUES
(1, 'Alice', 'Johnson', 'alice.j@example.com', '1234567890', 'New York', '2022-01-15'),
(2, 'Bob', 'Smith', 'bob.s@example.com', '2345678901', 'Los Angeles', '2021-07-22'),
(3, 'Charlie', 'Brown', 'charlie.b@example.com', '3456789012', 'Chicago', '2020-11-30'),
(4, 'Diana', 'Wilson', 'diana.w@example.com', '4567890123', 'Houston', '2019-03-18'),
(5, 'Eve', 'Davis', 'eve.d@example.com', '5678901234', 'Phoenix', '2021-05-05');

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

INSERT INTO Products (product_id, product_name, category, price, stock_quantity)
VALUES
(1, 'Smartphone', 'Electronics', 699, 50),
(2, 'Laptop', 'Electronics', 999, 30),
(3, 'Office Chair', 'Furniture', 199, 100),
(4, 'Water Bottle', 'Kitchen', 29, 200),
(5, 'Notebook', 'Stationery', 5, 500);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
(1, 1, '2023-01-15', 729),
(2, 2, '2023-02-20', 1024),
(3, 3, '2023-03-05', 204),
(4, 4, '2023-04-10', 58),
(5, 5, '2023-05-25', 104);

CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO OrderItems (order_item_id, order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 1, 699),
(2, 1, 4, 1, 29),
(3, 2, 2, 1, 999),
(4, 2, 5, 5, 25),
(5, 3, 3, 1, 199),
(6, 3, 4, 1, 5),
(7, 4, 4, 2, 29),
(8, 5, 5, 2, 5),
(9, 5, 1, 1, 99);



-- Answers

-- Q1: List all customers along with their city and join date.
SELECT customer_id, first_name, last_name, city, join_date
FROM Customers;

-- Q2: Find the total number of orders placed by each customer.
SELECT C.customer_id,C.first_name,C.last_name,COUNT(O.order_id) AS total_number
FROM Customers C
JOIN Orders O
ON C.customer_id = O.customer_id
GROUP BY C.customer_id;

-- Q3: Identify the products ordered by each customer along with the quantity.
SELECT C.customer_id,C.first_name,C.last_name,P.Product_name,OI.quantity
FROM Customers C
JOIN Orders O ON C.customer_id = O.customer_id
JOIN OrderItems OI ON O.order_id = OI.order_id
JOIN Products P ON P.product_id = OI.product_id;

-- Q4: List the names of customers who placed orders in 2023.
SELECT C.customer_id,C.first_name,C.last_name
FROM Customers C
JOIN Orders O
ON C.customer_id = O.customer_id
WHERE YEAR(O.order_date) = '2023';

-- Q5: Get the total amount spent by each customer.
SELECT C.customer_id,C.first_name,C.last_name,SUM(OI.quantity * OI.price) AS total_amount
FROM Customers C
JOIN Orders O ON C.customer_id = O.customer_id
JOIN OrderItems OI ON O.order_id = OI.order_id
GROUP BY C.customer_id;

-- Q6: Find the average price of products in each category.
SELECT P.Category,ROUND(AVG(OI.price),2) AS average_price
FROM Products P
JOIN OrderItems OI ON P.product_id = OI.product_id
GROUP BY P.Category;

-- Q7: List the products that are out of stock (stock quantity is zero).
SELECT P.product_id, P.product_name, P.category
FROM Products P
WHERE P.stock_quantity = 0;

-- Q8: Identify the customer who placed the order with the highest total amount.
SELECT C.customer_id,C.first_name,C.last_name,SUM(OI.quantity * OI.price) AS total_amount
FROM Customers C
JOIN Orders O ON C.customer_id = O.customer_id
JOIN OrderItems OI ON O.order_id = OI.order_id
GROUP BY C.customer_id
ORDER BY total_amount
LIMIT 1;

-- Q9: Get the details of orders that include more than 3 items.
SELECT O.order_id,C.customer_id,C.first_name,C.last_name,COUNT(OI.product_id) AS total_items
FROM Orders O
JOIN Customers C ON C.customer_id = O.customer_id
JOIN OrderItems OI ON O.order_id = OI.order_id
GROUP BY O.order_id,C.customer_id,C.first_name,C.last_name
HAVING COUNT(OI.product_id) > 3;

-- Q10: Calculate the total revenue generated from each product.
SELECT P.product_id, P.product_name, P.category,SUM(OI.quantity * OI.price) AS total_revenue
FROM Products P
JOIN OrderItems OI ON P.product_id = OI.product_id
GROUP BY P.product_id, P.product_name;

-- Q11: List the customers who have not placed any orders.
SELECT C.customer_id,C.first_name,C.last_name
FROM Customers C
LEFT JOIN Orders O ON C.customer_id = O.customer_id
WHERE O.order_id IS NULL;

-- Q12: Find the products that have never been ordered.
SELECT P.product_id, P.product_name, P.category
FROM Products P
LEFT JOIN OrderItems OI ON P.product_id = OI.product_id
WHERE order_id IS NULL;

-- Q13: Identify the orders where the total amount is greater than $500.
SELECT O.order_id,SUM(OI.quantity * OI.price) AS total_amount
FROM Orders O
LEFT JOIN OrderItems OI ON O.order_id = OI.order_id
GROUP BY O.order_id
HAVING SUM(OI.quantity * OI.price) >= 500;

-- Q14: Get the names and total number of orders for each customer, sorted by total number of orders in descending order.
SELECT C.customer_id,C.first_name,C.last_name,COUNT(O.order_id) AS total_number_orders
FROM Customers C
JOIN Orders O ON C.customer_id = O.customer_id
GROUP BY C.customer_id
ORDER BY COUNT(O.order_id) DESC;

-- Q15: List the products ordered in the month of January 2023.
SELECT P.product_id, P.product_name, P.category
FROM Products P
INNER JOIN OrderItems OI ON P.product_id = OI.product_id
INNER JOIN  Orders O ON O.order_id = OI.order_id
WHERE MONTH(O.order_date) = 1 AND YEAR(O.order_date) = 2023;