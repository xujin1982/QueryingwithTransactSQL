--1. Retrieve customer sales revenue for each parent category
--Tip: Review the documentation for the PIVOT operator in the FROM clause syntax in the Transact-SQL
--language reference.
--Retrieve a list of customer company names together with their total revenue for each parent category in
--Accessories, Bikes, Clothing, and Components.
SELECT * 
FROM
(
	SELECT sod.LineTotal AS Revenue, vgac.ParentProductCategoryName AS ParentCategory, c.CompanyName
	FROM SalesLT.SalesOrderDetail AS sod
	JOIN SalesLT.Product AS p
	ON sod.ProductID = p.ProductID
	JOIN SalesLT.vGetAllCategories AS vgac
	ON p.ProductCategoryID = vgac.ProductCategoryID
	JOIN SalesLT.SalesOrderHeader AS soh
	ON sod.SalesOrderID = soh.SalesOrderID
	JOIN SalesLT.Customer AS c
	ON soh.CustomerID = c.CustomerID
	--ORDER BY CompanyName
) AS SourceTable
PIVOT 
(
	SUM(Revenue)
	FOR ParentCategory IN
	(
		[Accessories], [Bikes], [Clothing], [Components]
	)
) AS PivotTable
ORDER BY CompanyName;