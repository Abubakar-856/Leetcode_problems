# Write your MySQL query statement below
WITH first_order AS(
SELECT *
FROM(
SELECT 
    *,
    ROW_NUMBER() OVER( PARTITION BY customer_id ORDER BY order_date) rn
FROM Delivery) t
WHERE rn = 1)

SELECT
    ROUND(AVG(order_date = customer_pref_delivery_date) * 100, 2) immediate_percentage
FROM first_order