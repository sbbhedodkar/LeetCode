CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT BEGIN RETURN (
    SELECT
        DISTINCT (salary)
    FROM
        (
            SELECT
                salary,
                DENSE_RANK() OVER(
                    ORDER BY
                        salary DESC
                ) AS sal_rank
            FROM
                Employee
        ) AS T
    where
        sal_rank = N
);

END