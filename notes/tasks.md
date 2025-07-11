# SQL Tasks

### Try the following on the Northwind database:

- [x] Write a `SELECT` using the `employees` table and concatenate `first_name` and `last_name` together. Use a column alias to rename the column to `Employee Name`.
- [x] Write a `SELECT` statement to list the six countries that have `region` codes in the `Customers` table.

### Research the different arithmetic operators:

- [x] Write a `SELECT` statement that returns the `unit_price`, `quantity`, `discount` and the `gross_total` (Price \* Discount) from the `order_details` table.
- [x] Add to the statement above to also include `net_total`.
- [x] Add to the statement above to order the results in descending order.

### Research String Functions:

- [x] Use `CHARINDEX` to list only `product_name`s that contain a single quote from the `products` table.

  > **Note**: `CHARINDEX` doesn't exist in postgres. Used `POISTION` instead.

### Research Date functions:

- [x] Output a list of employees from the `employees` table including their `Name` (concatenated) and their `Age` (calculated from `birth_date`).

### Research Case statements:

- [x] Use a `CASE` statement to label orders as `"On Time"` or `"Overdue"`.

### Research Aggregate Functions:

- [x] Use `GROUP BY` to calculate the average reorder level for all `products` by `category_id`.
      Remember the `SELECT` clause must match the `GROUP BY` clause apart from any aggregates.
      What is the highest average reorder level? Use `ORDER BY` with `DESC` to confirm.

> **Note**: You _can_ use a column alias in the `ORDER BY` clause due to processing sequence.

- [ ] Research `HAVING`.
