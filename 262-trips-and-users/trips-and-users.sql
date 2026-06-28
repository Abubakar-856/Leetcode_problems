# Write your MySQL query statement below
WITH cte AS (
    SELECT
        t.request_at AS Day,
        AVG(
            CASE
                WHEN t.status = 'completed' THEN 0
                ELSE 1
            END
        ) AS Cancellation_Rate
    FROM Trips t
    JOIN Users u
        ON u.users_id = t.client_id
       AND u.banned = 'No'
    JOIN Users u1
        ON u1.users_id = t.driver_id
       AND u1.banned = 'No'
    WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
    GROUP BY Day
)

SELECT
    Day,
    ROUND(Cancellation_Rate, 2) AS `Cancellation Rate`
FROM cte;
