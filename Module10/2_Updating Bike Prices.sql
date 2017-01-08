/*
1. Write a WHILE loop to update bike prices
The loop should:
 Execute only if the average list price of a product in the ‘Bikes’ parent category is less than the
market average. Note that the product categories in the Bikes parent category can be
determined from the SalesLT.vGetAllCategories view.
 Update all products that are in the ‘Bikes’ parent category, increasing the list price by 10%.
 Determine the new average and maximum selling price for products that are in the ‘Bikes’
parent category. If the new maximum price is greater than or equal to the maximum acceptable price, exit the
loop; otherwise continue.
*/

DECLARE @avgPrice MONEY
DECLARE @maxPrice MONEY

SELECT @avgPrice = AVG(ListPrice), @maxPrice = MAX(ListPrice)
FROM SalesLT.Product
WHERE ProductCategoryID IN (
	SELECT ProductCategoryID
	FROM SalesLT.vGetAllCategories
	WHERE ParentProductCategoryName = 'Bikes')

WHILE @avgPrice <= 2000
BEGIN
	UPDATE SalesLT.Product
	SET ListPrice = ListPrice * 1.1
	WHERE ProductCategoryID IN (
		SELECT ProductCategoryID
		FROM SalesLT.vGetAllCategories
		WHERE ParentProductCategoryName = 'Bikes')

	SET @avgPrice = @avgPrice * 1.1
	SET @maxPrice = @maxPrice * 1.1

	IF @maxPrice >= 5000
		BREAK
	ELSE
		CONTINUE
END

PRINT @avgPrice
PRINT @maxPrice