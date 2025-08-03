create database pizzahut;  

create table orders (
order_id int not null, 
order_date date not null, 
order_time time not null,
primary key (order_id ));


create table order_details (
    order_details_id int not null,
    order_id int not null,
    pizza_id text not null,
    quantity int not null,
    primary key (order_details_id)
);


-- 1)Retrieve the total number of orders placed.
 select count(order_id) as total_orders
 from orders;
 
 
 -- 2)Calculate total revenue generated from pizza seles.
 select 
 round(sum( (od.quantity*p.price)),2) as total_revenue
 from order_details od
 join pizzas p
 using(pizza_id);
 
 
 -- 3)Identify the highest priced pizza.
SELECT 
    pt.name, p.pizza_type_id, MAX(p.price) AS max_price
FROM
    pizzas p
        JOIN
    pizza_types pt USING (pizza_type_id)
ORDER BY p.price DESC
LIMIT 1;


-- 4)Identify the   most common pizza size ordered.
SELECT 
    p.size, COUNT(od.order_details_id) AS count_order
FROM
    pizzas p
        JOIN
    order_details od USING (pizza_id)
GROUP BY p.size
ORDER BY count_order DESC;


-- 5)List the top 5 pizza_types most ordered pizza type along with their quantites.
SELECT 
    pt.name, SUM(od.quantity) AS highest_ordered
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    order_details od ON od.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY highest_ordered DESC
LIMIT 5;


-- 6)Total quantity of each pizza category ordered.
SELECT 
    pt.category, SUM(od.quantity) AS total_qty
FROM
    pizza_types pt
        JOIN
    pizzas p ON p.pizza_type_id = pt.pizza_type_id
        JOIN
    order_details od ON p.pizza_id = od.pizza_id
GROUP BY pt.category
ORDER BY total_qty DESC;


-- 7)Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) AS order_count
FROM
    orders
GROUP BY hour;

-- 8)Find the categorry wise distribution of pizzas.
SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category;


-- 9)Calculate the average number of pizzas ordered per day
SELECT 
    ROUND(AVG(qty), 0)
FROM
    (SELECT 
        o.order_date, SUM(od.quantity) AS qty
    FROM
        order_details od
    JOIN orders o ON od.order_id = o.order_id
    GROUP BY o.order_date) AS order_quantity;
    
    
-- 10)Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pt.name, SUM(p.price * od.quantity) AS revenue
FROM
    pizza_types pt
        JOIN
    pizzas p ON p.pizza_type_id=pt.pizza_type_id
        JOIN
    order_details od 
    ON od.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;

    
-- 11)Calculate percentage contributin of each pizza type to total revenue.
SELECT 
    pt.category,
    ROUND(SUM(od.quantity * p.price) / (SELECT 
                    SUM(od2.quantity * p2.price)
                FROM
                    order_details od2
                        JOIN
                    pizzas p2 ON od2.pizza_id = p2.pizza_id) * 100,
            2) AS revenue_pct
FROM
    pizza_types pt
        JOIN
    pizzas p ON p.pizza_type_id = pt.pizza_type_id
        JOIN
    order_details od ON od.pizza_id = p.pizza_id
GROUP BY pt.category
ORDER BY revenue_pct DESC;


-- 12)Analyze the cummulative revenue generated over time.
SELECT
  order_date,
  sum(revenue) over (order by order_date) as cum_revenue
from (
  select  
    o.order_date,
    sum(od.quantity * p.price) as revenue
  from order_details od 
  join pizzas p on od.pizza_id = p.pizza_id
  join orders o on o.order_id = od.order_id
  group by o.order_date
) as sales;




 