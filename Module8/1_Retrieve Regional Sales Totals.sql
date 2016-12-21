--1. Retrieve totals for country/region and state/province
--Tip: Review the documentation for GROUP BY in the Transact-SQL Language Reference.
--An existing report uses the following query to return total sales revenue grouped by country/region and
--state/province.
--SELECT a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue
--FROM SalesLT.Address AS a
--JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
--JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
--JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
--GROUP BY a.CountryRegion, a.StateProvince
--ORDER BY a.CountryRegion, a.StateProvince;
--You have been asked to modify this query so that the results include a grand total for all sales revenue
--and a subtotal for each country/region in addition to the state/province subtotals that are already
--returned.
SELECT a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY GROUPING SETS (a.CountryRegion, a.StateProvince, ())
ORDER BY a.CountryRegion, a.StateProvince;

--2. Indicate the grouping level in the results
--Tip: Review the documentation for the GROUPING_ID function in the Transact-SQL Language Reference.
--Modify your query to include a column named Level that indicates at which level in the total,
--country/region, and state/province hierarchy the revenue figure in the row is aggregated. For example,
--the grand total row should contain the value ¡®Total¡¯, the row showing the subtotal for United States
--should contain the value ¡®United States Subtotal¡¯, and the row showing the subtotal for California should
--contain the value ¡®California Subtotal¡¯.
SELECT a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue,
	CASE
		WHEN GROUPING_ID(a.CountryRegion, a.StateProvince) = 3 THEN 'Total'
		WHEN GROUPING_ID(a.CountryRegion, a.StateProvince) = 2 THEN (a.StateProvince + ' Subtotal')
		WHEN GROUPING_ID(a.CountryRegion, a.StateProvince) = 1 THEN (a.CountryRegion + ' Subtotal')
	END AS 'Level'
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY GROUPING SETS (a.CountryRegion, a.StateProvince, ())
ORDER BY a.CountryRegion, a.StateProvince;

--3. Add a grouping level for cities
--Extend your query to include a grouping for individual cities.
SELECT a.CountryRegion, a.StateProvince, a.City, SUM(soh.TotalDue) AS Revenue,
	CASE
		WHEN GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 7 THEN 'Total'
		WHEN GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 6 THEN (a.City + ' Subtotal')
		WHEN GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 5 THEN (a.StateProvince + ' Subtotal')
		WHEN GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 3 THEN (a.CountryRegion + ' Subtotal')
	END AS 'Level'
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY GROUPING SETS (a.CountryRegion, a.StateProvince, a.City, ())
ORDER BY a.CountryRegion, a.StateProvince, a.City;