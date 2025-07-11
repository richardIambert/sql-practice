SELECT
  ProductName
FROM
  Products
WHERE
  CHARINDEX('''', ProductName) > 0;