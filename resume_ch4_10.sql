-- Question_10

WITH ProductSales AS (
    SELECT 
        p.division,
        fs.product_code,
        p.product,
        SUM(fs.sold_quantity) AS total_sold_quantity
    FROM gdb023.fact_sales_monthly fs
    JOIN gdb023.dim_product p ON fs.product_code = p.product_code
    WHERE fs.fiscal_year = 2021
    GROUP BY p.division, fs.product_code, p.product
),

RankedProducts AS (
    SELECT
        division,
        product_code,
        product,
        total_sold_quantity,
        ROW_NUMBER() OVER (PARTITION BY division ORDER BY total_sold_quantity DESC) AS rank_order
    FROM ProductSales
)

SELECT 
    division,
    product_code,
    product,
    total_sold_quantity,
    rank_order
FROM RankedProducts
WHERE rank_order <= 3
ORDER BY division, rank_order;
