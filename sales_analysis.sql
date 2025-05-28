CREATE DATABASE COMPANY;
USE COMPANY;
SELECT * FROM sales;

--  Q1. find all orders shipped via 'Economy' mode with a total amount greater than $25,000

SELECT 
* FROM sales
WHERE
Ship_Mode = 'Economy' 
AND
Total_Amount > 25000 ;


-- Q2. retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01

SELECT
* FROM sales
WHERE
Category = 'Technology' 
AND
Country = 'Ireland'
AND 
Order_Date > '2020-01-01';

-- Q3.  list the top 10 most profitable sales transactions in descending order

SELECT 
* FROM sales
ORDER BY Unit_Profit DESC
LIMIT 10; -- shows top 10 transactions

-- or

SELECT
* FROM sales
ORDER BY Unit_Profit DESC
LIMIT 10, 20;  -- skips the first 10 records then shows top 20 records


-- Q4. find all customers whose name  starts with 'J' and ends with 'n'

SELECT 
Order_ID, Customer_Name
FROM sales
WHERE 
Customer_Name LIKE'J%n';

-- Q5. retrieve all product names that contain 'ACCO' anywhere in the name

SELECT 
*
FROM sales
WHERE 
Product_Name LIKE'%ACCO%';

-- Q6. Get the top 5 cities with the highest total sales

SELECT
City,SUM(Total_Amount) AS Total_Sales 
FROM sales
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;

-- Q7. Display the second set of 10 records for Custome_Name and Total_Amount in decreasing order.
SELECT 
Customer_Name , Total_Amount 
FROM sales
ORDER BY Total_Amount DESC
LIMIT 10, 10;

-- Q8. Find the total revenue, average unit cost, and total number of orders.

SELECT 
SUM(Total_Amount) AS `Total_Revenue`,
AVG(Unit_Cost) AS `Average_Unit_Cost`,
COUNT(Order_ID) AS `Number_of_orders`
FROM sales;


-- Q9. Count unique number of regions 

SELECT 
COUNT( DISTINCT Region) AS `Unique_Number_Of_Regions`
FROM sales;

-- Q10. Find the number of orders placed by each customer

SELECT
Customer_Name,COUNT(Order_ID) AS `Order_Count`
FROM sales
GROUP BY Customer_Name
ORDER BY Order_Count DESC ;

-- Q12. Rak 5 products based on total sales using RANK() 
-- IMPORTANT : 4 types of rak functions, row_number(),rank(),dense_rank(),ntile()

SELECT 
Product_Name, SUM(Total_Amount) AS Total_Sales,
RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS Sales_Rank
FROM sales
GROUP BY Product_Name
LIMIT 5;







