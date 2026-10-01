# Telecom Customer Churn Analysis (SQL Server)

## Overview
End-to-end analysis of telecom customer churn using SQL Server (SSMS): data loading, exploration, cleaning, and view creation for reporting.

## Workflow
1. **Staging:** raw data loaded into `stg_Churn` in database `db_Churn`
2. **Exploration:** distribution of gender, contract type, state, internet type, and revenue by customer status
3. **Null check:** null counts across all columns
4. **Cleaning:** NULLs replaced with sensible defaults (e.g. `'No'`, `'None'`, `'Others'`) and loaded into `prod_Churn`
5. **Views:**
   - `vw_ChurnData` - customers with status Churned or Stayed
   - `vw_JoinData` - customers with status Joined

## Project Structure
```
sql/    SQL scripts (run in order 01 to 05)
data/   Prediction data (Excel)
```

## Tools
SQL Server, SQL Server Management Studio (SSMS), Excel
