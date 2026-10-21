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
