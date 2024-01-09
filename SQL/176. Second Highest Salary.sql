WITH salary_ranked
AS (
    SELECT salary
        , DENSE_RANK() OVER (
            ORDER BY salary DESC
            ) AS rank_num
    FROM employee
    )
SELECT (
        SELECT DISTINCT (salary_ranked.salary)
        FROM salary_ranked
        WHERE rank_num = 2
        ) AS SecondHighestSalary;