WITH cte1 AS (
    SELECT
        p.project_id,
        e.employee_id,
        e.experience_years,
        DENSE_RANK() OVER(
            PARTITION by p.project_id
            ORDER BY
                experience_years desc
        ) AS rnk
    FROM
        employee AS e
        JOIN project AS p ON p.employee_id = e.employee_id
)
SELECT
    project_id,
    employee_id
FROM
    cte1
WHERE
    rnk = 1