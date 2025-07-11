SELECT
  CategoryId,
  AVG(ReorderLevel) AS [Average Reorder Level]
FROM
  Products
GROUP BY
  CategoryID
ORDER BY
  [Average Reorder Level] DESC;
