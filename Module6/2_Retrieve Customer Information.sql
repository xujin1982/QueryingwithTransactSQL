--1. Retrieve customer information for all sales orders
--Retrieve the sales order ID, customer ID, first name, last name, and total due for all sales orders from
--the SalesLT.SalesOrderHeader table and the dbo.ufnGetCustomerInformation function.
SELECT sod.SalesOrderID, sod.CustomerID, 
	c.FirstName, c.LastName,
	sod.TotalDue
FROM SalesLT.SalesOrderHeader AS sod
	CROSS APPLY dbo.ufnGetCustomerInformation(sod.CustomerID) AS c

--2. Retrieve customer address information
--Retrieve the customer ID, first name, last name, address line 1 and city for all customers from the
--SalesLT.Address and SalesLT.CustomerAddress tables, and the dbo.ufnGetCustomerInformation
--function.
SELECT ca.CustomerID,
	c.FirstName, c.LastName,
	a.AddressLine1, a.City
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca
ON a.AddressID = ca.AddressID
	CROSS APPLY dbo.ufnGetCustomerInformation(ca.CustomerID) AS c