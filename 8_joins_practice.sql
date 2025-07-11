-- Task 1

-- SELECT
--   *
-- FROM
--   Customers AS c
-- INNER JOIN
--   Orders AS o
-- ON
--   c.CustomerID = o.CustomerID
-- WHERE
--   o.ShipCountry = 'Brazil';

-- Task 2

SELECT
  s.SupplierID AS [Supplier ID],
  s.CompanyName AS [Company Name],
  AVG(p.UnitsOnOrder) AS [Avg Units On Order]
FROM
  Products AS p
INNER JOIN
  Suppliers AS s
ON
  p.SupplierId = s.SupplierId
GROUP BY
  s.SupplierID,
  s.CompanyName
ORDER BY
  [Avg Units On Order] DESC,
  [Company Name] ASC;

