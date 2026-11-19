USE DE_SQL_Pipeline;

-- Create table to store JSON customer details
CREATE TABLE customer_metadata (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    metadata JSON
);

-- Insert JSON records
INSERT INTO customer_metadata (customer_id, metadata)
VALUES
(1, '{"age": 22, "membership": "Gold", "country": "India"}'),
(2, '{"age": 24, "membership": "Silver", "country": "India"}'),
(3, '{"age": 23, "membership": "Gold", "country": "India"}');

-- Display JSON records
SELECT * FROM customer_metadata;

-- Extract membership using JSON_EXTRACT
SELECT
    customer_id,
    JSON_EXTRACT(metadata, '$.membership') AS membership
FROM customer_metadata;

-- Extract age using JSON operator
SELECT
    customer_id,
    metadata->>'$.age' AS age
FROM customer_metadata;

-- Retrieve customers with Gold membership
SELECT *
FROM customer_metadata
WHERE metadata->>'$.membership' = 'Gold';

-- Update JSON membership using primary key
UPDATE customer_metadata
SET metadata = JSON_SET(metadata, '$.membership', 'Platinum')
WHERE id = 1;

-- Verify updated JSON
SELECT * FROM customer_metadata;