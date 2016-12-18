--1. Retrieve companies ranked by sales totals
--Write a query that returns a list of company names with a ranking of their place in a list of highest
--TotalDue values from the SalesOrderHeader table.
SELECT c.CompanyName,
	RANK() OVER (ORDER BY soh.TotalDue DESC) AS RankByRevenue
FROM SalesLT.SalesOrderHeader soh
JOIN SalesLT.Customer c
ON soh.CustomerID = c.CustomerID;