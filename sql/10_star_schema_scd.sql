USE DE_SQL_Pipeline;

-- Load product dimension table
INSERT INTO dim_product
(product_id, product_name, category, price)
SELECT
product_id,
product_name,
category,
price
FROM products;

-- Verify product dimension
SELECT * FROM dim_product;

-- Generate sales report using dimension tables
SELECT
    f.sale_id,
    c.customer_name,
    p.product_name,
    p.category,
    f.sale_date,
    f.quantity,
    f.amount
FROM fact_sales f
JOIN dim_customer c
    ON f.customer_id = c.customer_id
    AND c.is_current = TRUE
JOIN dim_product p
    ON f.product_id = p.product_id;
    

-- SCD TYPE 1

UPDATE dim_customer
SET city = 'Hubli'
WHERE customer_id = 2
AND is_current = TRUE;

-- Verify updated record
SELECT * FROM dim_customer
WHERE customer_id = 2;



-- SCD TYPE 2

-- Remove unique constraint on customer_id
DROP INDEX idx_customer_id ON dim_customer;

-- Create a normal index
CREATE INDEX idx_dim_customer_id
ON dim_customer(customer_id);

-- Expire the existing customer record
UPDATE dim_customer
SET
    end_date = CURDATE(),
    is_current = FALSE
WHERE customer_id = 3
AND is_current = TRUE;

-- Insert a new customer version
INSERT INTO dim_customer
(customer_id, customer_name, email, city,
 start_date, end_date, is_current)
VALUES
(3, 'Amit', 'amit@gmail.com', 'Coimbatore',
 CURDATE(), NULL, TRUE);

-- Verify historical records
SELECT *
FROM dim_customer
WHERE customer_id = 3;



-- SCD TYPE 3

-- Add previous_city column
ALTER TABLE dim_customer
ADD COLUMN previous_city VARCHAR(50);

-- Update customer city while retaining previous city
UPDATE dim_customer
SET
    previous_city = city,
    city = 'Mangalore'
WHERE customer_id = 4
AND is_current = TRUE;

-- Verify changes
SELECT
    customer_id,
    customer_name,
    city,
    previous_city
FROM dim_customer
WHERE customer_id = 4;