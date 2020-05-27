--https://leetcode.com/problems/department-highest-salary/
select 
c.Name as "Department", 
b.Name as  "Employee", 
b.Salary as "Salary" 
from (select 
      rank() OVER (Partition by DepartmentId order by Salary desc) as dranks,
       Name, 
      Salary, 
      DepartmentId  
      from Employee
     ) b
    
join Department c on b.DepartmentID = c.ID
where b.dranks = 1
order by "Salary"