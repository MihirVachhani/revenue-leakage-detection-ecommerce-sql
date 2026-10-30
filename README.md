# Revenue Leakage Detection in an E-Commerce Marketplace

## Project Overview

This project investigates operational factors that may contribute to revenue leakage within a multi-seller e-commerce marketplace.

Using the Olist Brazilian E-Commerce Dataset, the project combines SQL-based analysis, KPI development, seller risk assessment, and stakeholder-focused reporting to identify operational inefficiencies that may negatively impact marketplace performance.

Rather than focusing solely on revenue generation, this project investigates:

- Order Cancellations
- Unavailable Orders
- Delivery Delays
- Freight Cost Burden
- Customer Satisfaction Risks
- Seller Performance Issues
- Revenue Leakage Exposure
- Operational Risk Concentration

The objective is to identify hidden operational risks and quantify their potential business impact.

---

# Business Problem

The marketplace processes thousands of customer orders through multiple independent sellers.

While overall revenue growth is important, operational inefficiencies such as delayed deliveries, order cancellations, poor seller performance, and customer dissatisfaction may create hidden forms of revenue leakage.

This project seeks to answer:

> Which operational factors create the greatest revenue leakage risk within the marketplace?

---

# Dataset

### Source

Olist Brazilian E-Commerce Public Dataset

### Dataset Includes

- Customers
- Orders
- Order Items
- Products
- Sellers
- Payments
- Reviews
- Geolocation
- Product Category Translation

### Dataset Scale

| Entity | Records |
|----------|----------:|
| Customers | 99,441 |
| Orders | 99,441 |
| Order Items | 112,650 |
| Products | 32,951 |
| Sellers | 3,095 |
| Reviews | 100,000+ |
| Payments | 103,886 |

---

# Technology Stack

- MySQL
- SQL
- Python
- Jupyter Notebook
- Power BI (Upcoming)
- Git
- GitHub

---

# Project Structure

```text
Revenue-Leakage-SQL-Project

├── assets
│   └── images
│
├── data
│
├── docs
│   ├── business_questions.md
│   ├── data_quality_report.md
│   ├── exploratory_analysis.md
│   ├── exploratory_analysis_results.md
│   ├── kpi_framework.md
│   ├── revenue_leakage_analysis.md
│   └── project_summary.md
│
├── notebooks
│   └── database_setup.ipynb
│
├── sql
│   ├── 01_data_quality_checks.sql
│   ├── 02_exploratory_analysis.sql
│   └── 03_revenue_leakage_analysis.sql
│
└── README.md
```

---

# Project Roadmap

## Phase 1 — Business Understanding

✅ Problem Definition

✅ Stakeholder Identification

✅ Success Criteria

---

## Phase 2 — Database Preparation

✅ Database Creation

✅ Data Loading

✅ Data Modelling

✅ Schema Validation

---

## Phase 3 — Data Quality Assessment

✅ Record Count Validation

✅ Missing Value Analysis

✅ Duplicate Detection

✅ Referential Integrity Verification

✅ Data Quality Report

---

## Phase 4 — KPI Framework Development

✅ KPI Identification

✅ Stakeholder Mapping

✅ Business Question Framework

✅ Metric Definitions

---

## Phase 5 — Exploratory Business Analysis

✅ Marketplace Scale Assessment

✅ Revenue Baseline Analysis

✅ Category Performance Analysis

✅ Seller Ecosystem Analysis

✅ Customer Satisfaction Assessment

✅ Delivery Performance Assessment

---

## Phase 6 — Revenue Leakage Analysis

✅ Cancellation Analysis

✅ Unavailable Order Analysis

✅ Delivery Delay Analysis

✅ Customer Experience Analysis

✅ Geographic Risk Analysis

✅ Product Category Risk Analysis

✅ Seller Risk Framework

✅ Revenue Exposure Assessment

✅ Executive Leakage Scorecard

---

## Phase 7 — Power BI Dashboard Development

⏳ Upcoming

Planned Dashboard Pages:

- Executive Summary
- Revenue Leakage Overview
- Delivery Performance Analysis
- Seller Risk Framework
- Customer Experience Analysis

---

## Phase 8 — Executive Reporting

⏳ Upcoming

Deliverables:

- Executive Business Presentation
- Power BI Dashboard
- Final Business Recommendations

---

# Key Marketplace Metrics

## Marketplace Scale

| KPI | Value |
|----------|----------:|
| Customers | 99,441 |
| Orders | 99,441 |
| Sellers | 3,095 |
| Products | 32,951 |
| Order Items | 112,650 |

---

## Revenue Metrics

| KPI | Value |
|----------|----------:|
| Total GMV | 13,591,643.70 |
| Freight Cost | 2,251,909.54 |
| Freight Burden | 16.57% |

---

## Customer Satisfaction

| KPI | Value |
|----------|----------:|
| Average Review Score | 4.09 |

---

## Delivery Performance

| KPI | Value |
|----------|----------:|
| Delivered Orders | 96,478 |
| Delayed Orders | 7,826 |
| Delay Rate | 8.11% |

---

# Revenue Leakage Findings

## Revenue Exposure by Leakage Type

| Leakage Source | Revenue Exposure | Contribution |
|----------|----------:|----------:|
| Delayed Deliveries | 1,158,920.51 | 92.26% |
| Cancelled Orders | 95,235.27 | 7.58% |
| Unavailable Orders | 2,007.69 | 0.16% |

### Key Insight

Delivery delays account for over 92% of identified revenue leakage exposure.

---

## Customer Experience Impact

| Delivery Status | Average Review Score |
|----------|----------:|
| On-Time | 4.29 |
| Delayed | 2.57 |

### Key Insight

Delayed deliveries reduce average customer review scores by approximately 40%.

---

## Revenue at Risk

| KPI | Value |
|----------|----------:|
| Revenue at Risk | 1,158,920.51 |
| Total GMV | 13,591,643.70 |
| GMV at Risk | 8.53% |

### Key Insight

More than 8.5% of marketplace revenue is associated with delayed deliveries.

---

## Seller Risk Framework

### High-Risk Seller Criteria

- Review Score < 4.0
- Delay Rate > 15%

### Results

| KPI | Value |
|----------|----------:|
| High-Risk Sellers | 308 |
| Revenue at Risk | 1,019,168.93 |

### Key Insight

A relatively small group of sellers generates a substantial share of operational risk.

---

# Business Recommendations

## 1. Prioritise Delivery Performance

Since delayed deliveries account for over 92% of identified revenue leakage exposure, operational improvement efforts should focus on logistics performance.

## 2. Monitor High-Risk Sellers

Implement seller performance monitoring for:

- Review Scores
- Delay Rates
- Revenue Exposure

## 3. Focus on High-Risk Categories

Target improvements within:

- Health & Beauty
- Watches & Gifts
- Home & Bath
- Sports & Leisure

## 4. Improve Logistics in Key States

Prioritise:

- São Paulo (SP)
- Rio de Janeiro (RJ)
- Minas Gerais (MG)

---

# Repository Status

## Current Status

✅ SQL Analysis Complete

✅ Documentation Complete

⏳ Power BI Dashboard Development

⏳ Executive Presentation

---

# Author

**Mihir R. Vachhani**

Aspiring Data Analyst | SQL | Python | Power BI

GitHub Portfolio Project: Revenue Leakage Detection in an E-Commerce Marketplace
