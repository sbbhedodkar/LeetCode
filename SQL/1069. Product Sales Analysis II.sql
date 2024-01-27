SELECT
    product_id,
    SUM(quantity)
FROM
    sales
GROUP by
    product_id
order by
    product_id