-- ? Step 1: Create the table
CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);

-- ? Step 2: Insert sample data
INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, '2024-01-05', 250.00, 101),
(2, '2024-01-12', 450.00, 102),
(3, '2024-02-01', 500.00, 103),
(4, '2024-02-18', 300.00, 104),
(5, '2024-03-03', 750.00, 105),
(6, '2024-03-14', 200.00, 106),
(7, '2024-04-22', 900.00, 107),
(8, '2024-05-09', 650.00, 108),
(9, '2024-05-15', 400.00, 109),
(10, '2024-06-02', 1000.00, 110);

-- ? Step 3: Calculate monthly revenue and order volume
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- ? Step 4 (Optional): Get top 3 months by total revenue
SELECT TOP 3
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY MONTH(order_date)
ORDER BY total_revenue DESC;
