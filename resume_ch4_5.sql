
-- Question_5

-- Find products with the highest and lowest manufacturing costs
(SELECT 
  fmc.product_code, dp.product, fmc.manufacturing_cost
FROM gdb023.fact_manufacturing_cost fmc
JOIN gdb023.dim_product dp ON fmc.product_code = dp.product_code
ORDER BY fmc.manufacturing_cost DESC
LIMIT 1)
UNION ALL
(SELECT 
  fmc.product_code, dp.product, fmc.manufacturing_cost
FROM gdb023.fact_manufacturing_cost fmc
JOIN gdb023.dim_product dp ON fmc.product_code = dp.product_code
ORDER BY fmc.manufacturing_cost ASC
LIMIT 1);