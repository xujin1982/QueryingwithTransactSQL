--1. Retrieve a list of cities
--Initially, you need to produce a list of all of you customers' locations. Write a Transact-SQL query that
--queries the Address table and retrieves all values for City and StateProvince, removing duplicates.
SELECT DISTINCT City, StateProvince
FROM SalesLT.Address

--2. Retrieve the heaviest products
--Transportation costs are increasing and you need to identify the heaviest products. Retrieve the names
--of the top ten percent of products by weight.
SELECT TOP 10 PERCENT Weight
FROM SalesLT.Product
ORDER BY Weight DESC

--3. Retrieve the heaviest 100 products not including the heaviest ten
--The heaviest ten products are transported by a specialist carrier, therefore you need to modify the
--previous query to list the heaviest 100 products not including the heaviest ten.
SELECT Weight
FROM SalesLT.Product
ORDER BY Weight DESC
OFFSET 10 ROWS
FETCH NEXT 100 ROWS ONLY