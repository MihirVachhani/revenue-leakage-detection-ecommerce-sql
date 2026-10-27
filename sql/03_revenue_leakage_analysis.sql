/*
Cancellation Analysis
Purpose: Cancelled orders represent revenue that could not be realized.
*/
SELECT 
    COUNT(*) AS cancelled_orders,
    ROUND(COUNT(*) * 100.0 / (SELECT 
                    COUNT(*)
                FROM
                    orders),
            2) AS cancellation_rate_pct
FROM
    orders
WHERE
    order_status = 'canceled';


/*
CANCELLED ORDER REVENUE EXPOSURE
Purpose: Estimate revenue associated with cancelled orders.
*/
SELECT 
    ROUND(SUM(oi.price), 2) AS cancelled_gmv
FROM
    orders o
        JOIN
    order_items oi ON o.order_id = oi.order_id
WHERE
    o.order_status = 'canceled';
    

/*
UNAVAILABLE ORDER ANALYSIS 
Purpose: Unavailable orders indicate inventory or seller failures.
*/
SELECT 
    COUNT(*) AS unavailable_orders,
    ROUND(COUNT(*) * 100.0 / (SELECT 
                    COUNT(*)
                FROM
                    orders),
            2) AS unavailable_rate_pct
FROM orders
WHERE order_status = 'unavailable';



-- UNAVAILABLE ORDER REVENUE EXPOSURE

SELECT 
    ROUND(SUM(oi.price), 2) AS unavailable_gmv
FROM
    orders o
        JOIN
    order_items oi ON o.order_id = oi.order_id
WHERE
    o.order_status = 'unavailable';
 
 
/*
DELAYED DELIVERY EXPOSURE
Purpose: Measure revenue associated with delayed orders.
*/
SELECT 
    ROUND(SUM(oi.price), 2) AS delayed_order_gmv
FROM
    orders o
        JOIN
    order_items oi ON o.order_id = oi.order_id
WHERE
    o.order_status = 'delivered'
        AND o.order_delivered_customer_date > o.order_estimated_delivery_date;


/*
CUSTOMER EXPERIENCE IMPACT
Purpose: Compare customer ratings for delayed and on-time deliveries.
*/
SELECT 
    CASE
        WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 'Delayed'
        ELSE 'On Time'
    END AS delivery_status,
    ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM
    orders o
        JOIN
    reviews r ON o.order_id = r.order_id
WHERE
    o.order_status = 'delivered'
GROUP BY delivery_status;


/*
DELAYED DELIVERY EXPOSURE BY CATEGORY
Purpose: Identify product categories most affected by late deliveries.
*/
SELECT 
    p.product_category_name,
    COUNT(*) AS delayed_orders,
    ROUND(SUM(oi.price), 2) AS delayed_revenue
FROM
    orders o
        JOIN
    order_items oi ON o.order_id = oi.order_id
        JOIN
    products p ON oi.product_id = p.product_id
WHERE
    o.order_status = 'delivered'
        AND o.order_delivered_customer_date > o.order_estimated_delivery_date
GROUP BY p.product_category_name
ORDER BY delayed_revenue DESC
LIMIT 10;


/*
SELLER DELAY IMPACT ANALYSIS
Purpose: Identify sellers associated with the largest delayed revenue exposure.
*/
SELECT 
    seller_id,
    COUNT(*) AS delayed_orders,
    ROUND(SUM(price), 2) AS delayed_revenue
FROM
    order_items oi
        JOIN
    orders o ON oi.order_id = o.order_id
WHERE
    o.order_status = 'delivered'
        AND o.order_delivered_customer_date > o.order_estimated_delivery_date
GROUP BY seller_id
ORDER BY delayed_revenue DESC
LIMIT 10;


/*
GEOGRAPHIC DELIVERY DELAY ANALYSIS
Purpose: Identify states with the highest delivery delay rates.
*/
SELECT 
    c.customer_state, COUNT(*) AS delayed_orders
FROM
    orders o
        JOIN
    customers c ON o.customer_id = c.customer_id
WHERE
    o.order_status = 'delivered'
        AND o.order_delivered_customer_date > o.order_estimated_delivery_date
GROUP BY c.customer_state
ORDER BY delayed_orders DESC;


/*
HIGH REVENUE LOW SATISFACTION SELLERS
Purpose: Identify sellers generating significant revenue while receiving poor customer feedback.
*/
SELECT 
    oi.seller_id,
    ROUND(SUM(oi.price), 2) AS revenue,
    ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM
    order_items oi
        JOIN
    orders o ON oi.order_id = o.order_id
        JOIN
    reviews r ON o.order_id = r.order_id
GROUP BY oi.seller_id
HAVING revenue > 100000
ORDER BY avg_review_score ASC;


/*
SELLER PERFORMANCE SCORECARD
Purpose: Build a seller-level operational risk profile.
Metrics Included:
1. Revenue
2. Delayed Orders
3. Average Review Score
*/
SELECT 
    oi.seller_id,
    ROUND(SUM(oi.price), 2) AS revenue,
    COUNT(DISTINCT oi.order_id) AS orders,
    SUM(CASE
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1
        ELSE 0
    END) AS delayed_orders,
    ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM
    order_items oi
        JOIN
    orders o ON oi.order_id = o.order_id
        LEFT JOIN
    reviews r ON o.order_id = r.order_id
GROUP BY oi.seller_id
HAVING revenue > 50000
ORDER BY revenue DESC;


/*
SELLER DELAY RATE
Purpose: Not all delayed orders create the same business risk.
KPI: Seller Delay Rate
*/
SELECT 
    oi.seller_id,
    COUNT(*) AS total_orders,
    SUM(CASE
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1
        ELSE 0
    END) AS delayed_orders,
    ROUND(SUM(CASE
                WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS delay_rate_pct
FROM
    order_items oi
        JOIN
    orders o ON oi.order_id = o.order_id
GROUP BY oi.seller_id
HAVING total_orders >= 50
ORDER BY delay_rate_pct DESC
LIMIT 25;

