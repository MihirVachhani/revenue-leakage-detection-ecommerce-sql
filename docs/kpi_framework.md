# KPI Framework
## Revenue Leakage Detection in an E-Commerce Marketplace

### Project Objective

The objective of this project is to identify operational and customer-related factors that may contribute to revenue leakage within a multi-seller e-commerce marketplace.

Because the dataset does not contain cost, refund, commission, or profitability information, revenue leakage is evaluated through operational indicators such as order cancellations, unavailable products, delivery delays, freight burden, and customer satisfaction.

---

# KPI 1: Gross Merchandise Value (GMV)

## Business Definition

Total value of products sold through the marketplace.

GMV represents the total transaction volume handled by the platform before any deductions or operational costs.

## Business Importance

GMV is the primary measure of marketplace activity and commercial performance.

It serves as the baseline against which revenue leakage indicators will be evaluated.

## Tables Used

### order_items

Reason:

Each row represents an item sold within an order and contains the product selling price.

## Columns Used

- price

## Calculation Logic

GMV = SUM(price)

## SQL Concepts

- SUM()
- Aggregation

## Stakeholders

- Executive Leadership
- Marketplace Operations

---
# KPI 3: Freight Burden Ratio

## Business Definition

The proportion of shipping cost relative to product revenue.

## Business Importance

A high freight burden suggests inefficient fulfilment economics and potential revenue leakage.

## Tables Used

### order_items

## Columns Used

- price
- freight_value

## Calculation Logic

Freight Burden Ratio =
SUM(freight_value)
/
SUM(price)

## Interpretation

Higher values indicate greater operational expenses relative to sales value.

## Stakeholders

- Operations
- Finance
- Executive Leadership

---

# KPI 4: Cancellation Rate

## Business Definition

Percentage of total orders that were cancelled before fulfilment.

## Business Importance

Cancelled orders represent unrealized marketplace revenue and customer dissatisfaction.

## Tables Used

### orders

Reason:

Order status is tracked in the orders table.

## Columns Used

- order_status

## Calculation Logic

Cancellation Rate =
Cancelled Orders
/
Total Orders

Where:

order_status = 'canceled'

## Stakeholders

- Marketplace Operations
- Executive Leadership

---

# KPI 5: Unavailable Order Rate

## Business Definition

Percentage of orders marked as unavailable.

## Business Importance

Unavailable orders indicate inventory, supply chain, or seller-related failures.

## Tables Used

### orders

## Columns Used

- order_status

## Calculation Logic

Unavailable Rate =
Unavailable Orders
/
Total Orders

Where:

order_status = 'unavailable'

## Stakeholders

- Seller Performance Team
- Operations Team

---

# KPI 6: Delivery Delay Rate

## Business Definition

Percentage of delivered orders that arrived after the estimated delivery date.

## Business Importance

Late deliveries negatively impact customer experience and may contribute indirectly to future revenue loss.

## Tables Used

### orders

Reason:

Both actual delivery and promised delivery dates exist in this table.

## Columns Used

- order_delivered_customer_date
- order_estimated_delivery_date

## Calculation Logic

Late Deliveries
/
Delivered Orders

Where:

actual delivery date > estimated delivery date

## Stakeholders

- Logistics
- Operations
- Customer Experience Team

---
