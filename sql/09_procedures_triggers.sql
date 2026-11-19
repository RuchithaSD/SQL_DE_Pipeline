USE DE_SQL_Pipeline;

-- 1. Create Stored Procedure
-- Calculate total sales for a customer

DELIMITER //

CREATE PROCEDURE GetCustomerSales(IN cust_id INT)
BEGIN
    SELECT
        customer_id,
        SUM(amount) AS total_sales
    FROM fact_sales
    WHERE customer_id = cust_id
    GROUP BY customer_id;
END //

DELIMITER ;

-- Execute stored procedure
CALL GetCustomerSales(1);


-- 2. Create Audit Table
-- Store information about new sales records

CREATE TABLE sales_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT,
    action_type VARCHAR(20),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 3. Create Trigger
-- Automatically record new sales insertions

DELIMITER //

CREATE TRIGGER after_sales_insert
AFTER INSERT ON fact_sales
FOR EACH ROW
BEGIN
    INSERT INTO sales_audit
    (sale_id, action_type)
    VALUES
    (NEW.sale_id, 'INSERT');
END //

DELIMITER ;


-- 4. Test Trigger
INSERT INTO fact_sales
(sale_id, customer_id, product_id, sale_date, quantity, amount)
VALUES
(12, 2, 102, '2026-05-10', 2, 50000);

-- Verify audit records
SELECT * FROM sales_audit;