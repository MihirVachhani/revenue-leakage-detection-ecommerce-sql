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


/*
SELLER RISK SCORE DATASET
Purpose: Combine revenue, review score and delay rate into one seller performance view.
*/
SELECT 
    oi.seller_id,
    ROUND(SUM(oi.price), 2) AS revenue,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(CASE
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1
        ELSE 0
    END) AS delayed_orders,
    ROUND(SUM(CASE
                WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1
                ELSE 0
            END) * 100.0 / COUNT(DISTINCT oi.order_id),
            2) AS delay_rate_pct,
    ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM
    order_items oi
        JOIN
    orders o ON oi.order_id = o.order_id
        LEFT JOIN
    reviews r ON o.order_id = r.order_id
GROUP BY oi.seller_id
HAVING total_orders >= 50
ORDER BY revenue DESC;


/*
HIGH-RISK SELLER IDENTIFICATION
Definition: High Risk Seller: Review Score < 4.0 AND Delay Rate > 15%
Purpose: Identify sellers creating operational and customer experience risks.
*/
WITH seller_metrics AS (
    SELECT 
        oi.seller_id,
        ROUND(SUM(oi.price), 2) AS revenue,
        ROUND(AVG(r.review_score), 2) AS review_score,
        ROUND(
            SUM(
                CASE 
                    WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 
                    ELSE 0 
                END
            ) * 100.0 / COUNT(DISTINCT oi.order_id), 
            2
        ) AS delay_rate
    FROM order_items AS oi
    JOIN orders AS o 
        ON oi.order_id = o.order_id
    LEFT JOIN reviews AS r 
        ON o.order_id = r.order_id
    GROUP BY 
        oi.seller_id
)
SELECT 
    seller_id,
    revenue,
    review_score,
    delay_rate
FROM seller_metrics
WHERE review_score < 4
  AND delay_rate > 15
ORDER BY 
    revenue DESC;


/*
REVENUE EXPOSURE FROM HIGH-RISK SELLERS
Purpose:Quantify potential revenue exposure linked to sellers showing poor customer satisfaction and high delay rates.
Risk Definition: Review Score < 4 AND Delay Rate > 15
*/
WITH seller_metrics AS (
    SELECT 
        oi.seller_id,
        ROUND(SUM(oi.price), 2) AS revenue,
        ROUND(AVG(r.review_score), 2) AS review_score,
        ROUND(
            SUM(
                CASE 
                    WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 
                    ELSE 0 
                END
            ) * 100.0 / COUNT(DISTINCT oi.order_id), 
            2
        ) AS delay_rate
    FROM order_items AS oi
    JOIN orders AS o 
        ON oi.order_id = o.order_id
    LEFT JOIN reviews AS r 
        ON o.order_id = r.order_id
    GROUP BY 
        oi.seller_id
)
SELECT 
    COUNT(*) AS high_risk_sellers,
    ROUND(SUM(revenue), 2) AS revenue_at_risk
FROM seller_metrics
WHERE review_score < 4
  AND delay_rate > 15;


/*
HIGH-RISK SELLERS BY REVENUE
Purpose: Identify which risky sellers have the largest financial impact on the marketplace.
*/
WITH seller_metrics AS (
    SELECT 
        oi.seller_id,
        ROUND(SUM(oi.price), 2) AS revenue,
        ROUND(AVG(r.review_score), 2) AS review_score,
        ROUND(
            SUM(
                CASE 
                    WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 
                    ELSE 0 
                END
            ) * 100.0 / COUNT(DISTINCT oi.order_id), 
            2
        ) AS delay_rate
    FROM order_items AS oi
    JOIN orders AS o 
        ON oi.order_id = o.order_id
    LEFT JOIN reviews AS r 
        ON o.order_id = r.order_id
    GROUP BY 
        oi.seller_id
)
SELECT 
    seller_id,
    revenue,
    review_score,
    delay_rate
FROM seller_metrics
WHERE review_score < 4
  AND delay_rate > 15
ORDER BY 
    revenue DESC
LIMIT 20;


/*
REVENUE LEAKAGE EXPOSURE BY CATEGORY
Business Purpose: Identify categories contributing most to operational risk.
Includes: Delayed Deliveries
*/
SELECT 
    p.product_category_name,
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
ORDER BY delayed_revenue DESC;


/*
GEOGRAPHIC REVENUE EXPOSURE
Purpose: Determine which customer states are associated with the largest amount of delayed revenue.
*/
SELECT 
    c.customer_state, ROUND(SUM(oi.price), 2) AS delayed_revenue
FROM
    orders o
        JOIN
    customers c ON o.customer_id = c.customer_id
        JOIN
    order_items oi ON o.order_id = oi.order_id
