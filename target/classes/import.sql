-- Insert Users
INSERT INTO users (name, email, password, role) VALUES
('Farmer John', 'farmer.john@example.com', 'password123', 'FARMER'),
('Farmer Raju', 'raju@example.com', 'password123', 'FARMER'),
('Alice', 'alice@example.com', 'password123', 'BUYER'),
('Bob', 'bob@example.com', 'password123', 'BUYER'),
('Admin', 'admin@example.com', 'admin123', 'ADMIN');

-- Insert Products
INSERT INTO product (name, description, price, stock, farmer_id) VALUES
('Organic Wheat', 'High quality organic wheat', 200, 50, 1),
('Fresh Rice', 'Pesticide-free rice', 250, 80, 1),
('Farm Fresh Apples', 'Red apples directly from farm', 120, 100, 2),
('Organic Fertilizer', 'Natural compost fertilizer', 500, 30, 2);

-- Insert Order (example with user 3 - Alice)
-- PostgreSQL requires RETURNING to get the generated ID
INSERT INTO orders (order_date, total_amount, user_id)
VALUES (NOW(), 320, 3)
    RETURNING id;

-- Assume it returns ID = 1
-- Associate products to that order
INSERT INTO order_products (order_id, product_id) VALUES
(1, 1),  -- Organic Wheat
(1, 3);  -- Farm Fresh Apples
