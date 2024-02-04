WITH cte1 AS(
    SELECT
        *,
        RANK() OVER(
            PARTITION BY customer_id
            ORDER BY
                order_date
        ) AS rnk,
        CASE
            WHEN order_date = customer_pref_delivery_date THEN 'immediate'
            ELSE 'scheduled'
        END AS Delivery_type
    FROM
        delivery
),
cte2 AS(
    SELECT
        *
    FROM
        cte1
    WHERE
        rnk = 1
)
SELECT
    ROUND(
        SUM(
            CASE
                WHEN delivery_type = 'immediate' THEN 1
                ELSE 0
            END
        ) :: numeric / COUNT(Delivery_type) * 100,
        2
    ) AS immediate_percentage
FROM
    cte2