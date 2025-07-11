SELECT
  od.ProductID, od.UnitPrice, od.Quantity, od.Discount
FROM
  [Order Details] AS od
WHERE od.ProductId IN (SELECT ProductID FROM Products p WHERE p.Discontinued = 1);