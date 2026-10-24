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
