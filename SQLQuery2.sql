select * from pizza_sales
--Daily Trend
select DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) AS Total_Orders
from pizza_sales
GROUP BY DATENAME(DW, order_date)

--Hourly Trend
select DATEPART(HOUR, order_time) as order_hours, COUNT(DISTINCT order_id) AS Total_Orders
from pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

--Monthly trend
select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Month_Name 

--Percentage of Sales by Pizza Category
select pizza_category, SUM(total_price) as Total_Sales, SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales WHERE MONTH(order_date) = 1) AS Total_Percent_Sales
from pizza_sales 
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

--Percentage of Sales by Pizza Size
select pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as Total_Sales, CAST(SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS Total_Percent_Sales
from pizza_sales 
GROUP BY pizza_size
ORDER BY Total_Percent_Sales DESC

--Percentage of Sales by Pizza Size (QUATERLY)
select pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as Total_Sales, CAST(SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales WHERE DATEPART(quarter,order_date) = 1
) AS DECIMAL(10,2)) AS Total_Percent_Sales
from pizza_sales 
WHERE DATEPART(quarter,order_date) = 1
GROUP BY pizza_size
ORDER BY Total_Percent_Sales DESC

--Total Pizza sold by pizza category
select pizza_category, SUM(quantity) as total_pizza_sold from pizza_sales
GROUP BY pizza_category

-- Top 5 bestselelrs by total pizza sold
select TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizzas_Sold DESC

-- Bottom 5 worst sellers by total pizza sold
select TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizzas_Sold 