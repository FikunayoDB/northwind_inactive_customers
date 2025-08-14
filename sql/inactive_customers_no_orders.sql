-- Finds customers who have never placed an order (MAX(order_date) IS NULL)
-- and calculates a "shifted" last order date by moving the reference date
-- from 1998-05-06 to today, for use in non-permanent date simulations.

SELECT
    c.customer_id,
    c.company_name,
    MAX(o.order_date) AS original_last_order_date,
    MAX(o.order_date) + (CURRENT_DATE - DATE '1998-05-06') AS shifted_last_order_date
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.company_name
HAVING MAX(o.order_date) IS NULL
ORDER BY shifted_last_order_date;












