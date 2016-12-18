--1. Retrieve total sales by product
--Write a query to retrieve a list of the product names and the total revenue calculated as the sum of the
--LineTotal from the SalesLT.SalesOrderDetail table, with the results sorted in descending order of total
--revenue.
SELECT p.Name, SUM(sod.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail sod
JOIN SalesLT.Product p
ON sod.ProductID = p.ProductID
GROUP BY Name
ORDER BY TotalRevenue DESC;

--2. Filter the product sales list to include only products that cost over $1,000
--Modify the previous query to include sales totals for products that have a list price of more than $1000
SELECT p.Name, SUM(sod.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail sod
JOIN SalesLT.Product p
ON sod.ProductID = p.ProductID
WHERE p.ListPrice > 1000
GROUP BY Name
ORDER BY TotalRevenue DESC;

--3. Filter the product sales groups to include only total sales over $20,000
--Modify the previous query to only include only product groups with a total sales value greater than
--$20,000.
SELECT p.Name, SUM(sod.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail sod
JOIN SalesLT.Product p
ON sod.ProductID = p.ProductID
WHERE p.ListPrice > 1000
GROUP BY Name
HAVING SUM(sod.LineTotal) > 20000
ORDER BY TotalRevenue DESC;


;



SELECT *
FROM SalesLT.SalesOrderDetail;

SELECT *
FROM SalesLT.Product;