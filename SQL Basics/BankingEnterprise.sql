-- Consider the banking enterprise with the following relation schemas:
-- Branch-schema = (branch-name, branch-city, assets)
-- Customer-schema = (customer-name, customer-street, customer-city)
-- Loan-schema = (loan-number, branch-name, amount)
-- Borrower-schema = (customer-name, loan-number)
-- Account-schema = (account-number, branch-name, balance)
-- Depositor-schema = (customer-name, account-number)


-- Create the tables with the appropriate integrity constraints and Insert around 5 records in each of the tables. Write down the SQL of following problem set and corresponding result (any 10). 10+(10X3)

-- a) find the loan number of those loans with loan amounts between $90,000 and $100,000
-- b) For all customers who have a loan from the bank, find their names, loan numbers and loan amount.
-- c) Find the customer names, loan numbers, and loan amounts for all loans at the Perryridge branch.
-- d) Find the names of all customers whose street address includes the substring ‘Main’.
-- e) List in alphabetic order all customers who have a loan at the Perryridge branch.
-- f) List the entire loan relation in descending order of amount.
-- g) Find the average account balance at the Perryridge branch.
-- h) Find the average account balance at each branch.
-- i) Find the number of depositors for each branch.
-- j) List those branches where the average account balance is more than $1200.
-- k) Delete all account tuples at every branch located in Needham.
-- l) Delete the records of all accounts with balances below the average at the bank.
-- m) For annual interest payments are being made, set all balances are to be increased by 5 percent.
-- n) Interest (1%) is to be paid only to accounts with a balance of $1000 or more.

CREATE DATABASE Banking_Enterprise;
USE Banking_Enterprise;

CREATE TABLE Branch_Schema(
	Branch_Name VARCHAR(50),
    Branch_City VARCHAR(50),
    Assets INT
);

CREATE TABLE Customer_Schema(
	Customer_Name VARCHAR(50),
    Customer_Street VARCHAR(50),
    Customer_City VARCHAR(50)
);

CREATE TABLE Loan_Schema(
	Loan_Number VARCHAR(10) PRIMARY KEY,
    Branch_Name VARCHAR(50),
    Amount INT
);

CREATE TABLE Borrower_Schema(
	Customer_Name VARCHAR(50),
    Account_Number VARCHAR(10)
);

CREATE TABLE Account_Schema(
    Account_Number VARCHAR(10) PRIMARY KEY,
    Branch_Name VARCHAR(50),
    Balance INT
);

CREATE TABLE Depositor_Schema(
    Customer_Name VARCHAR(50),
    Account_Number VARCHAR(10) PRIMARY KEY
);

INSERT INTO Branch_Schema
(Branch_Name,Branch_City,Assets)
VALUES
("Brighton","Brooklyn",7100000),
("Downtown","Brooklyn",9000000),
("Mianus","Horseneck",400000),
("North Town","Rye",3700000),
("Perryridge","Horseneck",1700000),
("Pownal","Bennington",300000),
("Redwood","Pao Alto",2100000),
("Round Hill","Horseneck",8000000);

INSERT INTO Customer_Schema
(Customer_Name,Customer_Street,Customer_City)
VALUES
("Adams","Spring","Pittsfield"),
("Brroks","Senator","Brooklyn"),
("Curry","North","Rye"),
("Glenn","Sand Hill","Woodside"),
("Green","Walnut","Stamford"),
("Hayes","Main","Harrison"),
("Jones","Main","Harrison"),
("Lindsay","Park","Pittsfield"),
("Smith","North","Rye"),
("Turner","Putnam","Stamford"),
("Williams","Nassay","Princeton");

INSERT INTO Loan_Schema
(Loan_Number,Branch_Name,Amount)
VALUES
("L-11","Round Hill",900),
("L-14","Downtown",1500),
("L-15","Perryridge",1500),
("L-16","Perryridge",1300),
("L-17","Downtown",1000),
("L-23","Redwood",2000),
("L-93","Mianus",500);

INSERT INTO Borrower_Schema
(Customer_Name,Account_Number)
VALUES
("Adams","L-16"),
("Curry","L-93"),
("Hayes","L-15"),
("Jackson","L-14"),
("Jones","L-17"),
("Smith","L-11"),
("Smith","L-23"),
("Williams","L-17");

INSERT INTO Account_Schema
(Account_Number,Branch_Name,Balance)
VALUES
("A-101","Downtown",500),
("A-102","Perryridge",400),
("A-201","Brighton",900),
("A-215","Mianus",700),
("A-217","Brighton",750),
("A-222","Redwood",700),
("A-305","Round Hill",350);

INSERT INTO Depositor_Schema
(Customer_Name,Account_Number)
VALUES
("Hayes","A-102"),
("Johnson","A-101"),
("Johnson","A-201"),
("Jones","A-217"),
("Lindsay","A-222"),
("Smith","A-215"),
("Turner","A-305");

-- a) find the loan number of those loans with loan amounts between $90,000 and $100,000
SELECT COUNT(Loan_Number) FROM Loan_Schema WHERE Amount BETWEEN 90000 AND 100000;

-- f) List the entire loan relation in descending order of amount.
SELECT * FROM Loan_Schema ORDER BY Amount DESC;