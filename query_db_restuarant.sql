-- create table customers
CREATE TABLE customers (
  customer_id int PRIMARY KEY,
  firstname text,
  lastname text,
  address text,
  email text,
  phone text
);

-- insert data into customers
INSERT INTO customers(customer_id, firstname, lastname, address, email, phone) VALUES
(1, 'John', 'Doe', '123 Main St', 'john.doe@email.com', '555-1234'),
(2, 'Alice', 'Smith', '456 Oak Ave', 'alice.smith@email.com', '555-5678'),
(3, 'Bob', 'Johnson', '789 Pine Ln', 'bob.johnson@email.com', '555-9876'),
(4, 'Sarah', 'Williams', '321 Maple Dr', 'sarah.williams@email.com', '555-4321'),
(5, 'David', 'Brown', '654 Cedar Blvd', 'david.brown@email.com', '555-8765'),
(6, 'Emily', 'Davis', '987 Birch Rd', 'emily.davis@email.com', '555-2345'),
(7, 'Michael', 'Miller', '135 Elm Ct', 'michael.miller@email.com', '555-6789'),
(8, 'Jessica', 'Wilson', '246 Spruce Pl', 'jessica.wilson@email.com', '555-3456'),
(9, 'Kevin', 'Lee', '579 Pinecrest Ave', 'kevin.lee@email.com', '555-7890'),
(10, 'Olivia', 'Martin', '864 Oakwood Ln', 'olivia.martin@email.com', '555-4567');

-- create table invoice
create table invoice (
    invoice_id int PRIMARY KEY,
    order_date Datetime,
    customer_id int,
	menu_id int,
    employee_id int,
	payment_type text
);

-- insert data into invoice
INSERT INTO invoice(invoice_id, order_date, customer_id, menu_id, employee_id, payment_type) VALUES
(1, '2023-01-15 08:30:00', 3, 1, 5, 'Credit Card'),
(2, '2023-02-18 12:15:00', 7, 2, 2, 'Cash'),
(3, '2023-03-22 17:45:00', 1, 3, 4, 'Debit Card'),
(4, '2023-04-05 10:00:00', 9, 4, 2, 'Cash'),
(5, '2023-05-12 14:20:00', 6, 5, 1, 'Credit Card'),
(6, '2023-06-28 19:00:00', 4, 6, 3, 'Debit Card'),
(7, '2023-07-08 21:45:00', 10, 7, 3, 'Cash'),
(8, '2023-08-14 16:10:00', 2, 8, 1, 'Credit Card'),
(9, '2023-09-19 11:30:00', 5, 9, 4, 'Debit Card'),
(10, '2023-10-25 13:55:00', 8, 10, 5, 'Cash');

-- create table orders
CREATE TABLE orders (
  menu_id int PRIMARY KEY,
  customer_id int,
  quantity int
);

-- insert data into orders
INSERT INTO orders(menu_id, customer_id, quantity) VALUES 
  (1, 3, 3),
  (2, 7, 2),
  (3, 1, 1),
  (4, 9, 3),
  (5, 6, 1),
  (6, 4, 1),
  (7, 10, 2),
  (8, 2, 1),
  (9, 5, 2),
  (10, 8, 3);
  
-- create table menu_detail
CREATE TABLE menu_detail (
  menu_id int PRIMARY KEY,
  name text,
  size text,
  price int
);

-- insert data into menu_detail
INSERT INTO menu_detail(menu_id, name, size, price) VALUES 
(1, 'Margherita Pizza', 'Medium', 12),
(2, 'Chicken Alfredo Pasta', 'Large', 15),
(3, 'Classic Burger', 'Regular', 8),
(4, 'Vegetarian Wrap', 'Small', 10),
(5, 'Grilled Chicken Salad', 'Large', 13),
(6, 'Spaghetti Bolognese', 'Regular', 11),
(7, 'Pepperoni Calzone', 'Medium', 14),
(8, 'Caesar Salad', 'Small', 9),
(9, 'BBQ Chicken Pizza', 'Large', 16),
(10, 'Vegetable Stir Fry', 'Regular', 12);

-- create table waiter
CREATE TABLE waiter (
  employee_id int PRIMARY KEY,
  firstname text,
  lastname text,
  phone text
);

INSERT INTO waiter(employee_id, firstname, lastname, phone) VALUES 
(1, 'Alice', 'Johnson', '555-1234'),
(2, 'Bob', 'Smith', '555-5678'),
(3, 'Charlie', 'Williams', '555-9876'),
(4, 'David', 'Brown', '555-4321'),
(5, 'Emily', 'Davis', '555-8765');