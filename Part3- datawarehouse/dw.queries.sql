-- Q1
SELECT dd.month, dp.category, SUM(fs.revenue)
FROM fact_sales fs
JOIN dim_product dp ON fs.product_id = dp.product_id
JOIN dim_date dd ON fs.date_id = dd.date_id
GROUP BY dd.month, dp.category;

-- Q2
SELECT store_id, SUM(revenue) AS total
FROM fact_sales
GROUP BY store_id
ORDER BY total DESC
LIMIT 2;

-- Q3
SELECT dd.month, SUM(fs.revenue)
FROM fact_sales fs
JOIN dim_date dd ON fs.date_id = dd.date_id
GROUP BY dd.month;