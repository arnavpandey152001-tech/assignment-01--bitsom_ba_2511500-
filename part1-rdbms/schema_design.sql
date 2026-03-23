CREATE DATABASE retail_db;
USE retail_db;
-- Q1: Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- Q2: Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- Q3: Create Sales Representatives Table
CREATE TABLE sales_reps (
    sales_rep_id INT PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(150) NOT NULL
);

-- Q4: Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    sales_rep_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- Q5: Create Order Items Table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Q6: Insert into Customers
INSERT INTO customers VALUES
(1, 'Arnav Pandey', 'arnav@email.com', 'Kanpur'),
(2, 'Rahul Sharma', 'rahul@email.com', 'Delhi'),
(3, 'Priya Singh', 'priya@email.com', 'Mumbai'),
(4, 'Neha Verma', 'neha@email.com', 'Lucknow'),
(5, 'Amit Kumar', 'amit@email.com', 'Pune');

-- Q7: Insert into Products
INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 60000.00),
(102, 'Phone', 'Electronics', 30000.00),
(103, 'Headphones', 'Accessories', 2000.00),
(104, 'Keyboard', 'Accessories', 1500.00),
(105, 'Mouse', 'Accessories', 800.00);

-- Q8: Insert into Sales Representatives
INSERT INTO sales_reps VALUES
(201, 'Rohit Mehta', 'rohit@email.com', 'Delhi Office'),
(202, 'Sneha Kapoor', 'sneha@email.com', 'Mumbai Office'),
(203, 'Vikas Jain', 'vikas@email.com', 'Bangalore Office'),
(204, 'Anjali Gupta', 'anjali@email.com', 'Pune Office'),
(205, 'Karan Malhotra', 'karan@email.com', 'Chennai Office');

-- Q9: Insert into Orders
INSERT INTO orders VALUES
(1001, '2024-01-10', 1, 201),
(1002, '2024-01-11', 2, 202),
(1003, '2024-01-12', 3, 203),
(1004, '2024-01-13', 4, 204),
(1005, '2024-01-14', 5, 205);

-- Q10: Insert into Order Items
INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1003, 104, 1),
(5, 1004, 105, 3);