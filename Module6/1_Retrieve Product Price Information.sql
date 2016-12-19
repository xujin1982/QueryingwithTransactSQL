--1. Retrieve products whose list price is higher than the average unit price
--Retrieve the product ID, name, and list price for each product where the list price is higher than the
--average unit price for all products that have been sold.
SELECT ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE ListPrice >
	(SELECT AVG(UnitPrice)
	FROM SalesLT.SalesOrderDetail)
ORDER BY ProductID;

--2. Retrieve Products with a list price of $100 or more that have been sold for less than
--$100
--Retrieve the product ID, name, and list price for each product where the list price is $100 or more, and
--the product has been sold for less than $100.
SELECT ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE ProductID IN
	(SELECT ProductID FROM SalesLT.SalesOrderDetail
	WHERE UnitPrice < 100.00)
AND ListPrice >= 100.00
ORDER BY ProductID;

--3. Retrieve the cost, list price, and average selling price for each product
--Retrieve the product ID, name, cost, and list price for each product along with the average unit price for
--which that product has been sold.
SELECT ProductID, Name, StandardCost, ListPrice, 
	(SELECT AVG(UnitPrice)
	FROM SalesLT.SalesOrderDetail AS sod
	WHERE p.ProductID = sod.ProductID) AS AvgSellingPrice
FROM SalesLT.Product AS p
ORDER BY p.ProductID;


--4. Retrieve products that have an average selling price that is lower than the cost
--Filter your previous query to include only products where the cost price is higher than the average
--selling price.
SELECT p.ProductID, p.Name, p.StandardCost AS COST, p.ListPrice, 
	(SELECT AVG(UnitPrice)
	FROM SalesLT.SalesOrderDetail AS sod
	WHERE p.ProductID = sod.ProductID) AS AvgSellPrice
FROM SalesLT.Product AS p
WHERE p.StandardCost >
	(SELECT AVG(UnitPrice)
	FROM SalesLT.SalesOrderDetail AS sod
	WHERE p.ProductID = sod.ProductID)
ORDER BY P.ProductID;