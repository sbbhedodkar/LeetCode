SELECT
    class
from
    Courses
group by
    class
having
    COUNT(Distinct student) >= 5