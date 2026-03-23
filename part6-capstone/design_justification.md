## Storage Systems

The architecture uses multiple storage systems tailored to different use cases. A Data Lake is used to store raw and unstructured data such as ICU device streams, doctor notes, and historical treatment logs. This allows flexibility in handling diverse data formats and supports future analytics and machine learning workloads.

A Data Warehouse is used for structured and cleaned data required for reporting. This enables efficient generation of monthly reports such as bed occupancy and department-wise costs through optimized OLAP queries.

A Vector Database is used to store embeddings of patient records and doctor notes. This is essential for enabling semantic search, allowing doctors to query patient history in natural language and retrieve contextually relevant results.

Finally, a relational OLTP database (such as MySQL) is used for storing transactional patient data, including admissions, treatments, and billing. This ensures strong consistency and reliability for day-to-day hospital operations.

---

## OLTP vs OLAP Boundary

The OLTP system handles real-time transactional operations such as patient admissions, updates to treatment records, and billing transactions. This layer is optimized for fast inserts, updates, and consistency.

The OLAP system begins after data is extracted from the OLTP database and passed through the ETL pipeline into the Data Lake and Data Warehouse. At this stage, data is cleaned, transformed, and aggregated for analytical purposes.

The boundary between OLTP and OLAP lies at the ETL/streaming layer. Data flows from operational systems into analytical storage systems where it is no longer modified frequently but instead queried for insights, reporting, and model training.

---

## Trade-offs

One significant trade-off in this architecture is the use of multiple storage systems, which increases system complexity and operational overhead. Managing a Data Lake, Data Warehouse, Vector Database, and OLTP system requires careful coordination, data consistency checks, and maintenance.

However, this trade-off is necessary to achieve scalability and flexibility across different use cases. To mitigate this complexity, centralized data orchestration tools and automated pipelines can be used to manage data flow and ensure consistency across systems. Additionally, clear data governance policies and schema management can help reduce errors and improve maintainability.

Overall, while the architecture introduces complexity, it provides a robust and scalable solution capable of supporting real-time processing, advanced analytics, and AI-driven applications.