Revenue Leakage Detection in an E-Commerce Marketplace



Data Quality Report



Project: Revenue Leakage Detection in an E-Commerce Marketplace

Dataset: Olist Brazilian E-Commerce Dataset

Database: MySQL



1\. Dataset Overview

Table: Total Rows count



customers: 99,441

orders: 99,441

order\_items: 112,650

payments: 103,886

reviews: 99,224

products: 32,951

sellers: 3,095

geolocation: 1,000,163





2\. Primary Key Validation

* customers - totla\_raw(99441) = unique\_customer\_ids(99441)
* orders - totla\_raw(99441) = unique\_orders(99441)
* products - totla\_raw(32951) = unique\_products(32951)
* sellers - totla\_raw(3095) = unique\_sellers(3095)





3\. Relationship Validation

Validation performed: 

* Orders → Customers : Orphan Records: 0
* Order Items → Products : Missing Products: 0
* Order Items → Sellers : Missing Sellers: 0





4\. Missing Values Audit 

(i)Orders Table

Checked:

* customer\_id
* order\_status
* purchase\_timestamp
* estimated\_delivery\_date



Finding:

No material missing values detected.



(ii)Products Table

Missing values identified:

Column: Missing

product\_category\_name: 610

product\_name\_lenght: 610

product\_description\_lenght: 610

product\_weight\_g: 2



Interpretation:Some products contain incomplete metadata.

Impact:These records may affect category-level analysis.





5\. Date Validation

Dataset Period: from04 Sep 2016 to 17 Oct 2018

Validation Performed: Delivery date before purchase date



Result: No invalid records found





6\. Payment Validation



Checked: payment\_value

Finding: No negative payment values identified.



Result: Passed





7\. Pricing Validation



Checked:

* price
* freight\_value



Finding: No negative values identified.



Result: Passed





8\. Review Table Investigation

Initial Observation:

Rows = 99,224

Distinct Review IDs = 98,410

Difference: 814 records



Investigation Findings:



* Repeated review\_id values are associated
* with multiple order\_id values.



Conclusion: 

* review\_id should not be treated as a unique row identifier.
* The review table contains valid one-to-many review relationships.

 

Action: No rows removed.





9\. Known Dataset Limitations



The dataset does not contain:





* Product costs
* Marketplace commissions
* Returns data
* Refund amounts
* Marketing costs
* Profit figures



Therefore:

* True profit analysis is not possible.
* Revenue leakage must be evaluated through operational indicators such as:
* order cancellations
* unavailable orders
* delivery delays
* poor customer reviews
* freight inefficiencies



















