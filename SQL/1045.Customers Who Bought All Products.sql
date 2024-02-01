SELECT
    customer_id
FROM
    Customer
GROUP BY
    customer_id
HAVING
    count(DISTINCT product_key) = (
        SELECT
            count(distinct product_key) AS total_product
        FROM
            product
    )