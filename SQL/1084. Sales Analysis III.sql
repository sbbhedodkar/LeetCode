SELECT
    Product.product_id,
    Product.product_name
FROM
    Product
    LEFT JOIN Sales ON Product.product_id = Sales.product_id
GROUP BY 
    Product.product_id,
    Product.product_name
HAVING
    min(sale_date) >= '2019-01-01'
    AND max(sale_date) <= '2019-03-31';