
use Pizza_DB;
-- 1. Total Revenue
select sum(total_price) as total_revenue 
from pizza_sales;

-- 2. Average Order Value
select sum(total_price)/count(distinct order_id) as avg_order_value
from pizza_sales;

-- 3. Total Pizza Sales
select sum(quantity) as Total_Pizza_Sales
from pizza_sales;

-- 4. Total Orders
select count(distinct order_id) as Total_Order
from pizza_sales;

-- 5. Average Pizzas Per Order
select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizza_Per_Order
from pizza_sales;

-- 6. Daily Trend for Total Orders
select datename(dw,order_date) order_day, count(distinct order_id) as Total_orders 
from pizza_sales 
group by datename(dw,order_date);

-- 7. Hourly Trend for Total Orders
select datepart(hour,order_time) order_hour, count(distinct order_id) as Total_orders 
from pizza_sales
group by datepart(hour,order_time)
order by datepart(hour,order_time);

-- 8. Percentage of Sales by Pizza Category
select pizza_category, sum(total_price) as total_sale,
sum(total_price)/(select sum(total_price) from pizza_sales)*100 as Sale_per_Category
from pizza_sales
group by pizza_category


-- 9. Percentage of Sales by Pizza Size
select pizza_size, sum(total_price) as total_sale,
sum(total_price)/(select sum(total_price) from pizza_sales)*100 as Sale_per_Size
from pizza_sales
group by pizza_size
order by Sale_per_Size desc;

-- 10. Total Pizza Sold
select pizza_category, sum(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_category;

-- 11. Top 5 Best Sellers by Total Pizzas Sold
select top 5 pizza_name, sum(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold desc;


-- 12. Bottom 5 Worst Sellers by Total Pizzas Sold
select top 5 pizza_name, sum(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold asc;
