USE DE_SQL_Pipeline;

-- Create partitioned sales fact table
CREATE TABLE fact_sales (
    sale_id INT,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    amount DECIMAL(10,2),
    PRIMARY KEY (sale_id, sale_date)
)
PARTITION BY RANGE COLUMNS(sale_date) (

    -- Sales before April 2026
    PARTITION p_q1 VALUES LESS THAN ('2026-04-01'),

    -- Sales from April to June 2026
    PARTITION p_q2 VALUES LESS THAN ('2026-07-01'),

    -- Future sales records
    PARTITION p_future VALUES LESS THAN (MAXVALUE)
);

-- Insert staging records into partitioned table
INSERT INTO fact_sales
SELECT * FROM staging_sales;

-- Display all sales records
SELECT * FROM fact_sales;

-- Verify partition distribution
SELECT
    PARTITION_NAME,
    TABLE_ROWS
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'de_sql_pipeline'
AND TABLE_NAME = 'fact_sales';

-- Query sales for a specific date range
SELECT *
FROM fact_sales
WHERE sale_date BETWEEN '2026-01-01' AND '2026-03-31';