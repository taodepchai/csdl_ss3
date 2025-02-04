
CREATE DATABASE bt9;
USE bt9;


CREATE TABLE Customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL
);


CREATE TABLE Orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status ENUM('Pending', 'Shipped', 'Completed', 'Cancelled') NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(id) ON DELETE CASCADE
);


INSERT INTO Customers (name, email, phone) VALUES
('Nguyen Van A', 'nguyenvana@example.com', '1234567890'),
('Tran Thi B', 'tranthib@example.com', '0987654321'),
('Le Van C', 'levanc@example.com', '0912345678'),
('Pham Thi D', 'phamthid@example.com', '0898765432'),
('Hoang Van E', 'hoangvane@example.com', '0812345678');


INSERT INTO Orders (order_date, total_amount, status, customer_id) VALUES
('2025-01-01', 200.00, 'Pending', 1),
('2025-01-02', 150.50, 'Shipped', 1),
('2025-01-03', 300.75, 'Completed', 2),
('2025-01-04', 450.00, 'Pending', 3),
('2025-01-05', 120.00, 'Cancelled', 2),
('2025-01-06', 99.99, 'Pending', 4),
('2025-01-07', 75.50, 'Shipped', 4),
('2025-01-08', 500.00, 'Completed', 3),
('2025-01-09', 60.00, 'Pending', 1),
('2025-01-10', 250.00, 'Completed', 3);


UPDATE Customers 
SET phone = '0000000000' 
WHERE name LIKE 'Nguyen%';


DELETE FROM Customers 
WHERE id IN (
    SELECT customer_id FROM (
        SELECT customer_id, SUM(total_amount) AS total_spent 
        FROM Orders 
        GROUP BY customer_id
    ) AS subquery
    WHERE total_spent < 100
);


UPDATE Orders 
SET status = 'Cancelled' 
WHERE total_amount < 50 AND status = 'Pending';
