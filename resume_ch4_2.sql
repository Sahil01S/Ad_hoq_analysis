
-- Question_2
WITH products_2020 AS (
  SELECT COUNT(DISTINCT product_code) AS unique_products_2020
  FROM gdb023.fact_sales_monthly
  WHERE fiscal_year = 2020
),
products_2021 AS (
  SELECT COUNT(DISTINCT product_code) AS unique_products_2021
  FROM gdb023.fact_sales_monthly
  WHERE fiscal_year = 2021
)
SELECT 
  p2020.unique_products_2020,
  p2021.unique_products_2021,
  ROUND((p2021.unique_products_2021 - p2020.unique_products_2020) * 100.0 / p2020.unique_products_2020, 2) AS percentage_chg
FROM products_2020 p2020, products_2021 p2021;