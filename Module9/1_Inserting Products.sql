--1. Insert a product
--Adventure Works has started selling the following new product. Insert it into the SalesLT.Product table,
--using default or NULL values for unspecified columns:
--Name ProductNumber StandardCost ListPrice ProductCategoryID SellStartDate
--LED Lights LT-L123 2.56 12.99 37 <Today>
--After you have inserted the product, run a query to determine the ProductID that was generated. Then
--run a query to view the row for the product in the SalesLT.Product table.
INSERT INTO SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
VALUES
('LED Lights', 'LT-L123', 2.56, 12.99, 37, GETDATE());

SELECT SCOPE_IDENTITY();

SELECT *
FROM SalesLT.Product
WHERE ProductID = SCOPE_IDENTITY();

--2. Insert a new category with two products
--Adventure Works is adding a product category for ¡®Bells and Horns¡¯ to its catalog. The parent category for
--the new category is 4 (Accessories). This new category includes the following two new products:Name ProductNumber StandardCost ListPrice ProductCategoryID SellStartDate
--Bicycle Bell BB-RING 2.47 4.99 <The new ID for
--Bells and Horns>
--<Today>
--Bicycle Horn BB-PARP 1.29 3.75 <The new ID for
--Bells and Horns>
--<Today>
--Write a query to insert the new product category, and then insert the two new products with the
--appropriate ProductCategoryID value.
--After you have inserted the products, query the SalesLT.Product and SalesLT.ProductCategory tables to
--verify that the data has been inserted.
INSERT INTO SalesLT.ProductCategory (ParentProductCategoryID, Name, ModifiedDate)
VALUES
(4, 'Bells and Horns', GETDATE());

INSERT INTO SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
VALUES
('Bicycle Bell', 'BB-RING', 2.47, 4.99, IDENT_CURRENT('SalesLT.ProductCategory'), GETDATE()),
('Bicycle Horn', 'BB-PARP', 1.29, 3.75, IDENT_CURRENT('SalesLT.ProductCategory'), GETDATE());

SELECT c.Name AS Category, p.Name AS Product
FROM SalesLT.Product ASp
JOIN SalesLT.ProductCategory AS c
ON p.ProductCategoryID = c.ProductCategoryID
WHERE ProductCategoryID = IDENT_CURRENT('SalesLT.ProductCategory');