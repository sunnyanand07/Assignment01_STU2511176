-- Q1: Customers from Mumbai with total order value
SELECT c.customer_name, SUM(p.price * oi.quantity) AS total_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE c.city = 'Mumbai'
GROUP BY c.customer_name;

-- Q2: Top 3 products by quantity
SELECT p.product_name, SUM(oi.quantity) AS total_qty
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_qty DESC
LIMIT 3;

-- Q3: Sales reps and number of customers
SELECT sr.rep_name, COUNT(DISTINCT o.customer_id) AS total_customers
FROM Sales_Representatives sr
JOIN Orders o ON sr.rep_id = o.rep_id
GROUP BY sr.rep_name;

-- Q4: Orders above 10000
SELECT o.order_id, SUM(p.price * oi.quantity) AS total_value
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY o.order_id
HAVING total_value > 10000
ORDER BY total_value DESC;

-- Q5: Products never ordered
SELECT p.product_name
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;