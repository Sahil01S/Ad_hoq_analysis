-- Question_7

SELECT
  EXTRACT(MONTH FROM fs.date) AS Month,
  EXTRACT(YEAR FROM fs.date) AS Year,
  SUM(fs.sold_quantity * gp.gross_price) AS Gross_sales_Amount
FROM gdb023.fact_sales_monthly fs
JOIN gdb023.dim_customer c ON fs.customer_code = c.customer_code
JOIN gdb023.fact_gross_price gp ON fs.product_code = gp.product_code
WHERE c.customer = 'Atliq Exclusive'
  AND EXTRACT(YEAR FROM fs.date) = gp.fiscal_year
GROUP BY EXTRACT(MONTH FROM fs.date), EXTRACT(YEAR FROM fs.date)
ORDER BY Year, Month;
