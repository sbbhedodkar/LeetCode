SELECT
    p.product_name,
    s.year,
    s.price
FROM
    sales AS s
    JOIN product AS p on s.product_id = p.product_id