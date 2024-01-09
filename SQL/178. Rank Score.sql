WITH cte1 As (
select d.name AS Department , e.name AS Employee , e.salary AS Salary, DENSE_RANK() OVER(PARTITION BY d.name order by salary desc) as rnk FROM Employee AS e JOIN  Department AS d  ON e.departmentId = d.id)

SELECT  Department, Employee, Salary FROM cte1 where rnk = 1