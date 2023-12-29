CREATE TABLE [customer] (
  [customer_id] int PRIMARY KEY,
  [firstname] text,
  [lastname] text,
  [address] text,
  [email] text,
  [phone] text
)
GO

CREATE TABLE [receipt] (
  [order_id] int PRIMARY KEY,
  [order_date] Datetime,
  [customer_id] int,
  [menu_id] int,
  [quantity] int,
  [employee_id] int,
  [payment_id] int
)
GO

CREATE TABLE [menu_detail] (
  [menu_id] int PRIMARY KEY,
  [menu_name] text,
  [price] int
)
GO

CREATE TABLE [employee] (
  [employee_id] int PRIMARY KEY,
  [firstname] text,
  [lastname] text,
  [phone] text
)
GO

CREATE TABLE [payment] (
  [payment_id] int PRIMARY KEY,
  [payment_type] text
)
GO

CREATE TABLE [ingredient] (
  [ing_id] INT PRIMARY KEY,
  [ing_name] TEXT
)
GO

CREATE TABLE [food_recipe] (
  [menu_id] INT,
  [ing_id] INT
)
GO

ALTER TABLE [receipt] ADD FOREIGN KEY ([customer_id]) REFERENCES [customer] ([customer_id])
GO

ALTER TABLE [receipt] ADD FOREIGN KEY ([employee_id]) REFERENCES [employee] ([employee_id])
GO

ALTER TABLE [receipt] ADD FOREIGN KEY ([menu_id]) REFERENCES [menu_detail] ([menu_id])
GO

ALTER TABLE [receipt] ADD FOREIGN KEY ([payment_id]) REFERENCES [payment] ([payment_id])
GO

ALTER TABLE [menu_detail] ADD FOREIGN KEY ([menu_id]) REFERENCES [food_recipe] ([menu_id])
GO

ALTER TABLE [food_recipe] ADD FOREIGN KEY ([ing_id]) REFERENCES [ingredient] ([ing_id])
GO
