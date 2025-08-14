-- Identifies customers whose simulated last order date (shifted from 1998 to today)
-- falls more than 12 months ago, helping highlight long-term inactive customers
-- for potential re-engagement or churn analysis.

SELECT
    c.customer_id,
    c.company_name,
    MAX(o.order_date) AS original_last_order_date,
    MAX(o.order_date) + (CURRENT_DATE - DATE '1998-05-06') AS shifted_last_order_date
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.company_name
HAVING (MAX(o.order_date) + (CURRENT_DATE - DATE '1998-05-06')) < CURRENT_DATE - INTERVAL '12 months'

ORDER BY shifted_last_order_date;












