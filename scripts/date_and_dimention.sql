-- Explore all objects in the database (i.e tables and views)
SELECT * FROM INFORMATION_SCHEMA.TABLES

-------------------------------------------------------------
-- Explore all the  columns in the database 
SELECT * FROM INFORMATION_SCHEMA.COLUMNS 


-- Exploring all the regions our customers come from (country)
SELECT DISTINCT country FROM gold.dim_customers

-- Exploring all Categories "The major Divisions"
SELECT DISTINCT category,subcategory,product_name FROM gold.dim_products
WHERE category IS NOT NULL AND subcategory IS NOT NULL
ORDER BY 1,2

------------------------------------------------------------------------------
-- EDA using the dates
-- Find the first and last order date 
-- using the above also find the how many years of sales datea is present
SELECT 
MIN(order_date) AS First_order_date,
MAX(order_date) AS Last_order_date,
DATEDIFF(year,MIN(order_date),MAX(order_date)) AS order_range_in_years,
DATEDIFF(month,MIN(order_date),MAX(order_date)) AS order_range_in_months
FROM gold.fact_sales
GO
-- Find the ages of youngest and the oldest customer
SELECT 
DATEDIFF(year,max(birthdate),GETDATE()) AS age_of_youngest_cust,
DATEDIFF(year,MIN(birthdate),GETDATE()) AS age_of_oldest_cust
FROM gold.dim_customers
