-- Table: Orders

-- +-----------------+----------+
-- | Column Name     | Type     |
-- +-----------------+----------+
-- | order_number    | int      |
-- | customer_number | int      |
-- +-----------------+----------+
-- order_number is the primary key (column with unique values) for this table.
-- This table contains information about the order ID and the customer ID.
 

-- Write a solution to find the customer_number for the customer who has placed the largest number of orders.

-- The test cases are generated so that exactly one customer will have placed more orders than any other customer.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Orders table:
-- +--------------+-----------------+
-- | order_number | customer_number |
-- +--------------+-----------------+
-- | 1            | 1               |
-- | 2            | 2               |
-- | 3            | 3               |
-- | 4            | 3               |
-- +--------------+-----------------+
-- Output: 
-- +-----------------+
-- | customer_number |
-- +-----------------+

-- | 3               |
-- +-----------------+
-- Explanation: 
-- The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order. 
-- So the result is customer_number 3.


--Solution
with cte as(
    select customer_number, count(order_number) as NumOrder
    from Orders
    group by customer_number
)

select customer_number 
from cte
where NumOrder = (select max(NumOrder) from cte)

--Note: Common Table Expressio is faster than Subquery as CTE saves the result in memory and fetch the result everytime query gets executed whereas subquery runs the whole query 
--everytime query is executed (leads to computational waste)
