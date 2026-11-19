USE DE_SQL_Pipeline;

-- 1. Create a composite index
-- Index on customer_id and sale_date
CREATE INDEX idx_customer_date
ON fact_sales(customer_id, sale_date);

-- Verify composite index
SHOW INDEX FROM fact_sales;


-- 2. Partial Index Alternative
-- Create a generated column for high-value sales
ALTER TABLE fact_sales
ADD COLUMN high_value_flag TINYINT
GENERATED ALWAYS AS (
    CASE
        WHEN amount >= 50000 THEN 1
        ELSE NULL
    END
) STORED;

-- Create an index on the generated column
CREATE INDEX idx_high_value
ON fact_sales(high_value_flag);

-- Retrieve high-value sales
SELECT *
FROM fact_sales
WHERE high_value_flag = 1;


-- 3. Verify indexes
SHOW INDEX FROM fact_sales;


-- 4. Test composite index
SELECT *
FROM fact_sales
WHERE customer_id = 1
AND sale_date >= '2026-01-01';