--Challenge 3: Retrieve Customer Contact Details
--Some records in the database include missing or unknown values that are returned as NULL. You must
--create some queries that handle these NULL fields appropriately.

--1. Retrieve customer contact names with middle names if known
--You have been asked to write a query that returns a list of customer names. The list must consist of a
--single field in the format <first name> <last name> (for example Keith Harris) if the middle name is
--unknown, or <first name> <middle name> <last name> (for example Jane M. Gates) if a middle name is
--stored in the database.
SELECT FirstName + ISNULL(' ' + MiddleName + ' ',' ') +  LastName AS CustomerName
FROM SalesLT.Customer;

--2. Retrieve primary contact details
--Customers may provide adventure Works with an email address, a phone number, or both. If an email
--address is available, then it should be used as the primary contact method; if not, then the phone
--number should be used. You must write a query that returns a list of customer IDs in one column, and a
--second column named PrimaryContact that contains the email address if known, and otherwise the
--phone number.

--UPDATE SalesLT.Customer
--SET EmailAddress = NULL
--WHERE CustomerID % 7 = 1;

SELECT CustomerID, COALESCE(EmailAddress, Phone) AS PrimaryContact
FROM SalesLT.Customer;

--3. Retrieve shipping status
--You have been asked to create a query that returns a list of sales order IDs and order dates with a
--column named ShippingStatus that contains the text ¡°Shipped¡± for orders with a known ship date, and
--¡°Awaiting Shipment¡± for orders with no ship date.

--UPDATE SalesLT.SalesOrderHeader
--SET ShipDate = NULL
--WHERE SalesOrderID > 71899;

SELECT SalesOrderID, 
	CASE
		WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
		ELSE 'Shipped'
	END AS ShippingStatus
FROM SalesLT.SalesOrderHeader;
