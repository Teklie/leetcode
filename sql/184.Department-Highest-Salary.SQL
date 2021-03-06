/*
184. Department Highest Salary
https://leetcode.com/problems/department-highest-salary/
Sample Input:

Employee
+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
Department 
+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+

Sample Outout:
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+
*/
with HighestSalary as
(
	select 
		DepartmentId,
		max(Salary) as MaxSalary
	from
		Employee
	group by
		DepartmentId
)
select
	D.Name as Department,
	E.Name as Employee,
	HS.MaxSalary as Salary
from
	HighestSalary HS
	join Department D on HS.DepartmentId = D.Id
	join Employee E on E.DepartmentId = HS.DepartmentId and E.Salary = HS.MaxSalary
