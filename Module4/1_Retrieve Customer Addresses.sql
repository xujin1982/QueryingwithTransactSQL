--1. Retrieve billing addresses
--Write a query that retrieves the company name, first line of the street address, city, and a column
--named AddressType with the value ¡®Billing¡¯ for customers where the address type in the
--SalesLT.CustomerAddress table is ¡®Main Office¡¯.
SELECT DISTINCT c.CompanyName, a.AddressLine1, a.City, 'Billing' AS AddressType
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
LEFT JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Main Office';


--2. Retrieve shipping addresses
--Write a similar query that retrieves the company name, first line of the street address, city, and a
--column named AddressType with the value ¡®Shipping¡¯ for customers where the address type in the
--SalesLT.CustomerAddress table is ¡®Shipping¡¯.
SELECT DISTINCT c.CompanyName, a.AddressLine1, a.City, 'Shipping' AS AddressType
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
LEFT JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Shipping';

--3. Combine billing and shipping addresses
--Combine the results returned by the two queries to create a list of all customer addresses that is sorted
--by company name and then address type.
SELECT DISTINCT c.CompanyName, a.AddressLine1, a.City, 'Billing' AS AddressType
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
LEFT JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Main Office'
UNION ALL
SELECT DISTINCT c.CompanyName, a.AddressLine1, a.City, 'Shipping' AS AddressType
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
LEFT JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Shipping'
ORDER BY CompanyName, AddressType;
