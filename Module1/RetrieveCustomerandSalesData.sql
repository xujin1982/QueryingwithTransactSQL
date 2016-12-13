-- Challenge 2: Retrieve Customer and Sales Data
-- As you continue to work with the Adventure Works customer data, you must create queries for reports
-- that have been requested by the sales team

-- 1. Retrieve a list of customer companies
-- You have been asked to provide a list of all customer companies in the format <Customer ID> :
-- <Company Name> - for example, 78: Preferred Bikes.
SELECT TRY_CONVERT(varchar,CustomerID) + ': ' + CompanyName
FROM SalesLT.Customer;

-- 2. Retrieve a list of sales order revisions
--The SalesLT.SalesOrderHeader table contains records of sales orders. You have been asked to retrieve
--data for a report that shows:
-- The sales order number and revision number in the format <Order Number> (<Revision>) – for
--example SO71774 (2).
-- The order date converted to ANSI standard format (yyyy.mm.dd – for example 2015.01.31).
SELECT SalesOrderNumber + '(' + TRY_CONVERT(varchar,RevisionNumber) + ')' AS SalesOrder, TRY_CONVERT(date,OrderDate)
FROM SalesLT.SalesOrderHeader
