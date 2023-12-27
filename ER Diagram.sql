CREATE TABLE `customers` (
  `customer_id` int PRIMARY KEY,
  `firstname` text,
  `lastname` text,
  `address` text,
  `email` text,
  `phone` text
);

CREATE TABLE `invoice` (
  `invoice_id` int PRIMARY KEY,
  `order_date` Datetime,
  `customer_id` int,
  `menu_id` int,
  `employee_id` int,
  `payment_type` text
);

CREATE TABLE `orders` (
  `menu_id` int PRIMARY KEY,
  `customer_id` int,
  `quantity` int
);

CREATE TABLE `menu_detail` (
  `menu_id` int PRIMARY KEY,
  `name` text,
  `size` text,
  `price` int
);

CREATE TABLE `waiter` (
  `employee_id` int PRIMARY KEY,
  `firstname` text,
  `lastname` text,
  `phone` text
);

ALTER TABLE `invoice` ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

ALTER TABLE `invoice` ADD FOREIGN KEY (`employee_id`) REFERENCES `waiter` (`employee_id`);

ALTER TABLE `invoice` ADD FOREIGN KEY (`menu_id`) REFERENCES `orders` (`menu_id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`menu_id`) REFERENCES `menu_detail` (`menu_id`);
