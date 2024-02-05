WITH cte1 AS (
    SELECT
        *
    FROM
        Students
        CROSS JOIN Subjects
    order by
        student_id
),
cte2 AS (
    SELECT
        student_id,
        subject_name,
        COUNT(subject_name) AS cnt
    FROM
        Examinations
    GROUP BY
        student_id,
        subject_name
    ORDER BY
        student_id
)
SELECT
    cte1.student_id,
    cte1.student_name,
    cte1.subject_name,
    CASE
        WHEN cnt IS NOT NULL THEN cnt
        ELSE 0
    END AS attended_exams
FROM
    cte1
    LEFT JOIN cte2 ON cte1.student_id = cte2.student_id
    AND cte1.subject_name = cte2.subject_name
ORDER BY
    cte1.student_id,
    cte1.subject_name