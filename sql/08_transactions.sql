USE DE_SQL_Pipeline;

-- 1. START TRANSACTION
START TRANSACTION;

-- Insert a new sales record
INSERT INTO fact_sales
(sale_id, customer_id, product_id, sale_date, quantity, amount)
VALUES
(11, 1, 101, '2026-04-25', 1, 55000);

-- Verify inserted record
SELECT * FROM fact_sales
WHERE sale_id = 11;

-- Commit transaction permanently
COMMIT;


-- 2. ROLLBACK
START TRANSACTION;

-- Update sales amount
UPDATE fact_sales
SET amount = 60000
WHERE sale_id = 11;

-- Check updated amount
SELECT * FROM fact_sales
WHERE sale_id = 11;

-- Undo the update
ROLLBACK;

-- Verify original amount is restored
SELECT * FROM fact_sales
WHERE sale_id = 11;


-- 3. Check transaction isolation level
SELECT @@transaction_isolation;

-- Set session isolation level
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Verify isolation level
SELECT @@transaction_isolation;