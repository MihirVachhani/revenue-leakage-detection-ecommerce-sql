-- Analysis : Marketplace Profile

SELECT 
    COUNT(DISTINCT customer_id) AS customers,
    COUNT(DISTINCT order_id) AS orders
FROM
    orders;
  
  
-- How many products and sellers exist?
SELECT
    (SELECT COUNT(*) FROM products) AS products,
    (SELECT COUNT(*) FROM sellers) AS sellers;
  
  
-- How many order items were sold?
SELECT
    COUNT(*) AS total_order_items
FROM order_items;


-- Analysis: Revenue Overview
-- What is total GMV?
SELECT
    ROUND(SUM(price),2) AS total_gmv
FROM order_items;


-- Total Freight Cost
SELECT
    ROUND(SUM(freight_value),2) AS total_freight
FROM order_items;


-- Freight Burden Ratio
SELECT 
    ROUND(SUM(freight_value) / SUM(price) * 100, 2) AS freight_ratio_pct
FROM
    order_items;


-- Analysis: Revenue Trend Analysis
-- Monthly GMV Trend
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    ROUND(SUM(oi.price), 2) AS gmv
FROM
    orders o
        JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;


-- Analysis: Category Performance
-- op Revenue Categories
SELECT 
    p.product_category_name, ROUND(SUM(oi.price), 2) AS revenue
FROM
    order_items oi
        JOIN
    products p ON oi.product_id = p.product_id
GROUP BY 1
ORDER BY revenue DESC
LIMIT 10;


-- Analysis: Seller Ecosystem
-- Top Sellers by Revenue
SELECT 
    seller_id, ROUND(SUM(price), 2) AS revenue
FROM
    order_items
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 10;


-- Anlysis: Customer Satisfaction
-- Average Review Score
SELECT
ROUND(
AVG(review_score),
2
) AS avg_review_score
FROM reviews;


-- Review Distribution
SELECT 
    review_score, COUNT(*) AS reviews
FROM
    reviews
GROUP BY review_score
ORDER BY review_score;


 -- Analysis: Delivery Performance
 -- Order Performance
SELECT 
    COUNT(*) AS total_delivered,
    SUM(CASE
        WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1
        ELSE 0
    END) AS late_orders
FROM
    orders
WHERE
    order_status = 'delivered';