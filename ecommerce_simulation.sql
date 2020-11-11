-- Create the 3 tables.
CREATE TABLE users (
	user_id SERIAL PRIMARY KEY, 
  name VARCHAR(100),
  email VARCHAR(100)
);

CREATE TABLE products (
	product_id SERIAL PRIMARY KEY, 
  name VARCHAR(100),
  price INTEGER
);

CREATE TABLE orders (
	order_id SERIAL PRIMARY KEY, 
  product_id INTEGER REFERENCES products(product_id)
);

-- Add some data to fill up each table. At least 3 users, 3 products, 3 orders.

INSERT INTO users (name, email)
VALUES ('Molly', 'beans@brownhound.com'), ('Chickpea', 'mischief@spotteddog.com'), ('Sophie', 'loaf@porpoiseface.com');

INSERT INTO products (name, price)
VALUES ('chew toy', 1), ('treat', 2), ('leash', 3);

INSERT INTO orders (product_id)
VALUES (1), (2), (3);

-- Run queries against your data.
    -- Get all products for the first order.
        SELECT * FROM products p
        JOIN orders o ON p.product_id = o.product_id
        WHERE o.order_id = 1;
    -- Get all orders.
        SELECT * FROM orders;
        -- Or to see products:
        SELECT * FROM orders o
        JOIN products p ON p.product_id = o.product_id;

    -- Get the total cost of an order (sum the price of all products on an order).
        SELECT (o.quantity * p.price) FROM orders o
        JOIN products p ON o.product_id = p.product_id
        WHERE o.order_id = 2;

-- Add a foreign key reference from orders to users.

ALTER TABLE orders 
ADD COLUMN user_id INTEGER REFERENCES users;

-- Update the orders table to link a user to each order.

UPDATE orders
SET user_id = 1
WHERE order_id = 1;

UPDATE orders
SET user_id = 3
WHERE order_id = 2;

UPDATE orders
SET user_id = 2
WHERE order_id = 3;

-- Run queries against your data.
    -- Get all orders for a user.
        SELECT * FROM orders
        WHERE user_id = 2; 

    -- Get how many orders each user has.
        SELECT COUNT(*), u.name 
        FROM orders o
        JOIN users u ON o.user_id = u.user_id
        GROUP BY u.name;
