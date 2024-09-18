-- For the given table find the total payment according to each payment method


CREATE DATABASE IF NOT EXISTS Payment_calc; 
USE Payment_calc;

CREATE TABLE Customer(
	Customer_id INT PRIMARY KEY,
    Customer_Name VARCHAR(40),
    Payment_Mode VARCHAR(15),
    Customer_City VARCHAR(15)
);

INSERT INTO Customer
(Customer_id,Customer_Name,Payment_Mode,Customer_City)
VALUES
(101,"Olivia Barrett","Net Banking","Portland"),
(102,"Ethan Sinclair","Credit Card","Miami"),
(103,"Maya Harnandez","Credit Card","Seattle"),
(104,"Liam Donovan","Net Banking","Denver"),
(105,"Sophia Nguyen","Credit Card","New Orleans"),
(106,"Caleb Foster","Debit Card","Minneapolis"),
(107,"Ava Patel","Debit Card","Phoenix"),
(108,"Lucas Carter","Net Banking","Boston"),
(109,"Isabella Martinez","Net Banking","Nashville"),
(110,"Jackson Brooks","Credit Card","Boston");

-- Answer
SELECT Payment_Mode,COUNT(Customer_id)
From Customer
GROUP BY Payment_Mode;