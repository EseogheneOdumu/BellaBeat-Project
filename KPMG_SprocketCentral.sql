-- Total Number of Customers
SELECT COUNT ( DISTINCT customer_id)
FROM [SprocketCentral ].dbo.Transactions


--Total Spend
SELECT FLOOR (SUM(list_price))
FROM [SprocketCentral ].dbo.Transactions


-- Total Number of Online order or In-Person Order
SELECT
  COUNT(CASE WHEN online_order = 'true' THEN 1 END) AS online_order,
  COUNT(CASE WHEN online_order = 'false' THEN 1 END) AS inperson_order
FROM [SprocketCentral ].dbo.Transactions


-- Top 10 Products
SELECT TOP 10
  brand,
  product_line,
  product_class,
  COUNT(*) AS count
FROM [SprocketCentral ].dbo.Transactions
GROUP BY brand, product_line, product_class
ORDER BY count DESC


-- Sum of purchases for the last 3 years by wealth segment
SELECT wealth_segment, 
	   sum(past_3years_bike_related_purchases) AS sum_of_purchases
FROM [SprocketCentral ].dbo.CustomerDemographic
GROUP BY wealth_segment
ORDER BY sum_of_purchases DESC


-- Do people who have cars buy bikes?
SELECT owns_car, COUNT(*) AS Count
FROM [SprocketCentral ].dbo.CustomerDemographic
GROUP BY owns_car

-- Number of customers per gender
-- Female
SELECT
  gender,
  CASE
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 20 AND 29 THEN '20 - 29'
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 30 AND 39 THEN '30 - 39'
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 40 AND 49 THEN '40 - 49'
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 50 AND 59 THEN '50 - 59'
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 60 AND 69 THEN '60 - 69'
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 70 AND 79 THEN '70 - 79'
    ELSE '80+'
  END AS age,
  COUNT(*) AS count
FROM [SprocketCentral ].dbo.CustomerDemographic
WHERE gender = 'Female'
GROUP BY gender,
         CASE
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 20 AND 29 THEN '20 - 29'
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 30 AND 39 THEN '30 - 39'
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 40 AND 49 THEN '40 - 49'
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 50 AND 59 THEN '50 - 59'
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 60 AND 69 THEN '60 - 69'
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 70 AND 79 THEN '70 - 79'
           ELSE '80+'
         END;



-- Male
SELECT
  gender,
  CASE
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 20 AND 29 THEN '20 - 29'
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 30 AND 39 THEN '30 - 39'
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 40 AND 49 THEN '40 - 49'
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 50 AND 59 THEN '50 - 59'
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 60 AND 69 THEN '60 - 69'
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 70 AND 79 THEN '70 - 79'
    ELSE '80+'
  END AS age,
  COUNT(*) AS count
FROM [SprocketCentral ].dbo.CustomerDemographic
WHERE gender = 'Male'
GROUP BY gender,
         CASE
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 20 AND 29 THEN '20 - 29'
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 30 AND 39 THEN '30 - 39'
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 40 AND 49 THEN '40 - 49'
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 50 AND 59 THEN '50 - 59'
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 60 AND 69 THEN '60 - 69'
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 70 AND 79 THEN '70 - 79'
           ELSE '80+'
         END;


 -- Sum of Sales in the Past 3 Years by Age group
SELECT
  CASE
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 20 AND 29 THEN '20 - 29'
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 30 AND 39 THEN '30 - 39'
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 40 AND 49 THEN '40 - 49'
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 50 AND 59 THEN '50 - 59'
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 60 AND 69 THEN '60 - 69'
    WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 70 AND 79 THEN '70 - 79'
    ELSE '80+'
  END AS age,
  COUNT(*) AS count,
  sum(past_3years_bike_related_purchases) AS sum_of_sales_in3years
FROM [SprocketCentral ].dbo.CustomerDemographic
GROUP BY
         CASE
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 20 AND 29 THEN '20 - 29'
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 30 AND 39 THEN '30 - 39'
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 40 AND 49 THEN '40 - 49'
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 50 AND 59 THEN '50 - 59'
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 60 AND 69 THEN '60 - 69'
           WHEN DATEDIFF(year, DOB, GETDATE()) BETWEEN 70 AND 79 THEN '70 - 79'
           ELSE '80+'
         END
		 ORDER BY AGE ASC, sum_of_sales_in3years DESC


-- Count of Customer by state
SELECT state, count(*) AS count_per_state
FROM SprocketCentral.dbo.NewCustomerList
GROUP BY  state


SELECT gender, COUNT(*)
FROM [SprocketCentral ].dbo.CustomerDemographic
GROUP BY gender
