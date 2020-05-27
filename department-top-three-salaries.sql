--Write a SQL query to find employees who earn the top three salaries in each of the department. For the above tables, your SQL query should return the following rows (order of rows does not matter).
--
--Employee Table
--+----+-------+--------+--------------+  
--| Id | Name  | Salary | DepartmentId |
--+----+-------+--------+--------------+
--| 1  | Joe   | 85000  | 1            |
--| 2  | Henry | 80000  | 2            |
--| 3  | Sam   | 60000  | 2            |
--| 4  | Max   | 90000  | 1            |
--| 5  | Janet | 69000  | 1            |
--| 6  | Randy | 85000  | 1            |
--| 7  | Will  | 70000  | 1            |
--+----+-------+--------+--------------+
--
--Department
--+----+----------+
--| Id | Name     |
--+----+----------+
--| 1  | IT       |
--| 2  | Sales    |
--+----+----------+
--
--Solution to this example should return:
--+------------+----------+--------+
--| Department | Employee | Salary |
--+------------+----------+--------+
--| IT         | Max      | 90000  |
--| IT         | Randy    | 85000  |
--| IT         | Joe      | 85000  |
--| IT         | Will     | 70000  |
--| Sales      | Henry    | 80000  |
--| Sales      | Sam      | 60000  |
--+------------+----------+--------+


select c.Department as 'Department', c.Employee as 'Employee', c.Salary as 'Salary' 
from (
        select dense_rank() over (partition by a.departmentid order by a.salary desc) as 'rank', b.Name as 'Department', a.Name as 'Employee', a.Salary as 'Salary' from employee as a
        join department as b on a.Departmentid = b.id
) as c
where c.rank <= 3;
