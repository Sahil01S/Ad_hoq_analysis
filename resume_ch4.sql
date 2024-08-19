-- question_1

SELECT market FROM gdb023.dim_customer
WHERE customer = 'Atliq Exclusive' AND region = 'APAC'
GROUP BY market
ORDER BY market ;








