CREATE DATABASE IF NOT EXISTS global_store_db;
USE global_store_db;
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    quantity INT
);
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity_ordered INT,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES inventory(product_id)
);

ALTER TABLE products 
ADD COLUMN category VARCHAR(50) AFTER price;
RENAME TABLE products TO inventory;
INSERT INTO inventory (name, price, quantity, category) VALUES
('Product1', 100.00, 15, 'Category1'),
('Product2', 150.00, 20, 'Category2'),
('Product3', 200.00, 5, 'Category1'),
('Product4', 50.00, 30, 'Category3'),
('Product5', 120.00, 0, 'Category2'),
('Product6', 300.00, 12, 'Category1'),
('Product7', 250.00, 0, 'Category3'),
('Product8', 180.00, 10, 'Category2'),
('Product9', 90.00, 25, 'Category1'),
('Product10', 60.00, 40, 'Category3');
SELECT * FROM inventory;
INSERT INTO orders (product_id, quantity_ordered, order_date) VALUES
(1, 5, '2024-09-01'),
(2, 10, '2024-09-02'),
(3, 3, '2024-09-03'),
(4, 8, '2024-09-04'),
(5, 2, '2024-09-05');
SELECT * FROM orders;
SELECT DISTINCT category FROM inventory;
SELECT name, price FROM inventory
ORDER BY price DESC
LIMIT 5;
SELECT name FROM inventory
WHERE quantity > 10;
SELECT SUM(price * quantity) AS total_inventory_value FROM inventory;
SELECT category, COUNT(*) AS product_count
FROM inventory
GROUP BY category;
SELECT DISTINCT name, price
FROM inventory
WHERE quantity = 0;
CREATE VIEW expensive_products AS
SELECT * FROM inventory
WHERE price > (SELECT AVG(price) FROM inventory);
SELECT inventory.name, orders.quantity_ordered
FROM inventory
JOIN orders ON inventory.product_id = orders.product_id;