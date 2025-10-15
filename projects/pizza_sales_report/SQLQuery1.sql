USE Pizza_DB
------------
SELECT *FROM pizza_sales -- DATA RAW--

----- TOTAL ORDER -----
SELECT COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales;


----- TOTAL REVENUE -----
SELECT SUM(total_price) as REVENUE FROM pizza_sales


----- Total Pizzas Sold -----
SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales


----- Average Order Value -----
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales


-----  Average Pizzas Per Order -----
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales


----- Number of Pizzas Sold by Pizza Category -----
SELECT pizza_category AS Category, SUM(quantity) AS Total_Pizzas_Sold 
FROM pizza_sales
GROUP BY pizza_category

----- Number of orders per day -----
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

----- Revenue by month -----
select DATENAME(MONTH, order_date) as Month_Name, SUM(total_price) AS Revenue
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)


----- Revenue by Pizza Category -----
select pizza_category as Category, SUM(total_price) AS Revenue
from pizza_sales
GROUP BY pizza_category


----- Revenue by Pizza Size -----
select pizza_size as Size, SUM(total_price) AS Revenue
from pizza_sales
GROUP BY  pizza_size 

----- Top 5 Best Selling Pizza Names -----
select top 5 
pizza_name as Name, SUM(quantity) AS Total_Quantity
from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

----- Bottom 5 Least Selling Pizza Names -----
select top 5 
pizza_name as Name, SUM(quantity) AS Total_Quantity
from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC