--Product Performance Analysis
/*
This query aims to evaluate the performance of each product
in terms of total sales and total profit. 
*/
SELECT 
    ProductName,
    ProductID,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM superstoresales
GROUP BY productid,productname
ORDER BY TotalProfit DESC




-- Country Performance Analysis
/*
This query aims to evaluate the performance of each country
in terms of total sales and total profit. 
*/
SELECT 
    Country,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM superstoresales
GROUP BY Country
ORDER BY TotalProfit DESC




--Annual Performance Analysis
-- This query aims to evaluate the performance of sales and profit
-- on an annual basis. It groups the data by year, then calculates 
-- the total sales and total profit for each year. The results are 
-- ordered by total profit in descending order to highlight the most profitable years.

SELECT 
    EXTRACT(YEAR FROM OrderDate) AS year,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit 
FROM superstoresales
GROUP BY EXTRACT(YEAR FROM OrderDate) 
ORDER BY TotalProfit DESC



--Order Priority Profit Analysis
/*
To evaluate the financial performance of different 
order priorities (Critical, Medium, High, Low) 
by analyzing the total sales and total profit associated with each priority level.
*/
SELECT 
    OrderPriority,
    SUM(sales) AS TotalSales,
    SUM(profit) AS TotalProfit
FROM superstoresales
GROUP BY OrderPriority
ORDER BY TotalProfit DESC




--Product Analysis by Priority
/*
Identify which products are most frequently ordered under each 
priority level to optimize inventory and promotions.
*/
SELECT 
    productname,
    OrderPriority,
    SUM(profit) AS TotalProfit,
    SUM(sales) AS TotalSales
FROM superstoresales
GROUP BY productname,OrderPriority
ORDER BY OrderPriority,TotalProfit DESC;


--Shipping Mode Performance Analysis
SELECT 
    ShipMode,
    AVG(ShipDate - OrderDate) AS AvgProcessDays,
    SUM(profit) AS TotalProfit
FROM superstoresales
GROUP BY ShipMode
ORDER BY TotalProfit DESC;



--Customer Segmentation Analysis
/*
Analyze sales and profit by customer segment to understand 
which customer segments are most valuable.
*/
SELECT 
    Segment,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM SuperstoreSales
GROUP BY Segment
ORDER BY TotalProfit DESC;


