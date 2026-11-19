USE DE_SQL_Pipeline;

-- Insert customer records into dimension table
INSERT INTO dim_customer
(customer_id, customer_name, email, city, start_date, end_date, is_current)
SELECT
customer_id,
customer_name,
email,
city,
CURDATE(),
NULL,
TRUE
FROM customers;


-- Verify inserted records
SELECT * FROM dim_customer;


-- UPSERT: Insert new customer or update existing customer
-- First create a unique index on customer_id
CREATE UNIQUE INDEX idx_customer_id
ON dim_customer(customer_id);


-- UPSERT using MySQL row alias syntax
INSERT INTO dim_customer
(customer_id, customer_name, email, city, start_date, end_date, is_current)
VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', 'Mysore', CURDATE(), NULL, TRUE)
AS new
ON DUPLICATE KEY UPDATE
customer_name = new.customer_name,
email = new.email,
city = new.city;

-- Verify updated customer
SELECT * FROM dim_customer
WHERE customer_id = 1;