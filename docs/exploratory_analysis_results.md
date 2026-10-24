# Exploratory Analysis Results
## Revenue Leakage Detection in an E-Commerce Marketplace

---

# Executive Summary

The exploratory analysis was conducted to establish baseline marketplace characteristics before investigating revenue leakage.

The marketplace consists of approximately 99 thousand customers, 99 thousand orders, and more than 112 thousand order items across over 32 thousand products and 3 thousand sellers.

Key findings indicate strong customer satisfaction, significant marketplace growth throughout 2017 and 2018, and manageable freight costs. However, delivery delays and logistics costs may represent potential sources of revenue leakage.

---

# Marketplace Scale Assessment

## Customer and Order Volume

### Result

| Metric | Value |
|----------|----------:|
| Customers | 99,441 |
| Orders | 99,441 |

### Interpretation

The marketplace processed 99,441 orders from 99,441 customer records during the analysis period.

The one-to-one relationship suggests each order is associated with a unique customer identifier within the dataset structure.

---

## Product and Seller Ecosystem

### Result

| Metric | Value |
|----------|----------:|
| Products | 32,951 |
| Sellers | 3,095 |

### Interpretation

The marketplace has a diverse product catalogue containing more than 32 thousand products supported by over 3 thousand sellers.

This indicates a highly distributed marketplace environment rather than reliance on a small number of suppliers.

---

## Transaction Volume

### Result

| Metric | Value |
|----------|----------:|
| Order Items Sold | 112,650 |

### Interpretation

More than 112 thousand items were sold throughout the observed period.

The number of order items exceeds the number of orders, indicating that many customers purchased multiple products within the same transaction.

---

# Revenue Baseline Analysis

## Gross Merchandise Value (GMV)

### Result

| Metric | Value |
|----------|----------:|
| Total GMV | 13,591,643.70 |

### Interpretation

The marketplace generated approximately 13.59 million in product sales during the study period.

GMV serves as the baseline reference against which revenue leakage indicators will be evaluated.

---

## Total Freight Cost

### Result

| Metric | Value |
|----------|----------:|
| Freight Cost | 2,251,909.54 |

### Interpretation

The marketplace incurred more than 2.25 million in shipping-related expenses.

Freight costs represent a significant operational component of marketplace transactions.

---

## Freight Burden Ratio

### Result

| Metric | Value |
|----------|----------:|
| Freight Burden | 16.57% |

### Interpretation

Approximately 16.57% of every revenue unit generated is associated with freight expense.

While not necessarily problematic, this metric should be monitored because excessive fulfilment costs can contribute to operational revenue leakage.

---

# Revenue Trend Analysis

## Monthly GMV Trend

### Key Findings

The marketplace experienced substantial growth throughout 2017 and early 2018.

Peak sales periods include:

| Month | GMV |
|---------|---------:|
| November 2017 | 1,010,271.37 |
| March 2018 | 983,213.44 |
| April 2018 | 996,647.75 |
| May 2018 | 996,517.68 |

### Interpretation

Marketplace activity increased consistently over time, indicating successful growth and increased customer adoption.

November 2017 appears to represent a major seasonal sales event likely associated with promotional activity.

The sharp drop seen in September 2018 is expected because the dataset ends during October 2018.

---

# Product Category Performance

## Top Revenue Categories

| Category | Revenue |
|-----------|-----------:|
| beleza_saude | 1,258,681.34 |
| relogios_presentes | 1,205,005.68 |
| cama_mesa_banho | 1,036,988.68 |
| esporte_lazer | 988,048.97 |
| informatica_acessorios | 911,954.32 |
| moveis_decoracao | 729,762.49 |
| cool_stuff | 635,290.85 |
| utilidades_domesticas | 632,248.66 |
| automotivo | 592,720.11 |
| ferramentas_jardim | 485,256.46 |

### Interpretation

Revenue concentration is strongest in:

- Health & Beauty
- Watches & Gifts
- Home & Bath
- Sports & Leisure

These categories are strategically important because operational failures within them may have a disproportionately large effect on marketplace revenue.

---

# Seller Ecosystem Assessment

## Top Revenue Generating Sellers

| Seller ID | Revenue |
|------------|-----------:|
| 4869f7a5dfa277a7dca6462dcf3b52b2 | 229,472.63 |
| 53243585a1d6dc2643021fd1853d8905 | 222,776.05 |
| 4a3ca9315b744ce9f8e9374361493884 | 200,472.92 |
| fa1c13f2614d7b5c4749cbc52fecda94 | 194,042.03 |
| 7c67e1448b00f6e969d365cea6b010ab | 187,923.89 |

### Interpretation

A subset of sellers contributes disproportionately to marketplace revenue.

Future seller-risk analysis should evaluate whether these high-impact sellers are also associated with delays, cancellations, or poor customer reviews.

---

# Customer Satisfaction Assessment

## Average Review Score

### Result

| Metric | Value |
|----------|----------:|
| Average Review Score | 4.09 / 5 |

### Interpretation

Overall customer satisfaction appears relatively strong.

A score above 4 suggests that most customers had positive marketplace experiences.

---

## Review Distribution

| Score | Reviews |
|----------|---------:|
| 1 | 11,424 |
| 2 | 3,151 |
| 3 | 8,179 |
| 4 | 19,142 |
| 5 | 57,328 |

### Interpretation

Five-star reviews dominate the dataset.

However, more than 11 thousand one-star reviews represent a significant population requiring further investigation.

These negative experiences may reveal hidden operational issues contributing to future revenue leakage.

---

# Delivery Performance Assessment

## Late Deliveries

### Result

| Metric | Value |
|----------|----------:|
| Delivered Orders | 96,478 |
| Late Deliveries | 7,826 |

### Derived Delay Rate

Delay Rate:

```text
7,826 / 96,478 = 8.11%
```

### Interpretation

Approximately 8.11% of delivered orders arrived after the promised delivery date.

Delivery performance represents one of the strongest candidates for future revenue leakage investigation because delays can negatively affect customer satisfaction and repeat purchase behaviour.

---

# Key Business Insights

## Marketplace Scale

- Large marketplace ecosystem with over 99k orders.
- More than 3k sellers participate in operations.

## Revenue Performance

- Marketplace generated approximately 13.59 million in GMV.
- Revenue grew significantly between 2017 and 2018.

## Customer Experience

- Average review score remains strong at 4.09.
- More than 11k one-star reviews require deeper investigation.

## Delivery Performance

- 8.11% of delivered orders were delayed.
- Delivery delays are a potential operational risk.

## Potential Revenue Leakage Indicators

1. Delivery Delays (8.11%)
2. High Freight Burden (16.57%)
3. Concentrated Seller Revenue Exposure
4. Significant Volume of One-Star Reviews

---

# Conclusion

The exploratory analysis indicates a healthy and growing marketplace with strong customer satisfaction and substantial transaction volume.

However, delivery delays, freight costs, and customer dissatisfaction signals suggest several operational areas that may contribute to revenue leakage.

These findings provide the foundation for the next phase of analysis focused on quantifying and prioritising revenue leakage drivers.
