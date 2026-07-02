# Write your MySQL query statement below
WITH Cte AS (
    SELECT *
    FROM Stadium
    WHERE people >= 100),

Cte2 AS (
    SELECT
        *,
        id - ROW_NUMBER() OVER(ORDER BY id) rn
        FROM Cte
)

SELECT 
    id,
    visit_date,
    people
FROM Cte2
WHERE rn IN (
    SELECT rn
    FROM Cte2
    GROUP BY rn
    HAVING COUNT(*) >=3
)