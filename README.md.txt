# Northwind Traders – Inactive Customers Analysis (Dual Query Project)

## Overview
This project contains **two separate analyses** performed on the Northwind Traders dataset, focusing on customer inactivity and churn risk. The first identifies customers who have never placed an order, and the second identifies customers whose last order (simulated to present-day) was more than 12 months ago.

---

## Project 1 – Completely Inactive Customers

### 1. Description
Identifies customers in the Northwind dataset who have **never placed an order**. Date shifting is applied to simulate present-day scenarios for realism.

### 2. Dataset Info
- **Dataset**: Northwind Traders (PostgreSQL version)
- **Time Period**: 1996–1998 (shifted to present using date arithmetic)
- **Tables Used**: `customers`, `orders`

### 3. SQL Concepts Used
- `LEFT JOIN`
- `GROUP BY`, `HAVING`
- `MAX()` aggregate function
- Date shifting using `(CURRENT_DATE - DATE '1998-05-06')`

### 4. Business Question
*"Which customers in our dataset have never placed an order?"*

### 5. Methodology
1. **LEFT JOIN** customers with orders to ensure customers without orders are included.
2. Use `MAX(order_date)` to check for the most recent order (NULL if none exist).
3. Apply date shifting for realism.
4. Filter to show only those with no orders.
5. Sort results by simulated last order date.

### 6. Results Summary
- Total inactive customers: **X** (depends on execution date)
- Many belong to diverse geographic locations.
- Represents **untapped potential** for acquisition campaigns.

### 7. Business Insights
From a BI standpoint:
- This segment represents **zero historical revenue**.
- They are **acquisition rather than retention** opportunities.
- Useful for targeted outreach or upsell trials.

### 8. How to Run
1. Load Northwind dataset into PostgreSQL.
2. Run `inactive_customers_never.sql`.
3. Review output list of inactive customers.

---

## Project 2 – Customers Inactive for Over 12 Months

### 1. Description
Identifies customers whose **most recent order (shifted to today)** was more than 12 months ago, highlighting long-term inactivity and churn risk.

### 2. Dataset Info
- **Dataset**: Northwind Traders (PostgreSQL version)
- **Time Period**: 1996–1998 (shifted to present)
- **Tables Used**: `customers`, `orders`

### 3. SQL Concepts Used
- `LEFT JOIN`
- `GROUP BY`, `HAVING`
- `MAX()` aggregate function
- `CURRENT_DATE`, `INTERVAL`
- Date arithmetic and filtering

### 4. Business Question
*"Which customers have been inactive for more than 12 months?"*

### 5. Methodology
1. Join customers to orders.
2. Get `MAX(order_date)` for each customer.
3. Shift dates from 1998 to the current date.
4. Filter customers where shifted date < `CURRENT_DATE - INTERVAL '12 months'`.
5. Order by shifted date for easy review.

### 6. Results Summary
- Total long-term inactive customers: **Y** (depends on execution date)
- Mix of past high-value and low-value customers.
- Indicates churned or at-risk customers.

### 7. Business Insights
From a BI perspective:
- Retaining even a fraction of these customers could boost revenue.
- They require **reactivation campaigns**, potentially using incentives.
- Provides a **clear churn baseline** for predictive modelling.

### 8. How to Run
1. Load Northwind dataset into PostgreSQL.
2. Run `inactive_customers_12months.sql`.
3. Review output and plan retention actions.

---

## Notes
- Date shifting ensures that historical data remains relevant for present-day simulations.
- Both analyses can feed into **customer segmentation**, **lifetime value analysis**, and **churn prediction models**.
