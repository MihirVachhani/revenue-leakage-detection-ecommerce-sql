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
