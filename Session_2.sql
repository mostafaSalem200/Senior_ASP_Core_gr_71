-- Employee  (DepartmentId , ProjectId)
-- Departments
-- Project

-- Country
-- City
-- District

--------------------------------------------

use [dbtest3]

select * from [dbo].[employee]

select [Name] , [Salary] from [dbo].[employee]

select [Name] as FullName , [Salary] as TotalSalary from [dbo].[employee]

select emp.Name  from employee emp

select [Name] , [Salary] from [Db100].[dbo].[Employee]

select [Name] N'ÇáÇÓã ÈÇáßÇãá' , [Salary] N'ÇáÑÇÊÈ' from [dbo].[employee]


select * from employee
where Id = 3

select * from employee
where Id = 3 or Id = 4 or Id = 5

select * from employee
where Id = 3 and Id= 4

select * from employee
where Id in(3,4,5)

select * from employee
where Id != 3


select * from employee
where Id > 3

select * from employee
where Id >= 3

select * from employee
where Id >= 3 and Id <= 8

select * from employee
where Id between 3 and 8

select * from employee
where Salary is null

select * from employee
where Salary is not null

select * from employee
order by Salary asc

select * from employee
order by Salary desc

select * from employee
order by Salary

select top(2) * from employee
where Id between 4 and 8

select distinct Name from employee


select * from employee
where Name like 'kamal';

select * from employee
where Name like 'a%';

select * from employee
where Name like '%a';

select * from employee
where Name like '%a%';

select * from employee
where Name like '___';

select * from employee
where Name like '_a%';

select * from employee
where Name like '[as]%';

select * from employee
where Name like '[^as]%';

select * from employee
where Name like '[a-f]%';

select * from employee
where Name like '[^a-f]%';


select * from employee
where Birthdate = '2000-1-1';

select * from employee
where DAY(Birthdate) = 3 and MONTH(Birthdate) = 3;

select * from employee
where year(Birthdate) = 2003;

select * from employee
where DATEPART(day , Birthdate) = 1

select * from employee
where DATEPART(MONTH , Birthdate) = 1


select * from employee
where DATEPART(year , Birthdate) = 2003

select * from employee
where DATEPART(YYYY , Birthdate) = 2003

select * from employee
where DATEPART(QUARTER , Birthdate) = 1

select * from employee
where DATEPART(QQ , Birthdate) = 2


-- Aggregation Functions

-- SUM
-- Avg
-- Count
-- Min
-- Max

select MAX(Salary) as TotalSalary from employee

select Min(Salary)  from employee

select sum(Salary)  from employee

select avg(Salary)  from employee

select count(Salary)  from employee

select count(Id)  from employee

========================================================

-- Create Table Employee
-- Contain (Id , Name , Salary , IsActive)

-- Case Expression

select name , case gender 

when 1 then 'Male'
when 0 then 'Female'
else 'N/A'

end GenderType

from employee


select name , salary , case

when salary between 2000 and 5000 then 'L'
when salary between 6000 and 10000 then 'M'
when salary between 11000 and 500000 then 'H'
else 'N/A'

end SalaryRange

from employee



---------------------------------------------------
-- Relations
--------------

-- 1 : 1
-- 1 : M    -   M : 1
-- M : M

----------------------------------------------------

-- Joins

-- Inner Join

select emp.Name , dpt.DepartmentName 
from employee emp inner join Department dpt
on emp.DepartmentId = dpt.Id


select emp.Name , dpt.DepartmentName , pro.ProjectName
from employee emp inner join Department dpt
on emp.DepartmentId = dpt.Id inner join Project pro
on emp.ProjectId = pro.Id

-- From
-- ON
-- join
-- Select

-- Outer Join
   -- left join
   select emp.Name , dpt.DepartmentName 
   from employee emp left outer join Department dpt
   on emp.DepartmentId = dpt.Id
   -- right join
   select emp.Name , dpt.DepartmentName 
   from employee emp right outer join Department dpt
   on emp.DepartmentId = dpt.Id
   -- full join

   select emp.Name , dpt.DepartmentName 
   from employee emp full outer join Department dpt
   on emp.DepartmentId = dpt.Id


-- cross join


select emp.Name , dpt.DepartmentName 
from employee emp cross join Department dpt
where emp.DepartmentId = dpt.Id

select emp.Name , dpt.DepartmentName 
from employee emp , Department dpt
where emp.DepartmentId = dpt.Id

-- From
-- Cross Join
-- Where
-- Select

-- self join

select emp.name as EmployeeName , mgr.name as ManagerName
from employee emp join employee mgr
on emp.ManagerId = mgr.Id



----------------------------------------------------

-- HR    SUM(500000)
-- Sales  100000

-- Group By
-- Having

--select sum(salary) , avg(salary)
--from employee

--select dpt.Id , dpt.DepartmentName , SUM(emp.Salary)
--from Department dpt join employee emp
--on dpt.Id = emp.DepartmentId

--group by dpt.Id , dpt.DepartmentName

--having SUM(emp.Salary) > 20000

--order by SUM(emp.Salary) asc

-- select
-- from
-- on || Where
-- group by
-- having
-- order by

--------------------------------------------

-- Students ==> Id Name
-- Courses ==> Id Name
-- StudentInCourse ==> Id StdId  CouId

-- Result

-- StudentName  No.OfCourses
-- Ahmed        10
-- Ali          5


----------------------------------------------

-- Views

-- Virtual Table
-- Container for only select statement

--create view EmpDeptPro
--as

--select emp.Name , dpt.DepartmentName , pro.ProjectName
--from employee emp inner join Department dpt
--on emp.DepartmentId = dpt.Id inner join Project pro
--on emp.ProjectId = pro.Id


--select top(2) * from [dbo].[EmpDeptPro]




--create view v1
--as

--select Name from employee


--select * from V1


--create view V2 with schemabinding
--as

--select EmpName from [dbo].[employee]


--select * from V2


--create view V3
--as

--select top(2) * from employee
--order by Salary asc

--select * from V3


--create view V4
--as

--select * from employee


--select * from V4
--order by salary asc



--create view V5
--as

--select * from V4

--select * from V5