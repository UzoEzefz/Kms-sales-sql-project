-- 1. Create and use database
CREATE DATABASE IF NOT EXISTS kms;
USE kms;

-- 2. Create table for orders
CREATE TABLE IF NOT EXISTS orders (
  OrderID INT,
  OrderDate DATE,
  CustomerName VARCHAR(100),
  Segment VARCHAR(50),
  ProductCategory VARCHAR(50),
  ProductSubCategory VARCHAR(100),
  Sales DECIMAL(10,2),
  Quantity INT,
  Discount DECIMAL(5,2),
  Profit DECIMAL(10,2),
  ShippingCost DECIMAL(10,2),
  ShippingMethod VARCHAR(50),
  Region VARCHAR(50),
  State VARCHAR(50),
  OrderPriority VARCHAR(50),
  Returned VARCHAR(10)
);



-- -------- CASE SCENARIO I --------

-- 1. Product category with the highest sales
SELECT ProductCategory, SUM(Sales) AS TotalSales
FROM orders
GROUP BY ProductCategory
ORDER BY TotalSales DESC
LIMIT 1;

-- 2. Top 3 regions by sales
SELECT Region, SUM(Sales) AS TotalSales
FROM orders
GROUP BY Region
ORDER BY TotalSales DESC
LIMIT 3;

-- Bottom 3 regions by sales
SELECT Region, SUM(Sales) AS TotalSales
FROM orders
GROUP BY Region
ORDER BY TotalSales ASC
LIMIT 3;

-- 3. Total sales of appliances in Ontario
SELECT SUM(Sales) AS ApplianceSales
FROM orders
WHERE ProductCategory = 'Appliances' AND State = 'Ontario';

-- 4. Bottom 10 customers by sales
SELECT CustomerName, SUM(Sales) AS TotalSales
FROM orders
GROUP BY CustomerName
ORDER BY TotalSales ASC
LIMIT 10;

-- 5. Shipping method with the highest total shipping cost
SELECT ShippingMethod, SUM(ShippingCost) AS TotalShippingCost
FROM orders
GROUP BY ShippingMethod
ORDER BY TotalShippingCost DESC
LIMIT 1;

-- -------- CASE SCENARIO II --------

-- 6. Top 5 most valuable customers by total sales
SELECT CustomerName, SUM(Sales) AS TotalSales
FROM orders
GROUP BY CustomerName
ORDER BY TotalSales DESC
LIMIT 5;

-- 6b. Products purchased by top customer (edit name as needed)
-- SELECT ProductSubCategory, SUM(Sales) AS TotalSales
-- FROM orders
-- WHERE CustomerName = 'TopCustomerName'
-- GROUP BY ProductSubCategory
-- ORDER BY TotalSales DESC;

-- 7. Small business customer with highest total sales
SELECT CustomerName, SUM(Sales) AS TotalSales
FROM orders
WHERE Segment = 'Small Business'
GROUP BY CustomerName
ORDER BY TotalSales DESC
LIMIT 1;

-- 8. Corporate customer with most orders placed
SELECT CustomerName, COUNT(OrderID) AS OrderCount
FROM orders
WHERE Segment = 'Corporate'
GROUP BY CustomerName
ORDER BY OrderCount DESC
LIMIT 1;

-- 9. Consumer customer with highest total profit
SELECT CustomerName, SUM(Profit) AS TotalProfit
FROM orders
WHERE Segment = 'Consumer'
GROUP BY CustomerName
ORDER BY TotalProfit DESC
LIMIT 1;

-- 10. Customers who returned items and their segment
SELECT DISTINCT CustomerName, Segment
FROM orders
WHERE Returned = 'Yes';

-- 11. Shipping method vs. order priority analysis
SELECT ShippingMethod, OrderPriority, COUNT(*) AS TotalOrders, SUM(ShippingCost) AS TotalShippingCost
FROM orders
GROUP BY ShippingMethod, OrderPriority
ORDER BY OrderPriority, ShippingMethod;
SELECT * FROM kms_project.`kms sql uzo project`;