WHERE
    o.order_status = 'delivered'
        AND o.order_delivered_customer_date > o.order_estimated_delivery_date
GROUP BY c.customer_state
ORDER BY delayed_revenue DESC;


/*
MARKETPLACE RISK SUMMARY
Purpose: Create executive-level summary metrics.
These KPIs will useful later in Power BI.
*/
SELECT 
    (SELECT 
            COUNT(*)
        FROM
            orders
        WHERE
            order_status = 'canceled') AS cancelled_orders,
    (SELECT 
            COUNT(*)
        FROM
            orders
        WHERE
            order_status = 'unavailable') AS unavailable_orders,
    (SELECT 
            SUM(CASE
                    WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1
                    ELSE 0
                END)
        FROM
            orders
        WHERE
            order_status = 'delivered') AS delayed_orders;
            
            
/*
EXECUTIVE REVENUE LEAKAGE DATASET
Purpose: Generate all core business metrics required for the executive dashboard.
*/
SELECT 
    'Cancelled Revenue' AS leakage_type,
    ROUND(SUM(oi.price), 2) AS revenue_exposure
FROM
    orders o
        JOIN
    order_items oi ON o.order_id = oi.order_id
WHERE
    o.order_status = 'canceled' 
UNION ALL SELECT 
    'Unavailable Revenue', ROUND(SUM(oi.price), 2)
FROM
    orders o
        JOIN
    order_items oi ON o.order_id = oi.order_id
WHERE
    o.order_status = 'unavailable' 
UNION ALL SELECT 
    'Delayed Revenue', ROUND(SUM(oi.price), 2)
FROM
    orders o
        JOIN
    order_items oi ON o.order_id = oi.order_id
WHERE
    o.order_status = 'delivered'
        AND o.order_delivered_customer_date > o.order_estimated_delivery_date;
        
        
/*
REVENUE LEAKAGE MIX ANALYSIS
Purpose: Executive teams need to understand where improvement efforts should be prioritised.
*/
WITH leakage_sources AS (
    SELECT 
        'Cancelled Revenue' AS leakage_type,
        SUM(oi.price) AS revenue
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'canceled'
    UNION ALL
    SELECT 
        'Unavailable Revenue' AS leakage_type,
        SUM(oi.price) AS revenue
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'unavailable'
    UNION ALL
    SELECT 
        'Delayed Revenue' AS leakage_type,
        SUM(oi.price) AS revenue
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
      AND o.order_delivered_customer_date > o.order_estimated_delivery_date
)
SELECT 
    leakage_type,
    ROUND(revenue, 2) AS revenue,
    ROUND(
        revenue * 100.0 / SUM(revenue) OVER (), 
        2
    ) AS leakage_contribution_pct
FROM leakage_sources
ORDER BY 
    revenue DESC;


/*
DELAYED REVENUE CONCENTRATION
Purpose: Identify categories responsible for the majority of delayed-revenue exposure.
*/
SELECT 
    p.product_category_name,
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
LIMIT 20;


/*
REVENUE AT RISK VS TOTAL GMV
Purpose: Determine what percentage of total marketplace revenue is exposed to operational risk.
*/
WITH risk_revenue AS (
    SELECT 
        SUM(oi.price) AS delayed_revenue
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
      AND o.order_delivered_customer_date > o.order_estimated_delivery_date
)
SELECT 
    ROUND((SELECT delayed_revenue FROM risk_revenue), 2) AS revenue_at_risk,
    ROUND(SUM(price), 2) AS total_gmv,
    ROUND(
        (SELECT delayed_revenue FROM risk_revenue) * 100.0 / SUM(price), 
        2
    ) AS pct_gmv_at_risk
FROM order_items;



/*
EXECUTIVE REVENUE LEAKAGE SCORECARD
Purpose: Generate one-table executive summary for Power BI KPI cards.
*/
SELECT 
    (SELECT 
            COUNT(*)
        FROM
            orders) AS total_orders,
    (SELECT 
            COUNT(*)
        FROM
            sellers) AS total_sellers,
    (SELECT 
            ROUND(SUM(price), 2)
        FROM
            order_items) AS total_gmv,
    (SELECT 
            ROUND(SUM(freight_value), 2)
        FROM
            order_items) AS freight_cost,
    (SELECT 
            COUNT(*)
        FROM
            orders
        WHERE
            order_status = 'canceled') AS cancelled_orders,
    (SELECT 
            COUNT(*)
        FROM
            orders
        WHERE
            order_status = 'unavailable') AS unavailable_orders,
    (SELECT 
            SUM(CASE
                    WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1
                    ELSE 0
                END)
        FROM
            orders
        WHERE
            order_status = 'delivered') AS delayed_orders,
    (SELECT 
            ROUND(AVG(review_score), 2)
        FROM
            reviews) AS avg_review_score;
