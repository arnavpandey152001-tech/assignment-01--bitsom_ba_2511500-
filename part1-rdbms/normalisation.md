## Anomaly Analysis

### Insert Anomaly
In the current denormalized table (`orders_flat`), it is not possible to insert data about independent entities without inserting related data from other entities.

**Example:**  
To add a new product (`product_id`, `product_name`, `category`, `unit_price`), an `order_id` must also be provided because product data is stored within order records.  
This forces the user to create a fake or incomplete order just to store product information.

**Columns Involved:**  
`product_id`, `product_name`, `category`, `unit_price`, `order_id`

**Issue:**  
The database design does not allow independent insertion of product data.

---

### Update Anomaly
The same data is repeated across multiple rows, leading to inconsistency when updates are made.

**Example:**  
Customer details (`customer_id`, `customer_name`, `customer_email`, `customer_city`) appear in multiple rows for different orders.  
If a customer changes their email, all corresponding rows must be updated.  
If some rows are not updated, inconsistent data will exist.

**Columns Involved:**  
`customer_id`, `customer_name`, `customer_email`, `customer_city`

**Issue:**  
Redundant data leads to inconsistency and violates data integrity.

---

### Delete Anomaly
Deleting a row may result in unintended loss of important data.

**Example:**  
If an order is deleted and it is the only record containing a specific `sales_rep_id`, then all information about that sales representative is also lost.

**Columns Involved:**  
`sales_rep_id`, `sales_rep_name`, `order_id`

**Issue:**  
Important entity data is lost when unrelated records are deleted.

## Normalization Justification

Keeping all data in a single flat table may appear simpler at first, but it leads to significant data inconsistency and maintenance issues, as seen in the orders_flat.csv dataset. The dataset contains repeated information for customers, products, and sales representatives across multiple rows. For example, customer details such as customer_name, customer_email, and customer_city are duplicated for every order placed by the same customer. This redundancy increases storage usage and creates update anomalies, where a single change (such as updating a customer’s city) must be applied to multiple rows, increasing the risk of inconsistent data.

Similarly, product information like product_name, category, and unit_price is repeated across multiple entries. If the price of a product changes and not all records are updated, it results in conflicting data. Sales representative details are also duplicated in every transaction they handle, leading to the same problem of redundancy and potential inconsistency.

The dataset also suffers from insert and delete anomalies. For instance, a new product cannot be added without creating an associated order, and deleting a single row may result in the loss of important information about a product, customer, or sales representative.

Normalization to Third Normal Form (3NF) resolves these issues by separating the data into distinct tables such as customers, products, sales_reps, orders, and order_items. Each entity is stored only once, and relationships are maintained using foreign keys. This eliminates redundancy, ensures data consistency, and makes updates, insertions, and deletions more reliable.

Therefore, normalization is not over-engineering but a necessary approach to ensure data integrity, scalability, and efficient database management.
---

### Summary
These anomalies occur because multiple entities (Customers, Products, Orders, Sales Representatives) are stored in a single table without normalization.  
This leads to redundancy, inconsistency, and poor data integrity.