WITH cte AS(
    SELECT
        product_id,
        year,
        quantity,
        price,
        DENSE_RANK() OVER(
            PARTITION BY product_id
            ORDER BY
                year
        ) AS rnk
    FROM
        sales
)
SELECT
    product_id,
    year,
    quantity,
    price
FROM
    cte
WHERE
    rnk = 1