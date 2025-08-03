# 🍕 Pizza-Sales-SQL-Analysis

## 📌 Objective
The objective of this project is to analyze pizza sales data using SQL to uncover meaningful business insights that can help improve sales strategy, inventory management, and customer satisfaction.  
The analysis focuses on identifying top-selling products, revenue trends, customer preferences, and sales patterns.

---

## 📊 Key Features
- **Data Exploration** → Orders, pizza sizes, categories, and types.
- **Revenue Analysis** → Total revenue, top revenue-generating pizzas, and category contributions.
- **Trend Analysis** → Hourly order distribution, cumulative revenue over time, and daily averages.
- **Top Performers** → Most popular pizzas and highest-priced products.
- **Business Insights** → Menu optimization and targeted marketing.

---

## 🛠 SQL Skills Demonstrated
- **Joins**: `JOIN`, `USING`, `ON`
- **Aggregations**: `SUM`, `COUNT`, `AVG`, `ROUND`
- **Window Functions**: `SUM() OVER()`
- **Grouping**: `GROUP BY`
- **Sorting & Filtering**: `ORDER BY`, `LIMIT`
- **Date/Time Functions**: `HOUR()`, date grouping

---

## 📌 Business Questions Answered
1. Total number of orders placed.
2. Total revenue generated from pizza sales.
3. Highest-priced pizza.
4. Most common pizza size ordered.
5. Top 5 most ordered pizza types (by quantity).
6. Total quantity ordered by pizza category.
7. Order distribution by hour of the day.
8. Category-wise pizza distribution.
9. Average pizzas ordered per day.
10. Top 3 pizzas by revenue.
11. Revenue percentage contribution by category.
12. Cumulative revenue trend over time.

---

## 💡 Impact
This analysis helps:
- **Increase Revenue** → Focus on top-selling & high-margin pizzas.
- **Improve Operations** → Stock inventory based on demand trends.
- **Enhance Customer Satisfaction** → Offer pizzas that match customer preferences.
- **Support Data-Driven Decisions** → Back marketing & pricing with data.

---

## 📂 Files in This Repository
- `pizza_project.sql` → SQL script containing all queries.
- `README.md` → Project documentation.

---

## 🗄 Database & Table Creation
Before running the analysis queries, create the database and tables:

```sql
CREATE DATABASE pizzahut;

CREATE TABLE orders (
    order_id INT NOT NULL, 
    order_date DATE NOT NULL, 
    order_time TIME NOT NULL,
    PRIMARY KEY (order_id)
);

CREATE TABLE order_details (
    order_details_id INT NOT NULL,
    order_id INT NOT NULL,
    pizza_id TEXT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_details_id)
);
