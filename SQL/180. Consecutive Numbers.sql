WITH CTE AS (
    SELECT
        id,
        num AS curow,
        LAG(num) OVER(
            order by
                id
        ) AS prevum,
        LEAD(num) OVER(
            order by
                id
        ) AS nextnum
    FROM
        Logs
)
SELECT
    DISTINCT curow AS ConsecutiveNums
FROM
    CTE
WHERE
    curow = prevnum
    AND curow = nextnum