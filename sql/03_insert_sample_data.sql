USE DE_SQL_Pipeline;

-- Insert customer records
INSERT INTO customers VALUES
(1, 'Rahul', 'rahul@gmail.com', 'Bangalore', NOW()),
(2, 'Priya', 'priya@gmail.com', 'Mysore', NOW()),
(3, 'Amit', 'amit@gmail.com', 'Chennai', NOW()),
(4, 'Sneha', 'sneha@gmail.com', 'Bangalore', NOW()),
(5, 'Kiran', 'kiran@gmail.com', 'Hyderabad', NOW());

-- Insert product records
INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mobile', 'Electronics', 25000),
(103, 'Chair', 'Furniture', 5000),
(104, 'Table', 'Furniture', 8000),
(105, 'Headphones', 'Accessories', 2000);

-- Verify customer records
SELECT * FROM customers;

-- Verify product records
SELECT * FROM products;