-- Star Schema Design for retail_transactions.csv after data cleaning
CREATE DATABASE data_warehouse_db;
USE data_warehouse_db;
-- Q1: Create Dimension Table - Date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

-- Q2: Create Dimension Table - Store
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- Q3: Create Dimension Table - Product
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Q4: Create Fact Table - Sales
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- Q5: Insert into dim_date (cleaned format)
INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 1, 2024),
(2, '2024-01-02', 2, 1, 2024),
(3, '2024-01-03', 3, 1, 2024),
(4, '2024-01-04', 4, 1, 2024),
(5, '2024-01-05', 5, 1, 2024);

-- Q6: Insert into dim_store
INSERT INTO dim_store VALUES
(101, 'Store A', 'Mumbai'),
(102, 'Store B', 'Delhi'),
(103, 'Store C', 'Bangalore');

-- Q7: Insert into dim_product (standardized category casing)
INSERT INTO dim_product VALUES
(201, 'Laptop', 'Electronics'),
(202, 'Shirt', 'Clothing'),
(203, 'Rice Bag', 'Groceries'),
(204, 'Headphones', 'Electronics'),
(205, 'Jeans', 'Clothing');

-- Q8: Insert into fact_sales (cleaned data, no NULLs)
INSERT INTO fact_sales VALUES
(1, 1, 101, 201, 1, 60000.00),
(2, 1, 102, 202, 2, 3000.00),
(3, 2, 103, 203, 5, 2500.00),
(4, 2, 101, 204, 3, 6000.00),
(5, 3, 102, 205, 2, 4000.00),
(6, 3, 103, 201, 1, 60000.00),
(7, 4, 101, 202, 4, 6000.00),
(8, 4, 102, 203, 6, 3000.00),
(9, 5, 103, 204, 2, 4000.00),
(10, 5, 101, 205, 3, 6000.00);