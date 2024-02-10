SELECT
    product_id,
    store1 as price,
    'store1' as store
FROM
    Products
WHERE
    store1 is not null
UNION
SELECT
    product_id,
    store2 as price,
    'store2' as store
FROM
    Products
WHERE
    store2 is not null
UNION
SELECT
    product_id,
    store3 as price,
    'store3' as store
FROM
    Products
WHERE
    store3 is not null