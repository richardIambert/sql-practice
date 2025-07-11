SELECT
  OrderId,
  RequiredDate,
  ShippedDate,
  CASE 
    WHEN ShippedDate > RequiredDate THEN 'Overdue'
    ELSE 'On Time' 
  END AS Status
FROM
  Orders;