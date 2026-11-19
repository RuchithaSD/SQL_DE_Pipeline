\# DE SQL Pipeline – MySQL



\## Project Overview



The DE SQL Pipeline is an E-commerce Data Engineering project developed using MySQL 8.0.46. It demonstrates advanced SQL concepts used in data engineering, including bulk data loading, data transformation, dimensional modeling, partitioning, indexing, and query optimization.



\## Objectives



\- Build a SQL-based data engineering pipeline.

\- Perform bulk loading of CSV datasets.

\- Implement MERGE/UPSERT operations.

\- Manage large datasets using range partitioning.

\- Optimize queries using indexes and EXPLAIN ANALYZE.

\- Implement Star Schema and Slowly Changing Dimensions.

\- Understand transaction management and ACID properties.



\## Technologies Used



\- Database: MySQL 8.0.46

\- IDE: MySQL Workbench

\- Language: SQL

\- Dataset: CSV



\## Project Structure



```text

DE\_SQL\_Pipeline/

│

├── sql/

│   ├── 01\_create\_database.sql

│   ├── 02\_create\_tables.sql

│   ├── 03\_insert\_sample\_data.sql

│   ├── 04\_bulk\_loading.sql

│   ├── 05\_merge\_upsert.sql

│   ├── 06\_partitioning.sql

│   ├── 07\_indexes.sql

│   ├── 08\_transactions.sql

│   ├── 09\_procedures\_triggers.sql

│   ├── 10\_star\_schema\_scd.sql

│   ├── 11\_json\_queries.sql

│   └── 12\_explain\_analyze.sql

│

├── data/

│   └── sales.csv

│

└── README.md

```



\## Key Concepts Implemented



1\. DML Operations – INSERT, UPDATE and DELETE.

2\. MERGE / UPSERT – Using INSERT ON DUPLICATE KEY UPDATE.

3\. Range Partitioning – Partitioning sales records based on dates.

4\. Bulk Loading – Importing CSV data using LOAD DATA LOCAL INFILE.

5\. Index Optimization – Composite indexes and generated-column-based partial index alternatives.

6\. ACID Properties – Transaction management using COMMIT and ROLLBACK.

7\. Stored Procedures and Triggers – Automating database operations.

8\. Star Schema – Fact and dimension table modeling.

9\. SCD Type 1, Type 2 and Type 3 – Managing historical customer changes.

10\. JSON Queries – Storing and retrieving JSON data.

11\. EXPLAIN ANALYZE – Analyzing query execution performance.



\## Database Design



The project uses an E-commerce database containing:



\- Customers

\- Products

\- Customer Dimension

\- Product Dimension

\- Sales Fact Table

\- Staging Sales Table

\- Sales Audit Table

\- Customer Metadata Table



\## Execution Steps



1\. Create the database.

2\. Create the required tables.

3\. Insert sample customer and product data.

4\. Load sales data from the CSV file.

5\. Perform UPSERT operations.

6\. Implement range partitioning.

7\. Create indexes.

8\. Demonstrate ACID properties.

9\. Create stored procedures and triggers.

10\. Implement Star Schema and SCD.

11\. Execute JSON queries.

12\. Analyze query performance.



Execute the SQL scripts in the specified order using MySQL Workbench.



\## Learning Outcomes



\- Understanding advanced SQL operations.

\- Hands-on experience with data loading and transformation.

\- Knowledge of dimensional modeling.

\- Understanding historical data management.

\- Experience with database optimization techniques.

\- Practical exposure to data engineering concepts.



\## Author



\*\*Ruchitha S D\*\*



Information Science Student

