## ETL Decisions

### Decision 1 — Standardizing Date Formats
Problem: The raw dataset contained inconsistent date formats (e.g., DD-MM-YYYY, MM/DD/YYYY), which made it difficult to perform time-based analysis and join with the date dimension.
Resolution: All dates were converted into a standard YYYY-MM-DD format before loading into the dim_date table. This ensured consistency and enabled accurate aggregation by month and year.

### Decision 2 — Handling NULL Values
Problem: Some records in the dataset contained NULL or missing values in important fields such as quantity and total_amount, which could lead to incorrect aggregations or query failures.
Resolution: Records with critical NULL values were either cleaned by assigning default values where appropriate or excluded to ensure data integrity. Only complete and valid records were loaded into the fact table.

### Decision 3 — Standardizing Category Casing
Problem: Product categories were inconsistently stored (e.g., "electronics", "ELECTRONICS", "Electronics"), which would result in fragmented grouping during analysis.
Resolution: All category values were standardized to a consistent format (capitalized form, e.g., "Electronics", "Clothing", "Groceries") before loading into the dim_product table to ensure accurate aggregation and reporting.
