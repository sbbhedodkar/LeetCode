WITH
    cte AS (
        SELECT
            *,
            RANK() OVER (
                PARTITION BY student_id
                ORDER BY grade DESC, course_id
            ) AS rk
        FROM Enrollments
    )
SELECT student_id, course_id, grade
FROM cte
WHERE rk = 1
ORDER BY student_id;
