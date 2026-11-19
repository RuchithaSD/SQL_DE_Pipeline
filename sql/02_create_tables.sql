USE DE_SQL_Pipeline;

-- 1. Customers source table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Products source table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- 3. Customer Dimension Table
-- Supports Slowly Changing Dimensions (SCD)
CREATE TABLE dim_customer (
    customer_key INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    start_date DATE,
    end_date DATE,
    is_current BOOLEAN DEFAULT TRUE
);

-- 4. Product Dimension Table
CREATE TABLE dim_product (
    product_key INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT UNIQUE,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- 5. Staging Sales Table
-- Stores raw data before processing
CREATE TABLE staging_sales (
    sale_id INT,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    amount DECIMAL(10,2)
);

-- Verify all created tables
SHOW TABLES;