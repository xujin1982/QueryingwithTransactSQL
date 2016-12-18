--1. Retrieve the name and approximate weight of each product
--Write a query to return the product ID of each product, together with the product name formatted as
--upper case and a column named ApproxWeight with the weight of each product rounded to the nearest
--whole unit.
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight,0) AS ApproxWeight
FROM SalesLT.Product;

--2. Retrieve the year and month in which products were first sold
--Extend your query to include columns named SellStartYear and SellStartMonth containing the year and
--month in which Adventure Works started selling each product. The month should be displayed as the
--month name (for example, ¡®January¡¯).
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight,0) AS ApproxWeight,
	YEAR(SellStartDate) AS SellStartYear, DATENAME(month,SellStartDate) AS SellStartMonth
FROM SalesLT.Product;

--3. Extract product types from product numbers
--Extend your query to include a column named ProductType that contains the leftmost two characters
--from the product number.
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight,0) AS ApproxWeight,
	YEAR(SellStartDate) AS SellStartYear, DATENAME(month,SellStartDate) AS SellStartMonth,
	LEFT(ProductNumber,2) AS ProductType
FROM SalesLT.Product;

--4. Retrieve only products with a numeric size
--Extend your query to filter the product returned so that only products with a numeric size are included.
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight,0) AS ApproxWeight,
	YEAR(SellStartDate) AS SellStartYear, DATENAME(month,SellStartDate) AS SellStartMonth,
	LEFT(ProductNumber,2) AS ProductType
FROM SalesLT.Product
WHERE ISNUMERIC(Size) = 1
