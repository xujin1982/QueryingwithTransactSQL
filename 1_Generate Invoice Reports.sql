--1. Retrieve customer orders
--As an initial step towards generating the invoice report, write a query that returns the company name
--from the SalesLT.Customer table, and the sales order ID and total due from the
--SalesLT.SalesOrderHeader table.
SELECT c.CompanyName AS CompanyName, s.SalesOrderID AS SalesOrderID, s.TotalDue AS TotalDue
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS s
ON c.CustomerID = s.CustomerID;

--2. Retrieve customer orders with addresses
--Extend your customer orders query to include the Main Office address for each customer, including the
--full street address, city, state or province, postal code, and country or region.
SELECT c.CompanyName AS CompanyName, s.SalesOrderID AS SalesOrderID, s.TotalDue AS TotalDue, 
	a.AddressLine1 + ISNULL(', ' + a.AddressLine2, '') AS StreetAddress, 
	a.City AS City, a.StateProvince AS StateProvince, a.PostalCode AS PostalCode, a.CountryRegion AS CountryRegion
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS s
ON c.CustomerID = s.CustomerID
JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID AND AddressType = 'Main Office'
JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID;