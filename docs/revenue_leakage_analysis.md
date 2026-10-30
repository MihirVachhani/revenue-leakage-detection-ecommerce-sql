# Revenue Leakage Analysis
## Revenue Leakage Detection in an E-Commerce Marketplace

---

# Objective

The purpose of this phase is to identify operational factors that may contribute to revenue leakage within the marketplace.

Because the dataset does not contain refunds, returns, commissions, or profit information, revenue leakage is evaluated using operational indicators that may prevent revenue realization or negatively influence future customer purchasing behaviour.

The analysis focuses on:

- Order Cancellations
- Unavailable Orders
- Delivery Delays
- Customer Experience Impact

---

# Section 1: Order Cancellation Analysis

## Related Business Question

BQ4

### Business Question

What percentage of marketplace orders are cancelled?

### Result

| Metric | Value |
|----------|----------:|
| Cancelled Orders | 625 |
| Cancellation Rate | 0.63% |

### Interpretation

Only 0.63% of marketplace orders were cancelled.

The cancellation rate appears relatively low and does not represent a major source of operational revenue leakage.

However, cancelled orders represent transactions where expected revenue was never realized.

---

# Section 2: Revenue Exposure from Cancellations

## Related Business Question

BQ4

### Business Question

How much revenue is associated with cancelled orders?

### Result

| Metric | Value |
|----------|----------:|
| Cancelled GMV | 95,235.27 |

### Interpretation

Approximately 95 thousand in product revenue was associated with cancelled orders.

Although the cancellation rate is small, these transactions represent unrealized revenue opportunities.

---

# Section 3: Unavailable Order Analysis

## Related Business Question

BQ5

### Business Question

What percentage of marketplace orders become unavailable?

### Result

| Metric | Value |
|----------|----------:|
| Unavailable Orders | 609 |
| Unavailable Rate | 0.61% |

### Interpretation

The unavailable order rate is similar to the cancellation rate and remains below 1%.

This suggests that inventory and seller availability problems are relatively limited.

---

# Section 4: Revenue Exposure from Unavailable Orders

## Related Business Question

BQ5

### Business Question

How much revenue is associated with unavailable orders?

### Result

| Metric | Value |
|----------|----------:|
| Unavailable GMV | 2,007.69 |

### Interpretation

Revenue exposure associated with unavailable orders is minimal compared to overall marketplace GMV.

This suggests inventory availability is not a primary driver of revenue leakage.

---

# Section 5: Delivery Delay Revenue Exposure

## Related Business Question

BQ7

### Business Question

How much revenue is associated with delayed deliveries?

### Result

| Metric | Value |
|----------|----------:|
| Delayed Order GMV | 1,158,920.51 |

### Interpretation

More than 1.15 million in marketplace revenue is associated with delayed deliveries.

This value is substantially larger than cancellation-related revenue exposure and indicates that delivery performance may represent a major operational risk area.

---

# Section 6: Customer Experience Impact of Delivery Delays

## Related Business Question

BQ12

### Business Question

Do delayed deliveries negatively affect customer satisfaction?

### Result

| Delivery Status | Average Review Score |
|-----------|-----------:|
| On-Time | 4.29 |
| Delayed | 2.57 |

### Interpretation

The impact of delivery delays on customer satisfaction is substantial.

Orders delivered on time achieve an average review score of 4.29.

Delayed deliveries achieve an average review score of only 2.57.

This represents a decline of approximately 40%.

The evidence strongly suggests that delivery delays contribute significantly to negative customer experiences and may influence future purchasing behaviour.

---

# Revenue Leakage Risk Assessment

## Risk Ranking

### High Risk

✅ Delivery Delays

Evidence:

- 1.15M GMV associated with delayed orders
- Significant reduction in customer satisfaction
- Direct impact on customer experience

---

### Medium Risk

✅ Order Cancellations

Evidence:

- 95K in revenue exposure
- Low occurrence rate
- Revenue not realized

---

### Low Risk

✅ Unavailable Orders

Evidence:

- 2K revenue exposure
- Minimal operational impact relative to marketplace scale

---

# Key Findings

1. Cancellation rates remain below 1%.
2. Unavailable orders have minimal revenue impact.
3. Delivery delays affect over 1.15M in revenue.
4. Delivery delays reduce average review scores from 4.29 to 2.57.
5. Delivery performance appears to be the most significant operational revenue leakage indicator identified so far.

---

# Preliminary Conclusion

Current evidence suggests that delivery performance represents the largest operational revenue leakage risk within the marketplace.

The next phase will investigate:

- Categories with the highest delay rates
- Sellers contributing most to delays
- Geographic delay hotspots
- Seller-level risk exposure

The objective is to identify where operational improvements can generate the greatest business benefit.
---

# Section 7: Product Categories Most Affected by Delivery Delays

## Related Business Question

BQ7

### Business Question

Which product categories are associated with the highest delayed revenue exposure?

### Result

| Category | Delayed Orders | Delayed Revenue |
|-----------|-----------:|-----------:|
| beleza_saude | 857 | 112,476.28 |
| relogios_presentes | 485 | 104,208.59 |
| cama_mesa_banho | 920 | 92,757.47 |
| esporte_lazer | 625 | 85,365.79 |
| informatica_acessorios | 594 | 73,859.49 |
| automotivo | 343 | 71,335.51 |
| moveis_decoracao | 688 | 68,801.03 |
| cool_stuff | 251 | 50,256.70 |
| utilidades_domesticas | 441 | 46,932.07 |
| bebes | 262 | 41,822.75 |

### Interpretation

Many of the marketplace's highest-revenue categories are also heavily represented within delayed deliveries.

Particularly concerning categories include:

- Health & Beauty
- Watches & Gifts
- Home & Bath
- Sports & Leisure

These categories generate substantial revenue and therefore expose the marketplace to a greater risk of customer dissatisfaction when delivery performance fails.

### Business Impact

Operational improvements in these categories could positively affect a large share of marketplace revenue.

---

# Section 8: Sellers Contributing Most to Delivery Delay Exposure

## Related Business Question

BQ8

### Business Question

Which sellers contribute most to delayed revenue exposure?

### Result

| Seller ID | Delayed Orders | Delayed Revenue |
|------------|-----------:|-----------:|
| 4869f7a5dfa277a7dca6462dcf3b52b2 | 133 | 26,853.80 |
| 4a3ca9315b744ce9f8e9374361493884 | 214 | 22,507.69 |
| b1b3948701c5c72445495bd161b83a4c | 9 | 17,999.91 |
| 7c67e1448b00f6e969d365cea6b010ab | 130 | 17,756.98 |
| fa1c13f2614d7b5c4749cbc52fecda94 | 59 | 16,104.40 |

### Interpretation

A relatively small number of sellers contribute disproportionately to delayed revenue exposure.

These sellers warrant further investigation because delivery failures associated with them can affect large amounts of marketplace revenue.

### Business Impact

Improving fulfilment performance among a handful of high-impact sellers could significantly reduce customer dissatisfaction.

---

# Section 9: Geographic Delivery Delay Hotspots

## Related Business Question

BQ9

### Business Question

Which geographic regions experience the largest number of delayed deliveries?

### Result

| State | Delayed Orders |
|----------|-----------:|
| SP | 2,387 |
| RJ | 1,664 |
| MG | 637 |
| BA | 457 |
| RS | 382 |
| SC | 346 |
| PR | 246 |
| ES | 244 |

### Interpretation

The highest number of delayed deliveries is concentrated within:

- São Paulo (SP)
- Rio de Janeiro (RJ)
- Minas Gerais (MG)

These states account for a significant portion of marketplace activity and therefore represent critical logistics regions.

### Business Impact

Operational improvements in these regions could produce an outsized reduction in delivery-related customer dissatisfaction.

---

# Section 10: High-Revenue Sellers with Customer Satisfaction Risks

## Related Business Question

BQ14

### Business Question

Are high-revenue sellers also associated with poor customer satisfaction?

### Result

| Seller ID | Revenue | Average Review Score |
|------------|-----------:|-----------:|
| 7c67e1448b00f6e969d365cea6b010ab | 188,017.85 | 3.35 |
| 4a3ca9315b744ce9f8e9374361493884 | 200,561.42 | 3.80 |
| 1025f0e2d44d7041d6cf58b6550e0bfa | 139,484.38 | 3.85 |
| 6560211a19b47992c3666cc44a7e94c0 | 122,484.82 | 3.91 |

### Interpretation

Several high-revenue sellers receive below-average customer ratings.

This is concerning because poor customer experiences associated with major revenue contributors can have a disproportionately large impact on marketplace reputation and repeat purchasing behaviour.

### Business Impact

These sellers represent priority candidates for operational review and performance improvement initiatives.

---

# Updated Revenue Leakage Risk Assessment

## Highest Risk Area

✅ Delivery Performance

Evidence:

- 1.15M revenue associated with delayed deliveries.
- Average review score falls from 4.29 to 2.57 when deliveries are delayed.
- Multiple high-value categories are affected.
- Delay hotspots exist across several major states.

---

## Emerging Seller Risk Indicators

Several high-revenue sellers exhibit:

- Elevated delivery delay exposure.
- Below-average customer review scores.
- Significant marketplace revenue influence.

These sellers will be analysed further through a dedicated Seller Risk Score Framework.

---

# Next Phase: Seller Risk Framework

The next stage of analysis will combine:

- Revenue Contribution
- Delivery Delay Rate
- Customer Satisfaction
- Order Volume

to create a Seller Risk Score.

This framework will classify sellers into:

- High Risk
- Medium Risk
- Low Risk

and quantify seller-level revenue leakage exposure throughout the marketplace.
---

# Section 11: Seller Delay Rate Analysis

## Related Business Question

BQ8

### Business Question

Which sellers experience the highest delivery delay rates?

### Result

| Seller ID | Total Orders | Delayed Orders | Delay Rate |
|------------|------------:|------------:|------------:|
| ede0c03645598cdfc63ca8237acbe73d | 50 | 16 | 32.00% |
| 54965bbe3e4f07ae045b90b0b8541f52 | 86 | 26 | 30.23% |
| 835f0f7810c76831d6c7d24c7a646d4d | 50 | 15 | 30.00% |
| 2a1348e9addc1af5aaa619b1a3679d6b | 55 | 15 | 27.27% |
| 6039e27294dc75811c0d8a39069f52c0 | 75 | 19 | 25.33% |

### Interpretation

Several sellers demonstrate delay rates exceeding 25%.

This means more than one quarter of customer orders associated with these sellers arrive later than promised.

Such fulfilment performance creates elevated operational risk because customer satisfaction has already been shown to decline significantly when deliveries are delayed.

These sellers should be prioritised for operational investigation.

---

# Section 12: Seller Risk Framework

## Related Business Questions

- BQ14
- BQ15

### Business Objective

Not all sellers contribute equally to marketplace risk.

A seller generating significant revenue while simultaneously:

- Delivering orders late
- Receiving poor customer reviews
- Creating customer dissatisfaction

represents a much greater risk than a low-revenue seller with identical performance issues.

To prioritise intervention efforts, a Seller Risk Framework was developed.

---

## Risk Factors Evaluated

### Revenue Impact

Measures how much marketplace revenue depends on a seller.

### Delivery Performance

Measures the percentage of delayed orders.

### Customer Satisfaction

Measured using average review score.

---

## Risk Logic

### High Risk Seller

Review Score < 4.0

AND

Delay Rate > 15%

### Medium Risk Seller

Review Score between 4.0 and 4.2

OR

Delay Rate between 10% and 15%

### Low Risk Seller

Review Score > 4.2

AND

Delay Rate < 10%

### Interpretation

The framework enables sellers to be evaluated using operational performance rather than revenue alone.

This approach helps identify sellers whose behaviour may negatively impact customer satisfaction and future revenue generation.

---

# Section 13: Seller Risk Score Dataset

## Related Business Questions

- BQ14
- BQ15

### Business Question

Which sellers combine high revenue contribution, poor delivery performance, and weak customer satisfaction?

### Result

Top Seller Risk Indicators:

| Seller ID | Revenue | Delay Rate | Avg Review Score |
|------------|-----------:|-----------:|-----------:|
| 4a3ca9315b744ce9f8e9374361493884 | 202,999.12 | 11.96% | 3.80 |
| 7c67e1448b00f6e969d365cea6b010ab | 189,417.67 | 13.34% | 3.35 |
| 1025f0e2d44d7041d6cf58b6550e0bfa | 140,513.14 | 14.32% | 3.85 |
| 6560211a19b47992c3666cc44a7e94c0 | 123,585.82 | 6.74% | 3.91 |

### Interpretation

Some of the marketplace's largest revenue contributors also receive below-average customer ratings.

These sellers create elevated operational risk because performance issues affect a larger volume of marketplace revenue.

---

# Section 14: High-Risk Seller Identification

## Related Business Question

BQ15

### Business Question

Which sellers exhibit both poor customer satisfaction and high delivery delay rates?

### High-Risk Seller Criteria

- Review Score < 4.0
- Delay Rate > 15%

### Result

| Seller ID | Revenue | Review Score | Delay Rate |
|------------|-----------:|-----------:|-----------:|
| 8160255418d5aaa7dbdc9f4c64ebda44 | 47,297.39 | 3.84 | 19.74% |
| 712e6ed8aa4aa1fa65dab41fed5737e4 | 39,907.00 | 3.46 | 22.78% |
| e9bc59e7b60fc3063eb2290deda4cced | 34,343.06 | 3.94 | 15.28% |
| 88460e8ebdecbfecb5f9601833981930 | 32,410.65 | 3.35 | 23.79% |

### Interpretation

These sellers display both poor fulfilment performance and reduced customer satisfaction.

The combination suggests a heightened risk of future revenue loss through customer dissatisfaction and negative marketplace perception.

---

# Section 15: Revenue Exposure from High-Risk Sellers

## Related Business Question

BQ15

### Business Question

How much marketplace revenue is associated with high-risk sellers?

### Result

| Metric | Value |
|----------|----------:|
| High-Risk Sellers | 308 |
| Revenue At Risk | 1,019,168.93 |

### Interpretation

The marketplace contains 308 sellers classified as high risk.

Together these sellers account for over 1 million in revenue exposure.

This indicates that seller-related operational issues represent a meaningful source of potential revenue leakage.

---

# Section 16: High-Risk Sellers by Revenue Impact

## Related Business Question

BQ15

### Business Question

Which high-risk sellers have the greatest financial impact?

### Result

Top High-Risk Sellers:

| Seller ID | Revenue |
|------------|-----------:|
| 8160255418d5aaa7dbdc9f4c64ebda44 | 47,297.39 |
| 712e6ed8aa4aa1fa65dab41fed5737e4 | 39,907.00 |
| e9bc59e7b60fc3063eb2290deda4cced | 34,343.06 |
| 88460e8ebdecbfecb5f9601833981930 | 32,410.65 |

### Interpretation

A relatively small group of sellers contributes disproportionate operational risk.

Targeted interventions among these sellers could provide an efficient method for reducing revenue leakage exposure.

---

# Section 17: Revenue Leakage Exposure by Product Category

## Related Business Question

BQ7

### Business Question

Which product categories contribute most to delayed revenue exposure?

### Result

Top Categories:

| Category | Delayed Revenue |
|----------|-----------:|
| beleza_saude | 112,476.28 |
| relogios_presentes | 104,208.59 |
| cama_mesa_banho | 92,757.47 |
| esporte_lazer | 85,365.79 |
| informatica_acessorios | 73,859.49 |

### Interpretation

Revenue leakage is concentrated among several high-performing product categories.

Improving delivery reliability in these categories may provide the largest operational benefit.

---

# Section 18: Geographic Revenue Exposure

## Related Business Question

BQ9

### Business Question

Which states contribute most to delayed revenue exposure?

### Result

| State | Delayed Revenue |
|----------|-----------:|
| SP | 342,232.40 |
| RJ | 238,881.29 |
| MG | 91,870.72 |
| BA | 71,874.01 |
| RS | 53,403.81 |

### Interpretation

The largest delayed-revenue exposure is concentrated within São Paulo and Rio de Janeiro.

These regions should be prioritised when investigating logistics-related operational improvements.

---

# Section 19: Marketplace Risk Summary

## Executive Risk Metrics

| Metric | Value |
|----------|----------:|
| Cancelled Orders | 625 |
| Unavailable Orders | 609 |
| Delayed Orders | 7,826 |

### Interpretation

Delayed deliveries occur significantly more frequently than cancellations or unavailable orders.

This reinforces earlier findings that delivery performance is the primary operational risk area.

---

# Section 20: Executive Revenue Leakage Dataset

## Result

| Leakage Source | Revenue Exposure |
|----------|----------:|
| Cancelled Revenue | 95,235.27 |
| Unavailable Revenue | 2,007.69 |
| Delayed Revenue | 1,158,920.51 |

### Interpretation

Delayed deliveries account for the vast majority of identified revenue exposure.

---

# Section 21: Revenue Leakage Mix Analysis

## Business Question

Which issue contributes most to overall revenue leakage exposure?

### Result

| Leakage Type | Revenue | Contribution |
|----------|----------:|----------:|
| Delayed Revenue | 1,158,920.51 | 92.26% |
| Cancelled Revenue | 95,235.27 | 7.58% |
| Unavailable Revenue | 2,007.69 | 0.16% |

### Interpretation

Over 92% of all identified revenue leakage exposure is linked to delayed deliveries.

This is the strongest evidence in the analysis and clearly identifies delivery performance as the dominant operational risk.

---

# Section 22: Delayed Revenue Concentration

## Business Question

Is delayed revenue concentrated within a small number of categories?

### Result

Top categories account for a significant share of delayed revenue exposure.

Leading categories include:

- Health & Beauty
- Watches & Gifts
- Home & Bath
- Sports & Leisure
- Electronics Accessories

### Interpretation

Operational improvements targeted at a small number of categories could substantially reduce delayed revenue exposure.

---

# Section 23: Revenue At Risk vs Total GMV

## Business Question

What percentage of marketplace revenue is operationally at risk?

### Result

| Metric | Value |
|----------|----------:|
| Revenue At Risk | 1,158,920.51 |
| Total GMV | 13,591,643.70 |
| GMV At Risk | 8.53% |

### Interpretation

More than 8.5% of marketplace revenue is associated with delayed deliveries.

This indicates a meaningful level of operational risk exposure.

---

# Section 24: Executive Revenue Leakage Scorecard

## Marketplace Summary

| KPI | Value |
|----------|----------:|
| Total Orders | 99,441 |
| Total Sellers | 3,095 |
| Total GMV | 13,591,643.70 |
| Freight Cost | 2,251,909.54 |
| Cancelled Orders | 625 |
| Unavailable Orders | 609 |
| Delayed Orders | 7,826 |
| Average Review Score | 4.09 |

---

# Final Revenue Leakage Assessment

## Key Findings

1. Delivery delays account for 92.26% of all identified revenue leakage exposure.
2. Delayed deliveries are associated with 1.16 million in revenue exposure.
3. Customer satisfaction declines from 4.29 to 2.57 when deliveries are delayed.
4. 8.53% of total marketplace GMV is exposed to delivery-performance risk.
5. 308 sellers qualify as high-risk sellers under the Seller Risk Framework.
6. High-risk sellers represent over 1 million in revenue exposure.
7. Revenue leakage is concentrated among a relatively small number of categories, sellers, and geographic regions.

---

# Final Conclusion

The analysis demonstrates that delivery performance is the single largest operational driver of revenue leakage within the marketplace.

While cancellations and unavailable orders contribute some revenue exposure, their impact is relatively small when compared to delayed deliveries.

The Seller Risk Framework further reveals that a subset of sellers account for a disproportionate share of operational risk.

Future business improvement initiatives should prioritise:

- Delivery performance optimisation
- Seller performance monitoring
- Logistics improvements in high-risk states
- Operational controls for high-risk sellers

Addressing these areas would likely improve customer satisfaction, reduce operational inefficiencies, and protect future marketplace revenue.
