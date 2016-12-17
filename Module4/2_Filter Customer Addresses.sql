--1. Retrieve customers with only a main office address
--Write a query that returns the company name of each company that appears in a table of customers
--with a ¡®Main Office¡¯ address, but not in a table of customers with a ¡®Shipping¡¯ address.
SELECT DISTINCT c.CompanyName
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
WHERE ca.AddressType = 'Main Office'
EXCEPT
SELECT DISTINCT c.CompanyName
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
WHERE ca.AddressType = 'Shipping';

--2. Retrieve only customers with both a main office address and a shipping address
--Write a query that returns the company name of each company that appears in a table of customers
--with a ¡®Main Office¡¯ address, and also in a table of customers with a ¡®Shipping¡¯ address.
SELECT DISTINCT c.CompanyName
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
WHERE ca.AddressType = 'Main Office'
INTERSECT
SELECT DISTINCT c.CompanyName
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
WHERE ca.AddressType = 'Shipping';