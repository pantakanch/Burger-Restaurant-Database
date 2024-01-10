# Burger Restaurant Database Project

## Overview

Welcome to the "Burger Restaurant Database" project! This GitHub repository focuses on creating a comprehensive database for a burger restaurant using SQL, along with an Entity-Relationship (ER) diagram generated using dbdiagram.io. The project includes the creation of tables, data insertion, and several SQL queries to analyze sales, customer spending, employee performance, and ingredient usage.

## Database Structure

### Tables

1. **`receipt` Table:** Stores information about customer orders, including order date, menu items, quantity, and payment details.

2. **`customer` Table:** Contains customer details such as name, address, email, and phone number.

3. **`menu_detail` Table:** Holds details about menu items, including menu name and price.

4. **`employee` Table:** Stores information about employees, including name and contact details.

5. **`payment` Table:** Contains payment types accepted by the restaurant.

6. **`ingredient` Table:** Lists various burger ingredients.

7. **`food_recipe` Table:** Establishes relationships between menu items and ingredients.

### ER Diagram

The ER diagram visually represents the relationships between different tables, providing a clear overview of the database structure.
![ER Diagram](https://github.com/pantakanch/Restaurant-Database/assets/113978334/8641a336-4adf-419a-b57d-4225a67ba84b)

## SQL Queries

1. **Top-Selling Menu:**
   - Identifies the most popular menu items based on total sales quantity.
   ```sql
   SELECT
      md.menu_name,
      SUM(r.quantity) AS total_sales
   FROM receipt r 
   JOIN menu_detail md ON r.menu_id = md.menu_id
   GROUP BY 1
   ORDER BY 2 DESC;
   ```
   ![Top-Selling Menu Query Result](https://github.com/pantakanch/Restaurant-Database/assets/113978334/d2e05fa6-be88-40d4-92f9-eeaf34a22089)

2. **Sales by Week:**
   - Analyzes sales trends on a weekly basis, calculating the total sales amount.
   ```sql
   SELECT 
      strftime('%W', order_date) AS week_number,
      SUM((r.quantity * md.price)) AS total_sales
   FROM receipt r
   JOIN menu_detail md ON r.menu_id = md.menu_id
   GROUP BY 1;
   ```
   ![Sales by Week Query Result](https://github.com/pantakanch/Restaurant-Database/assets/113978334/9e7993fe-5d71-45d5-a6db-2e78a88f81cb)

3. **Top Spending Customer:**
   - Identifies customers who spent the most by calculating their total spending.
   ```sql
   SELECT
      r.customer_id,
      c.firstname || ' ' || c.lastname AS full_name,
      SUM((r.quantity *  md.price)) AS total_spending
   FROM receipt r
   JOIN menu_detail md ON r.menu_id = md.menu_id
   JOIN customer c ON r.customer_id = c.customer_id
   GROUP BY 1
   ORDER BY 3 DESC;
   ```
   ![Top Spending Customer Query Result](https://github.com/pantakanch/Restaurant-Database/assets/113978334/0365c625-f185-4f58-bc2f-aac5019b78b9)

4. **Average Order Amount:**
   - Calculates the average order quantity.
   ```sql
   SELECT
      AVG(quantity) AS avg_order_size
   FROM receipt;
   ```
   ![Average Order Amount Query Result](https://github.com/pantakanch/Restaurant-Database/assets/113978334/8830b5b4-7dde-439e-b5bb-7e7baa38b339)

5. **Employee Handling Most Orders:**
   - Determines which employee processed the highest number of orders.
   ```sql
   SELECT
      r.employee_id,
      e.firstname || ' ' || e.lastname AS full_name,
      COUNT(r.employee_id) AS no_order
   FROM receipt r
   JOIN employee e ON r.employee_id = e.employee_id
   GROUP BY 1
   ORDER BY 3 DESC;
   ```
   ![Employee Handling Most Orders Query Result](https://github.com/pantakanch/Restaurant-Database/assets/113978334/0fb6c5f0-e2a4-40e4-81e3-c4daa96c13ae)

6. **Ingredient Usage Analysis:**
   - Analyzes ingredient usage, highlighting the most frequently used ingredients.
   ```sql
   SELECT
      i.ing_id,
      i.ing_name,
      (SELECT SUM(r.quantity) FROM receipt r WHERE r.menu_id IN (SELECT fr.menu_id FROM food_recipe fr WHERE fr.ing_id = i.ing_id)) AS total_quantity_used
   FROM ingredient i
   ORDER BY total_quantity_used DESC;
   ```
   ![Screenshot 2023-12-29 181512](https://github.com/pantakanch/Restaurant-Database/assets/113978334/651180e7-4579-4035-9e70-9344109a4312)

