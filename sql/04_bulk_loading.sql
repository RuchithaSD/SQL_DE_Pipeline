USE DE_SQL_Pipeline;

-- Check whether local file loading is enabled
SHOW VARIABLES LIKE 'local_infile';

-- Enable local data loading for this session
SET GLOBAL local_infile = 1;

-- Load CSV data into staging table
LOAD DATA LOCAL INFILE 'C:/Users/Ruchitha/Documents/SQL DE Pipeline/data/sales.csv'
INTO TABLE staging_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(sale_id, customer_id, product_id, sale_date, quantity, amount);

-- Verify loaded records
SELECT * FROM staging_sales;

-- Count loaded records
SELECT COUNT(*) AS total_sales
FROM staging_sales;