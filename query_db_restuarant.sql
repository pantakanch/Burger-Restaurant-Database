-- 1. top-selling menu
SELECT
	md.menu_name,
	SUM(r.quantity) AS total_sales
FROM receipt r 
JOIN menu_detail md ON r.menu_id = md.menu_id
GROUP BY 1
ORDER BY 2 DESC;

-- 2. sales by week 
SELECT 
	strftime('%W', order_date) AS week_number,
	SUM((r.quantity * md.price)) AS total_sales
FROM receipt r
JOIN menu_detail md ON r.menu_id = md.menu_id
GROUP BY 1;

-- 3. top spending customer
SELECT
	r.customer_id,
	c.firstname || ' ' || c.lastname AS full_name,
	SUM((r.quantity *  md.price)) AS total_spending
FROM receipt r
JOIN menu_detail md ON r.menu_id = md.menu_id
JOIN customer c ON r.customer_id = c.customer_id
GROUP BY 1
ORDER BY 3 DESC;

-- 4. average order amount
SELECT
	AVG(quantity) AS avg_order_amount
FROM receipt;

-- 5. employee who handle the most order
SELECT
	r.employee_id,
	e.firstname || ' ' || e.lastname AS full_name,
	COUNT(r.employee_id) AS no_order
FROM receipt r
JOIN employee e ON r.employee_id = e.employee_id
GROUP BY 1
ORDER BY 3 DESC;

-- 6. what ingredients are used most frequently?
SELECT
    i.ing_id,
    i.ing_name,
    (SELECT SUM(r.quantity) FROM receipt r WHERE r.menu_id IN (SELECT fr.menu_id FROM food_recipe fr WHERE fr.ing_id = i.ing_id)) AS total_quantity_used
FROM ingredient i
ORDER BY total_quantity_used DESC;
