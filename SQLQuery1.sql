-- Fetching Data
--select * from pizza_sales
--1) Total Revenue: Sum of total price of all pizza orders
select SUM(total_price) AS Total_Revenue from pizza_sales
--2) Avg order value: Sum of total price divided by the count of distinct order id
select SUM(total_price) / COUNT(DISTINCT order_id) AS AvgOrder_Value from pizza_sales
--3) Total pizza sold
select SUM(quantity) AS Total_Pizza_Sold from pizza_sales
--4) Total Orders 
select COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales
--5) Avg Pizzas per order
select CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2))AS DECIMAL(10,2)) AS AvgPizza_PerOrder from pizza_sales