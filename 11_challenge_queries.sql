-- 2.1 Write a query that lists all Customers in either Paris or London. Include Customer ID, Company Name and all address fields.

SELECT
  CustomerId AS 'Customer ID',
  CompanyName AS 'Company Name', 
  ContactTitle AS 'Title', 
  Address, 
  City, 
  Region, 
  PostalCode AS 'Postal Code',
  Country
FROM
  Customers
WHERE
  City IN ('Paris', 'London');

-- 2.2 List all products stored in bottles.

SELECT
  ProductName AS 'Product Name',
  QuantityPerUnit AS 'Quantity Per Unit'
FROM
  Products
WHERE
  QuantityPerUnit LIKE '%bottle%';

-- 2.3 Repeat question above, but add in the Supplier Name and Country.

SELECT
  p.ProductName AS 'Product Name',
  s.CompanyName AS 'Supplier Name',
  s.Country
FROM
  Products AS p
INNER JOIN Suppliers AS s ON p.SupplierID = s.SupplierID
WHERE
  p.QuantityPerUnit LIKE '%bottle%';

-- 2.4 Write an SQL Statement that shows how many products there are in each category. Include Category Name in result set and list the highest number first.

SELECT
  p.CategoryId AS 'Category ID',
  c.CategoryName AS 'Category Name',
  COUNT(p.CategoryId) AS 'Products In Category'
FROM
  Products AS p
INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID
GROUP BY
  p.CategoryID,
  c.CategoryName
ORDER BY
  'Products In Category' DESC;

-- 2.5 List all UK employees using concatenation to join their title of courtesy, first name and last name together. Also include their city of residence.

SELECT
  CONCAT_WS(' ', TitleOfCourtesy, FirstName, LastName) AS 'Full Name',
  City
FROM
  Employees
WHERE
  Country = 'UK';

-- 2.6 Count how many Orders have a Freight amount greater than 100.00 and either USA or UK as Ship Country.

SELECT
  Freight,
  ShipCountry AS 'Ship Country'
FROM
  Orders
WHERE
  Freight > 100 AND ShipCountry IN ('USA', 'UK');

SELECT
  COUNT(*) AS 'Number Of Orders (Shipped to UK or USA with freight amount greater than 100)'
FROM
  Orders
WHERE
  Freight > 100 AND ShipCountry IN ('USA', 'UK');

-- 2.7 Write a SQL statement to find the order line with the highest discount applied.
-- Display the order number of the order that contains this order line, as well as the discount applied. 
-- The information can be obtained from the [OrderDetails] table.

SELECT TOP 3
  OrderId AS 'Order ID',
  UnitPrice AS 'Unit Price',
  Quantity,
  Quantity * UnitPrice AS Total,
  Discount,
  Quantity * UnitPrice * Discount AS 'Discount Applied'
FROM
  [Order Details]
ORDER BY
  'Discount Applied' DESC;

-- 2.8 Create a view which lists all Employees from the Employees table and who they report to. Query the view.

CREATE VIEW EmployeeLineManagers AS
SELECT
  e.EmployeeId AS 'Employee ID',
  CONCAT_WS(' ', e.FirstName, e.LastName) AS 'Employee',
  CONCAT_WS(' ', m.FirstName, m.LastName) AS 'Reports To'
FROM
  Employees e, Employees m
WHERE
  e.ReportsTo = m.EmployeeID;

DROP VIEW EmployeeLineManagers;
SELECT * FROM EmployeeLineManagers;

-- 2.9 Create a stored procedure called “CustomerTotalFreightAmount” that takes the Customer ID as a parameter and returns the Total Freight Amount for that Customer (HINT: this information is in the Orders table). 
-- Execute the stored procedure where the Customer ID is ‘ALFKI’. 
-- Note: Stored procedures can be found by opening up the Northwind database and navigating to “Programmability > Stored Procedures

CREATE PROCEDURE CustomerTotalFreightAmount @CustomerID NVARCHAR(30)
AS
SELECT
  c.CustomerId AS 'Customer ID',
  c.CompanyName AS 'Customer Name',
  SUM(o.Freight) AS 'Total Freight Amount'
FROM
  Orders AS o
INNER JOIN Customers AS c ON o.CustomerID = c.CustomerID
WHERE
  c.CustomerId = @CustomerId
GROUP BY
  c.CustomerID,
  c.CompanyName
GO

EXEC CustomerTotalFreightAmount @CustomerID = 'ALFKI';