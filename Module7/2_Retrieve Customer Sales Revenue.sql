--1. Retrieve sales revenue by customer and contact
--Retrieve a list of customers in the format Company (Contact Name) together with the total revenue for
--that customer. Use a derived table or a common table expression to retrieve the details for each sales
--order, and then query the derived table or CTE to aggregate and group the data.

-- Derived Table
SELECT CompanyContact, SUM(TotalDue) AS TotalRevenue
FROM
	(SELECT CONCAT(c.CompanyName, CONCAT(' (' + c.FirstName + ' ', c.LastName + ')')), soh.TotalDue
	FROM SalesLT.Customer AS c
	JOIN SalesLT.SalesOrderHeader AS soh
	ON c.CustomerID = soh.CustomerID) AS Temp(CompanyContact, TotalDue)
GROUP BY CompanyContact
ORDER BY CompanyContact;

-- CTE
WITH Temp(CompanyContact, TotalDue)
AS
(
	SELECT CONCAT(c.CompanyName, CONCAT(' (' + c.FirstName + ' ', c.LastName + ')')), soh.TotalDue
	FROM SalesLT.Customer AS c
	JOIN SalesLT.SalesOrderHeader AS soh
	ON c.CustomerID = soh.CustomerID
)
SELECT CompanyContact, SUM(TotalDue) AS TotalRevenue
FROM Temp
GROUP BY CompanyContact
ORDER BY CompanyContact;