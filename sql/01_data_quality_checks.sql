-- Aduit 1 Record Count
SELECT 
    'customers' AS table_name, COUNT(*) AS record_count
FROM
    customers 
UNION ALL SELECT 
    'orders', COUNT(*)
FROM
    orders 
UNION ALL SELECT 
    'order_items', COUNT(*)
FROM
    order_items 
UNION ALL SELECT 
    'payments', COUNT(*)
FROM
    payments 
UNION ALL SELECT 
    'reviews', COUNT(*)
FROM
    reviews 
UNION ALL SELECT 
    'products', COUNT(*)
FROM
    products 
UNION ALL SELECT 
    'sellers', COUNT(*)
FROM
    sellers 
UNION ALL SELECT 
    'geolocation', COUNT(*)
FROM
    geolocation;


-- Audit 2 PrimaryKey Uniqueness
-- Customers Table
SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT customer_id) AS unique_customer_ids
FROM customers;

-- Orders Table
SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT order_id) AS unique_orders
FROM orders;

-- Products Table
SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT product_id) AS unique_products
FROM products;

-- Sellers Table
SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT seller_id) AS unique_sellers
FROM sellers;

-- Reviews Table 
SELECT
COUNT(*) total_rows,
COUNT(DISTINCT review_id) unique_reviews
FROM reviews;


-- Payments Table 
SELECT
COUNT(*) total_rows,
COUNT(DISTINCT CONCAT(order_id,'-',payment_sequential))
unique_payments
FROM payments;

-- Category Translation Table 
SELECT
COUNT(*) total_rows,
COUNT(DISTINCT product_category_name)
unique_categories
FROM product_category_translation;


-- Audit 3 Misssing Values
SELECT 
    COUNT(*) AS total_orders,
    SUM(customer_id IS NULL) AS missing_customer,
    SUM(order_status IS NULL) AS missing_status,
    SUM(order_purchase_timestamp IS NULL) AS missing_purchase_date,
    SUM(order_estimated_delivery_date IS NULL) AS missing_estimated_delivery
FROM
    orders;
    
    
-- Audit 4 Products Data Quality
SELECT 
    SUM(product_category_name IS NULL) AS missing_category,
    SUM(product_name_lenght IS NULL) AS missing_name_length,
    SUM(product_description_lenght IS NULL) AS missing_description_length,
    SUM(product_weight_g IS NULL) AS missing_weight
FROM
    products;
    
    
-- Audit 5 Order Status Distribution
SELECT 
    order_status, COUNT(*) AS orders
FROM
    orders
GROUP BY order_status
ORDER BY orders DESC;


-- Audit 6 Date Range Validation
SELECT 
    MIN(order_purchase_timestamp) AS first_order,
    MAX(order_purchase_timestamp) AS last_order
FROM
    orders;
    

-- Audit 7 Relationship Validation
SELECT 
    COUNT(*) AS orphan_orders
FROM
    orders o
        LEFT JOIN
    customers c ON o.customer_id = c.customer_id
WHERE
    c.customer_id IS NULL;
    
    
-- Audit 8 Product Validation
SELECT 
    COUNT(*) AS missing_products
FROM
    order_items oi
        LEFT JOIN
    products p ON oi.product_id = p.product_id
WHERE
    p.product_id IS NULL;
    
    
-- audit 9 Seller Validation
SELECT 
    COUNT(*) AS missing_sellers
FROM
    order_items oi
        LEFT JOIN
    sellers s ON oi.seller_id = s.seller_id
WHERE
    s.seller_id IS NULL;
    

-- Review Score Range
SELECT
MIN(review_score),
MAX(review_score)
FROM reviews;

-- Negative Values
SELECT
MIN(price),
MIN(freight_value)
FROM order_items;

-- Payment Validation
SELECT
MIN(payment_value),
MAX(payment_value)
FROM payments;

-- Impossible Dates
SELECT COUNT(*)
FROM orders
WHERE order_delivered_customer_date
      < order_purchase_timestamp;


-- findig : in reviews table there are 814 more rows than unique review IDs
-- so next analysis is 
-- calculate difference
SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT review_id) AS unique_review_ids,
COUNT(*) - COUNT(DISTINCT review_id) AS duplicate_difference
FROM reviews;

-- Investigation 1 : Find review IDs appearing multiple times.
SELECT
review_id,
COUNT(*) AS occurrences
FROM reviews
GROUP BY review_id
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;

-- Investigation 2: Check whether the same review_id belongs to multiple orders.
SELECT
review_id,
COUNT(DISTINCT order_id) AS distinct_orders,
COUNT(*) AS total_rows
FROM reviews
GROUP BY review_id
HAVING COUNT(*) > 1
ORDER BY total_rows DESC;

-- Investigation 3: Look at actual examples.
SELECT *
FROM reviews
WHERE review_id IN (
    SELECT review_id
    FROM reviews
    GROUP BY review_id
    HAVING COUNT(*) > 1
)
LIMIT 20;
-- so after all Investigation conclusion is A single review_id can be associated with multiple orders.