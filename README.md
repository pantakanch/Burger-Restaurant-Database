# Restaurant-Database

Design a database schema for the mock-up burger restaurant with the following tables.
- receipt
- customer
- employee
- payment
- menu_detail
- food_recipe
- ingredient

# ER Diagram
![ER Diagram](https://github.com/pantakanch/Restaurant-Database/assets/113978334/8641a336-4adf-419a-b57d-4225a67ba84b)

# Query
1. What are the top-selling menu?

```
SELECT
	md.menu_name,
	SUM(r.quantity) AS total_sales
FROM receipt r 
JOIN menu_detail md ON r.menu_id = md.menu_id
GROUP BY 1
ORDER BY 2 DESC;
```
![Screenshot 2023-12-29 175609](https://github.com/pantakanch/Restaurant-Database/assets/113978334/d2e05fa6-be88-40d4-92f9-eeaf34a22089)

2. What is the weekly sales volume?

```
SELECT 
	strftime('%W', order_date) AS week_number,
	SUM((r.quantity * md.price)) AS total_sales
FROM receipt r
JOIN menu_detail md ON r.menu_id = md.menu_id
GROUP BY 1;
```
![Screenshot 2023-12-29 180151](https://github.com/pantakanch/Restaurant-Database/assets/113978334/9e7993fe-5d71-45d5-a6db-2e78a88f81cb)

3. Who is the top spender?

```
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

![Screenshot 2023-12-29 180425](https://github.com/pantakanch/Restaurant-Database/assets/113978334/0365c625-f185-4f58-bc2f-aac5019b78b9)

4. What is the average order amount?

```
SELECT
	AVG(quantity) AS avg_order_size
FROM receipt;
```

![Screenshot 2023-12-29 180957](https://github.com/pantakanch/Restaurant-Database/assets/113978334/8830b5b4-7dde-439e-b5bb-7e7baa38b339)

5. Which employees handle the most orders?

```
SELECT
	r.employee_id,
	e.firstname || ' ' || e.lastname AS full_name,
	COUNT(r.employee_id) AS no_order
FROM receipt r
JOIN employee e ON r.employee_id = e.employee_id
GROUP BY 1
ORDER BY 3 DESC;
```

![Screenshot 2023-12-29 181322](https://github.com/pantakanch/Restaurant-Database/assets/113978334/0fb6c5f0-e2a4-40e4-81e3-c4daa96c13ae)

6. what ingredients are used most frequently?

```
SELECT
    i.ing_id,
    i.ing_name,
    SUM(r.quantity) AS total_used
FROM ingredient i
JOIN food_recipe fr ON i.ing_id = fr.ing_id
JOIN receipt r ON fr.menu_id = r.menu_id
GROUP BY 1
ORDER BY 3 DESC;
```

![Screenshot 2023-12-29 181512](https://github.com/pantakanch/Restaurant-Database/assets/113978334/651180e7-4579-4035-9e70-9344109a4312)

