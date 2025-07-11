SELECT
  o.OrderID AS [Order ID],
  o.OrderDate AS [Order Date],
  o.Freight,
  c.CompanyName AS [Customer Name],
  CONCAT_WS(' ', e.FirstName, e.LastName) AS [Employee Name]
FROM
  Orders AS o
INNER JOIN Customers AS c ON o.CustomerID = o.CustomerID
INNER JOIN Employees AS e ON o.EmployeeID = e.EmployeeID; 
