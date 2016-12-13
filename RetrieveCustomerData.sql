-- Challenge 1: Retrieve Customer Data
-- Adventure Works Cycles sells directly to retailers, who then sell products to consumers. Each retailer
-- that is an Adventure Works customer has provided a named contact for all communication from
-- Adventure Works. The sales manager at Adventure Works has asked you to generate some reports
-- containing details of the company’s customers to support a direct sales campaign.


-- 1. Retrieve customer details
-- Familiarize yourself with the Customer table by writing a Transact-SQL query that retrieves all columns
-- for all customers.
SELECT * 
FROM SalesLT.Customer

-- 2. Retrieve customer name data
-- Create a list of all customer contact names that includes the title, first name, middle name (if any), last
-- name, and suffix (if any) of all customers.
SELECT Title, FirstName, MiddleName, LastName, Suffix
FROM SalesLT.Customer

-- 3. Retrieve customer names and phone numbers
-- Each customer has an assigned salesperson. You must write a query to create a call sheet that lists:
--  The salesperson
--  A column named CustomerName that displays how the customer contact should be greeted (for
-- example, “Mr Smith”)
--  The customer’s phone number.
SELECT SalesPerson, Title + LastName AS CustomerName, Phone
FROM SalesLT.Customer