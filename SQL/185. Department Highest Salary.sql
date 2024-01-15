select
    Department,
    Employee,
    Salary
from
    (
        select
            d.name AS Department,
            e.name AS Employee,
            e.salary AS Salary,
            dense_rank() OVER(
                PARTITION by d.name
                order by
                    salary desc
            ) rnk
        from
            employee e
            join department d on e.departmentId = d.id
    ) tbl
where
    rnk <= 3