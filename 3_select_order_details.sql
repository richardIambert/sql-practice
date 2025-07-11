SELECT
  UnitPrice,
  Quantity,
  Discount,
  ROUND(CAST(Unitprice * Quantity AS DECIMAL(10, 2)), 2) AS [Gross Total],
  ROUND(
    CAST(
      Unitprice * Quantity * (1 - Discount) AS DECIMAL(10, 2)
    ),
    2
  ) AS [Net Total]
FROM
  [Order Details]
ORDER BY
  [Net Total] DESC;