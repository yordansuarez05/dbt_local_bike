# DBT Local Bike Project

## Project Objective

This project transforms raw sales data from a bike retail company into an analytical data model using dbt and BigQuery.
The final objective is to build a simple and clear Star Schema to support Business Intelligence reporting.
---
## Architecture

The project follows a layered approach:

### 1. Staging Layer
- Clean raw data
- Rename columns
- Trim text fields
- Basic data quality tests (not_null, unique, relationships)

### 2. Intermediate Layer
- Business logic implementation
- Revenue calculation
- Discount formatting
- Performance metrics
- Stock analysis

### 3. Marts Layer (Star Schema)
Final analytical layer structured as:

Fact Table:
- fct_sales

Dimension Tables:
- dim_customers
- dim_products
- dim_stores
- dim_staff

---

## Revenue Formula

Revenue is calculated as:

quantity * list_price * (1 - discount)

Values are rounded to 2 decimals for BI readability.

---

## Data Quality

Tests implemented:
- Primary key validation (not_null + unique)
- Relationship validation between fact and dimensions

---

## Tools Used

- dbt Cloud
- BigQuery
- GitHub
- Star Schema modeling approach

---

## Status

Project operational and ready for BI visualization.
