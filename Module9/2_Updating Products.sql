--1. Update product prices
--The sales manager at Adventure Works has mandated a 10% price increase for all products in the Bells
--and Horns category. Update the rows in the SalesLT.Product table for these products to increase their
--price by 10%.
UPDATE SalesLT.Product
SET ListPrice = ListPrice * 1.1
WHERE ProductCategoryID = 
	(SELECT ProductCategoryID 
	FROM SalesLT.ProductCategory 
	WHERE Name = 'Bells and Horns');


--2. Discontinue products
--The new LED lights you inserted in the previous challenge are to replace all previous light products.
--Update the SalesLT.Product table to set the DiscontinuedDate to today¡¯s date for all products in the
--Lights category (Product Category ID 37) other than the LED Lights product you inserted previously.
UPDATE SalesLT.Product
SET DiscontinuedDate = GETDATE()
WHERE ProductCategoryID = 37 AND Name <> 'LED Lights';
