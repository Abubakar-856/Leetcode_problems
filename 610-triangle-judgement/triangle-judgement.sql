# Write your MySQL query statement below
SELECT *,
CASE WHEN 
    x + y > z AND
    x + z > y AND
    Y + z > x THEN "Yes"
    ELSE "No"
END triangle
FROM Triangle