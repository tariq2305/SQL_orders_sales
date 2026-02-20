use superstore;
select * from orders_sales;

SELECT 
    Order_ID, 
    Order_Date, 
    MONTH(STR_TO_DATE(order_date, '%d/%m/%Y')) AS Order_Month
FROM orders_sales;



SELECT 
    order_id, 
    order_date, 
    MONTH(
        COALESCE(
            STR_TO_DATE(order_date, '%m/%d/%Y'), -- Tries to read '10/25/2024'
            STR_TO_DATE(order_date, '%d-%m-%y')  -- Tries to read '25-10-24'
        )
    ) AS order_month
FROM orders_sales;


SELECT 
    YEAR(COALESCE(STR_TO_DATE(order_date, '%m/%d/%Y'), STR_TO_DATE(order_date, '%d-%m-%y'))) AS order_year,
    MONTH(COALESCE(STR_TO_DATE(order_date, '%m/%d/%Y'), STR_TO_DATE(order_date, '%d-%m-%y'))) AS order_month,
    COUNT(order_id) AS total_orders
FROM orders_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

SELECT 
    DATE_FORMAT(STR_TO_DATE(Order_Date, '%m/%d/%y'), '%Y-%m') AS order_year_month,
    COUNT(Order_ID) AS total_orders,
    SUM(Sales) AS total_revenue
FROM orders_sales
GROUP BY order_year_month
ORDER BY order_year_month;


SELECT 
    DATE_FORMAT(STR_TO_DATE(Order_Date, '%m/%d/%y'), '%Y-%m') AS order_year_month,
    COUNT(DISTINCT Order_ID) AS order_volume,
    SUM(Sales) AS total_revenue
FROM orders_sales
GROUP BY order_year_month
ORDER BY order_year_month;

/*--Sort Chronologically (Oldest to Newest)*/
SELECT 
    DATE_FORMAT(STR_TO_DATE(Order_Date, '%m/%d/%y'), '%Y-%m') AS order_year_month,
    COUNT(DISTINCT Order_ID) AS order_volume,
    SUM(Sales) AS total_revenue
FROM orders_sales
GROUP BY order_year_month
ORDER BY order_year_month ASC;

/*Sort by Highest Revenue (Best Months First)*/
SELECT 
    DATE_FORMAT(STR_TO_DATE(Order_Date, '%m/%d/%y'), '%Y-%m') AS order_year_month,
    COUNT(DISTINCT Order_ID) AS order_volume,
    SUM(Sales) AS total_revenue
FROM orders_sales
GROUP BY order_year_month
ORDER BY total_revenue DESC;



/* Sort by Highest Volume (Busiest Months First)*/
SELECT 
    DATE_FORMAT(STR_TO_DATE(Order_Date, '%m/%d/%y'), '%Y-%m') AS order_year_month,
    COUNT(DISTINCT Order_ID) AS order_volume,
    SUM(Sales) AS total_revenue
FROM orders_sales
GROUP BY order_year_month
ORDER BY order_volume DESC;


/*Filter for a Specific Year (e.g., Only 2017)*/
SELECT 
    DATE_FORMAT(STR_TO_DATE(Order_Date, '%m/%d/%y'), '%Y-%m') AS order_year_month,
    COUNT(DISTINCT Order_ID) AS order_volume,
    SUM(Sales) AS total_revenue
FROM orders_sales
WHERE YEAR(STR_TO_DATE(Order_Date, '%m/%d/%y')) = 2017
GROUP BY order_year_month
ORDER BY order_year_month ASC;

/*Filter for a Custom Date Range using BETWEEN*/
SELECT 
    DATE_FORMAT(STR_TO_DATE(Order_Date, '%m/%d/%y'), '%Y-%m') AS order_year_month,
    COUNT(DISTINCT Order_ID) AS order_volume,
    SUM(Sales) AS total_revenue
FROM orders_sales
WHERE STR_TO_DATE(Order_Date, '%m/%d/%y') BETWEEN '2018-01-01' AND '2018-03-31'
GROUP BY order_year_month
ORDER BY order_year_month ASC;








