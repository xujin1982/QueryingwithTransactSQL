--1. Retrieve product model descriptions
--Retrieve the product ID, product name, product model name, and product model summary for each
--product from the SalesLT.Product table and the SalesLT.vProductModelCatalogDescription view.
SELECT p.ProductID, p.Name AS ProductName, vpmd.Name AS ProductModel, vpmd.Summary
FROM SalesLT.Product AS p
JOIN SalesLT.vProductModelCatalogDescription AS vpmd
ON p.ProductModelID = vpmd.ProductModelID;

--2. Create a table of distinct colors
--Tip: Review the documentation for Variables in Transact-SQL Language Reference.
--Create a table variable and populate it with a list of distinct colors from the SalesLT.Product table. Then
--use the table variable to filter a query that returns the product ID, name, and color from the
--SalesLT.Product table so that only products with a color listed in the table variable are returned.
DECLARE @Colors AS TABLE(Color varchar(15));

INSERT INTO @Colors
SELECT DISTINCT Color FROM SalesLT.Product

SELECT ProductID, Name, Color
FROM SalesLT.Product AS p
WHERE Color IN (SELECT Color FROM @Colors)
	
--3. Retrieve product parent categories
--The AdventureWorksLT database includes a table-valued function named dbo.ufnGetAllCategories,
--which returns a table of product categories (for example ¡®Road Bikes¡¯) and parent categories (for
--example ¡®Bikes¡¯). Write a query that uses this function to return a list of all products including their
--parent category and category.
SELECT p.ProductID, Name AS ProductName, ProductCategoryName AS Category, ParentProductCategoryName AS ParentCategory
FROM SalesLT.Product AS p
JOIN dbo.ufnGetAllCategories() AS ufn
ON p.ProductCategoryID = ufn.ProductCategoryID
ORDER BY ParentCategory, Category, ProductName;