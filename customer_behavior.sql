A. KPI’s
1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza;
2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza;
3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza;
4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza;
5. Average Pizzas Per Order
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS avg_pizzas_per_order
FROM pizza;
B. Daily Trend for Total Orders
SELECT order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza
GROUP BY order_day
ORDER BY order_day;

C. Monthly Trend for Orders
select month_name,COUNT(DISTINCT order_id) as Total_Orders
from pizza
GROUP BY month_name
ORDER BY month_name;
D. % of Sales by Pizza Category
SELECT pizza_category,SUM(total_price) AS total_revenue,SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza) AS pct
FROM pizza
GROUP BY pizza_category;
E. % of Sales by Pizza Size
SELECT pizza_size,SUM(total_price) AS total_revenue,SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza) AS pct
FROM pizza
GROUP BY pizza_size
ORDER BY pizza_size;
F. Total Pizzas Sold by Pizza Category
SELECT pizza_category,SUM(quantity) AS total_quantity_sold
FROM pizza
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY total_quantity_sold DESC;
G. Top 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;
H. Bottom 5 Pizzas by Revenue
SELECT  pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;
I. Top 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;
J. Bottom 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;
K. Top 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;
L. Bottom 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;
