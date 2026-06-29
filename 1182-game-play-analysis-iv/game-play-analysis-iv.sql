# Write your MySQL query statement below
WITH CTE AS (
    SELECT 
        player_id,
        event_date,
        MIN(event_date) OVER(PARTITION BY player_id) AS first_login
    FROM Activity
)

SELECT 
    ROUND(
        COUNT(DISTINCT player_id) / 
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM CTE
WHERE DATEDIFF(event_date, first_login) = 1;