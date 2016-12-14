--1. Retrieve product details for product model 1
--Initially, you need to find the names, colors, and sizes of the products with a product model ID 1.
SELECT Name, Color, Size
FROM SalesLT.Product
WHERE ProductModelID = 1;

--2. Filter products by color and size
--Retrieve the product number and name of the products that have a color of 'black', 'red', or 'white' and
--a size of 'S' or 'M'.
SELECT ProductNumber, Name, Color, Size
FROM SalesLT.Product
WHERE Color IN ('Black','Red','White') AND Size IN ('S','M');

--3. Filter products by product number
--Retrieve the product number, name, and list price of products whose product number begins 'BK-'.
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product 
WHERE ProductNumber LIKE 'BK-%';

--4. Retrieve specific products by product number
--Modify your previous query to retrieve the product number, name, and list price of products whose
--product number begins 'BK-' followed by any character other than 'R¡¯, and ends with a '-' followed by
--any two numerals.
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product 
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';