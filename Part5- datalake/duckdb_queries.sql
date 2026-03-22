--Q1: Total number of order per customer 
SELECT c.customer_name,COUNT(o.order_id) AS total_orders
FROM read_csv_auto('Datasets/customers.csv') c
LEFT JOIN read_json_auto('Datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

--Q2: Top 3 customers by total order value
SELECT c.customer_id, SUM(o.total_amount) AS total_value
FROM read_csv_auto('Datasets/customers.csv') c
JOIN read_json_auto('Datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_value DESC
LIMIT 3;

--Q3: Products purchased by customers from Bangalore
SELECT DISTINCT p.product_name
FROM read_csv_auto('Datasets/customers.csv') c 
JOIN read_json_auto('Datasets/orders.json') o
ON o.product_id = o.customer_id
JOIN read_parquet('Datasets/products.parquet') p  
ON o.product_id = p.product_id
WHEREc.city = 'Bangalore';

--Q4: Join all files
SELECT c.customer_name, o.order_date, p.product_name, o.quantity
FROM read_csv_auto('Datasets/customers.csv') c 
JOIN read_json_auto('Datasets\/orders.json') o 
ON c.customer_id = o.customer_id
JOIN read_parquet('Datasets/products.parquet') p 
ON o.product_id = p.product_id;
