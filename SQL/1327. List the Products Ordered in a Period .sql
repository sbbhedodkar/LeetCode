SELECT
    t1.product_name AS product_name,
    SUM(t2.unit) AS unit
FROM
    Products AS t1
    JOIN Orders AS t2 ON t1.product_id = t2.product_id
WHERE
    EXTRACT(
        MONTH
        FROM
            order_date
    ) = 2
GROUP BY
    t1.product_name
HAVING
    SUM(t2.unit) >= 100
order by
    unit DESC;