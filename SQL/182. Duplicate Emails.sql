SELECT
    email
FROM
    Person
group by
    email
having
    COUNT(*) > 1