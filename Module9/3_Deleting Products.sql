--1. Delete a product category and its products
--Delete the records foe the Bells and Horns category and its products. You must ensure that you delete
--the records from the tables in the correct order to avoid a foreign-key constraint violation.
DELETE FROM SalesLT.Product
WHERE ProductCategoryID =
	(SELECT ProductCategoryID 
	FROM SalesLT.ProductCategory 
	WHERE Name = 'Bells and Horns');

DELETE FROM SalesLT.ProductCategory
WHERE ProductCategoryID =
	(SELECT ProductCategoryID 
	FROM SalesLT.ProductCategory 
	WHERE Name = 'Bells and Horns');