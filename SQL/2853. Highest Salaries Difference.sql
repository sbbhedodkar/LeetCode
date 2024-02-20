WITH cte AS (
    SELECT
        department,
        Max(salary) AS s
    FROM
        Salaries
    GROUP BY
        department
    ORDER BY
        s desc
)
SELECT
    MAX(s) - MIN (s) AS salary_difference
FROM
    cte