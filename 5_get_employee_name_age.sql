SELECT
  CONCAT_WS(' ', FirstName, LastName) AS Name,
  DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age,
  CASE 
    WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) > 65 THEN 'Retired'
    WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) > 60 THEN 'Retirement due'
    ELSE 'More than 5 years to go' 
  END AS [Retirement Status]
FROM
  Employees;