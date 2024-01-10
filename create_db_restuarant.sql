-- create table receipt
CREATE TABLE receipt (
    order_id int PRIMARY KEY,
    order_date Datetime,
    customer_id int,
	menu_id int,
	quantity int,
    employee_id int,
	payment_id int
);

-- insert data into receipt
INSERT INTO receipt(order_id, order_date, customer_id, menu_id, quantity, employee_id, payment_id) VALUES
(1001, '2023-09-01 08:30:00', 1, 4, 1, 2, 1),
(1002, '2023-09-02 10:15:00', 8, 2, 2, 3, 1),
(1003, '2023-09-02 12:45:00', 5, 1, 1, 3, 2),
(1004, '2023-09-05 14:20:00', 4, 5, 3, 1, 2),
(1005, '2023-09-05 16:05:00', 9, 3, 1, 5, 2),
(1006, '2023-09-05 18:30:00', 3, 2, 1, 4, 3),
(1007, '2023-09-03 09:45:00', 2, 1, 2, 4, 3),
(1008, '2023-09-03 11:30:00', 6, 4, 1, 2, 3),
(1009, '2023-09-12 13:15:00', 8, 1, 1, 4, 2),
(1010, '2023-09-10 15:20:00', 7, 4, 1, 2, 1),
(1011, '2023-09-18 17:10:00', 3, 2, 2, 3, 2),
(1012, '2023-09-18 19:45:00', 5, 5, 3, 1, 3),
(1013, '2023-09-18 21:30:00', 6, 2, 1, 3, 3),
(1014, '2023-09-15 08:00:00', 7, 4, 1, 2, 2),
(1015, '2023-09-15 10:30:00', 2, 3, 2, 1, 1),
(1016, '2023-09-08 12:15:00', 9, 5, 1, 5, 3),
(1017, '2023-09-05 14:40:00', 10, 5, 2, 1, 1),
(1018, '2023-09-20 16:20:00', 1, 1, 1, 4, 1),
(1019, '2023-09-20 18:45:00', 10, 3, 1, 5, 1),
(1020, '2023-09-20 20:30:00', 4, 3, 1, 5, 3);

-- create table customer
CREATE TABLE customer (
  customer_id int PRIMARY KEY,
  firstname text,
  lastname text,
  address text,
  email text,
  phone text
);

-- insert data into customer
INSERT INTO customer(customer_id, firstname, lastname, address, email, phone) VALUES
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

-- create table menu_detail
CREATE TABLE menu_detail (
  menu_id int PRIMARY KEY,
  menu_name text,
  price int
);

-- insert data into menu_detail
INSERT INTO menu_detail(menu_id, menu_name, price) VALUES 
(1, 'Classic', 5.99),
(2, 'Deluxe', 6.49),
(3, 'BBQ Bliss', 4.99),
(4, 'Veggie', 7.99),
(5, 'Spicy', 5.79)

-- create table employee
CREATE TABLE employee (
  employee_id int PRIMARY KEY,
  firstname text,
  lastname text,
  phone text
);

-- insert data into employee
INSERT INTO employee(employee_id, firstname, lastname, phone) VALUES 
(1, 'Alice', 'Johnson', '555-1234'),
(2, 'Bob', 'Smith', '555-5678'),
(3, 'Charlie', 'Williams', '555-9876'),
(4, 'David', 'Brown', '555-4321'),
(5, 'Emily', 'Davis', '555-8765');

-- create table payment
CREATE TABLE payment (
  payment_id int PRIMARY KEY,
  payment_type text
);

-- insert data into payment
INSERT INTO payment(payment_id, payment_type) VALUES 
(1, 'Cash'),
(2, 'Debit'),
(3, 'Credit');

-- create table ingredient
CREATE TABLE ingredient (
    ing_id INT PRIMARY KEY,
    ing_name TEXT
);

-- insert data into ingredient
INSERT INTO ingredient (ing_id, ing_name) VALUES
(1, 'Beef Patty'),
(2, 'Lettuce'),
(3, 'Tomato'),
(4, 'Onion'),
(5, 'Pickles'),
(6, 'Cheese'),
(7, 'Ketchup'),
(8, 'Mustard'),
(9, 'Mayo'),
(10, 'Bacon'),
(11, 'Chicken Patty'),
(12, 'BBQ Sauce'),
(13, 'Veggie Patty'),
(14, 'Spicy Beef Patty'),
(15, 'Jalapenos'),
(16, 'Spicy Sauce');

-- create table food_recipe
CREATE TABLE food_recipe (
    menu_id INT,
    ing_id INT
);

-- insert data into food_recipe
INSERT INTO food_recipe (menu_id, ing_id) VALUES
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9),
    (2, 1), (2, 10), (2, 2), (2, 3), (2, 4), (2, 5), (2, 6), (2, 7), (2, 8), (2, 9),
    (3, 11), (3, 12), (3, 2), (3, 3), (3, 4), (3, 5), (3, 6),
    (4, 13), (4, 2), (4, 3), (4, 4), (4, 5), (4, 6), (4, 7), (4, 8), (4, 9),
    (5, 14), (5, 15), (5, 2), (5, 3), (5, 4), (5, 5), (5, 6), (5, 16);