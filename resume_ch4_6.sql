-- Question_6

SELECT 
  c.customer_code,
  c.customer,
  AVG(fp.pre_invoice_discount_pct) AS average_discount_percentage
FROM gdb023.fact_pre_invoice_deductions fp
JOIN gdb023.dim_customer c ON fp.customer_code = c.customer_code
WHERE fp.fiscal_year = 2021
  AND c.market = 'India'
GROUP BY c.customer_code, c.customer
ORDER BY average_discount_percentage DESC
LIMIT 5;