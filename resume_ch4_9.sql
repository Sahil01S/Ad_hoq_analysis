-- Question_9

WITH Output AS (
    SELECT 
        C.channel,
        ROUND(SUM(G.gross_price * FS.sold_quantity / 1000000), 2) AS Gross_sales_mln
    FROM gdb023.fact_sales_monthly FS
    JOIN gdb023.dim_customer C ON FS.customer_code = C.customer_code
    JOIN gdb023.fact_gross_price G ON FS.product_code = G.product_code
    WHERE FS.fiscal_year = 2021
    GROUP BY C.channel
),

TotalSales AS (
    SELECT 
        SUM(Gross_sales_mln) AS total
    FROM Output
)

SELECT 
    o.channel,
    CONCAT(o.Gross_sales_mln, ' M') AS Gross_sales_mln,
    CONCAT(ROUND((o.Gross_sales_mln / t.total) * 100, 2), ' %') AS percentage
FROM Output o
JOIN TotalSales t
ORDER BY o.Gross_sales_mln DESC;

