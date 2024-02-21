SELECT
    t1.user_id,
    t1.name,
    COALESCE(SUM(t2.distance), 0)
FROM
    Users_2837 AS t1
    LEFT JOIN Rides_2837 AS t2 ON t1.user_id = t2.user_id
GROUP BY
    t1.user_id,
    t1.name
ORDER BY
    t1.user_id