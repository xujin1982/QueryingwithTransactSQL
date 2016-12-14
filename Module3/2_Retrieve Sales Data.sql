--1. Retrieve a list of all customers and their orders
--The sales manager wants a list of all customer companies and their contacts (first name and last name),
--showing the sales order ID and total due for each order they have placed. Customers who have not
--placed any orders should be included at the bottom of the list with NULL values for the order ID and
--total due.
SELECT DISTINCT c.CompanyName, c.FirstName + ' ' + c.LastName AS ContactName, s.SalesOrderID AS SalesOrderID, s.TotalDue AS TotalDue
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.SalesOrderHeader AS s
ON c.CustomerID = s.CustomerID
ORDER BY SalesOrderID DESC;

--2. Retrieve a list of customers with no address
--A sales employee has noticed that Adventure Works does not have address information for all
--customers. You must write a query that returns a list of customer IDs, company names, contact names
--(first name and last name), and phone numbers for customers with no address stored in the database.
SELECT DISTINCT c.CustomerID AS CustomerID, c.CompanyName AS CompanyName, c.FirstName + ' ' + c.LastName AS ContactName,
	c.Phone AS PhoneNumber
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
WHERE ca.AddressID IS NULL;


--3. Retrieve a list of customers and products without orders
--Some customers have never placed orders, and some products have never been ordered. Create a query
--that returns a column of customer IDs for customers who have never placed an order, and a column of
--product IDs for products that have never been ordered. Each row with a customer ID should have a
--NULL product ID (because the customer has never ordered a product) and each row with a product ID
--should have a NULL customer ID (because the product has never been ordered by a customer).
SELECT c.CustomerID AS CustomerID, p.ProductID AS ProductID
FROM SalesLT.Customer AS c
FULL JOIN SalesLT.SalesOrderHeader AS soh
ON c.CustomerID = soh.CustomerID
FULL JOIN SalesLT.SalesOrderDetail AS sod
ON soh.SalesOrderID = sod.SalesOrderID
FULL JOIN SalesLT.Product AS p
ON p.ProductID = sod.ProductID
WHERE soh.SalesOrderID IS NULL
ORDER BY ProductID, CustomerID;