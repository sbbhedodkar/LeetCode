SELECT
    name
from
    SalesPerson
where
    sales_id NOT IN (
        select
            sales_id
        from
            orders
            left join company ON company.com_id = orders.com_id
        where
            company.name = 'RED'
    )