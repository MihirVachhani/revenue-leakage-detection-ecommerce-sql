/*
EXPLORATORY BUSINESS ANALYSIS
Revenue Leakage Detection in an E-Commerce Marketplace

This analysis establishes baseline metrics relating to:

1. Marketplace Scale
2. Revenue Performance
3. Seller Ecosystem
4. Customer Satisfaction
5. Delivery Performance

These insights provide context for KPI evaluation and later leakage analysis.
*/


/*
MARKETPLACE SCALE 

Business Purpose:
Understand the size of the marketplace ecosystem.

Metrics:
- Total Customers
- Total Orders

Business Value:
Provides context for all future KPI calculations.

*/

SELECT
    COUNT(DISTINCT customer_id) AS customers,
    COUNT(DISTINCT order_id) AS orders
FROM orders;



/*
PRODUCT AND SELLER ECOSYSTEM

Business Purpose:
Understand supply-side marketplace participation.

Metrics:
- Total Products
- Total Sellers
*/

SELECT
    (SELECT COUNT(*) FROM products) AS products,
    (SELECT COUNT(*) FROM sellers) AS sellers;



/*
TRANSACTION VOLUME 

Business Purpose:
Measure total marketplace transaction activity.

Metric:
- Total Order Items Sold
*/

SELECT
    COUNT(*) AS total_order_items
FROM order_items;



/*
REVENUE BASELINE ANALYSIS

Related Business Question:
BQ1

Business Question:
What is the total Gross Merchandise Value generated
by the marketplace?

KPI:
Gross Merchandise Value (GMV)

Logic:
GMV = SUM(price)
*/

SELECT
    ROUND(SUM(price), 2) AS total_gmv
FROM order_items;



/*
FREIGHT COST ANALYSIS

Business Purpose:
Measure total shipping costs incurred by marketplace orders.

Related KPI:
Total Freight Cost
*/

SELECT
    ROUND(SUM(freight_value), 2) AS total_freight_cost
FROM order_items;



/*
FREIGHT BURDEN ANALYSIS

Business Purpose:
Measure shipping cost relative to product revenue.

Related KPI:
Freight Burden Ratio

Formula:
SUM(freight_value) / SUM(price)
*/

SELECT
ROUND(
    SUM(freight_value) /
    SUM(price) * 100,
    2
) AS freight_burden_pct
FROM order_items;



/*
MONTHLY REVENUE TREND

Related Business Question:
BQ2

Business Purpose:
Analyse revenue growth and identify trends over time.

KPI:
Monthly GMV
*/

SELECT
    DATE_FORMAT(
        o.order_purchase_timestamp,
        '%Y-%m'
    ) AS order_month,

    ROUND(
        SUM(oi.price),
        2
    ) AS monthly_gmv

FROM orders o

JOIN order_items oi
    ON o.order_id = oi.order_id

GROUP BY order_month

ORDER BY order_month;



/*
CATEGORY PERFORMANCE ANALYSIS

Related Business Question:
BQ3

Business Purpose:
Identify revenue-driving product categories.

KPI:
Revenue by Category
*/

SELECT
    p.product_category_name,

    ROUND(
        SUM(oi.price),
        2
    ) AS revenue

FROM order_items oi

JOIN products p
    ON oi.product_id = p.product_id

GROUP BY p.product_category_name

ORDER BY revenue DESC

LIMIT 10;



/*
SELLER REVENUE ANALYSIS

Related Business Question:
BQ13

Business Purpose:
Identify top revenue-generating sellers.

KPI:
Seller GMV

*/

SELECT
    seller_id,

    ROUND(
        SUM(price),
        2
    ) AS seller_revenue

FROM order_items

GROUP BY seller_id

ORDER BY seller_revenue DESC

LIMIT 10;



/*
CUSTOMER SATISFACTION BASELINE

Related Business Question:
BQ10

Business Purpose:
Measure overall marketplace customer satisfaction.

KPI:
Average Review Score
*/

SELECT
    ROUND(
        AVG(review_score),
        2
    ) AS average_review_score
FROM reviews;



/*
REVIEW SCORE DISTRIBUTION

Business Purpose:
Understand customer sentiment distribution.

Related Business Question:
BQ10
*/

SELECT
    review_score,
    COUNT(*) AS review_count

FROM reviews

GROUP BY review_score

ORDER BY review_score;



/*
DELIVERY PERFORMANCE BASELINE

Related Business Question:
BQ7

Business Purpose:
Identify how frequently deliveries occur after
the promised delivery date.

KPI:
Delivery Delay Rate
*/

SELECT

    COUNT(*) AS delivered_orders,

    SUM(
        CASE
            WHEN order_delivered_customer_date >
                 order_estimated_delivery_date
            THEN 1
            ELSE 0
        END
    ) AS late_deliveries

FROM orders

WHERE order_status = 'delivered';