---------------------------------
-------- Functions --------------

-- Built In Functions (System Functions)

select UPPER(name) from Employee

select lower(name) from Employee

select len(ltrim(name)) from Employee

select SUBSTRING(ltrim(name),1,3) from Employee

select upper(SUBSTRING(ltrim(name),1,1)) + 
       lower(SUBSTRING(ltrim(name),2,len(ltrim(name))))
from employee


select concat(upper(SUBSTRING(ltrim(name),1,1)) ,
       lower(SUBSTRING(ltrim(name),2,len(ltrim(name)))))
from employee


-- User Define Function
-- DDL


-- Scaler Valued Functions 

-- Create Function Fname(--Parameter DataType ,--Parameter DataType )
-- Returns DataType
-- begin
-- return 
-- (      
--  Code
-- )
-- end



create function Capitalize(@ColName nvarchar(max))
returns nvarchar(max)
begin
return 
(
	select concat(upper(SUBSTRING(ltrim(@ColName),1,1)) ,
		   lower(SUBSTRING(ltrim(@ColName),2,len(ltrim(@ColName)))))
)
end


select [dbo].[Capitalize](DepartmentName) from Department


-- Table Valued Functions

-- Create Function Fname(--Parameter DataType ,--Parameter DataType )
-- Returns Table
-- return 
-- (      
--  Code
-- )



create function GetAllData(@salary int)
returns table
return
(
	select * from employee
	where Salary > @salary
)



select * from [dbo].[GetAllData](10000)



--------------------------------------------------------
----------- Triggers -----------------------------------


-- Action Automatic Executed based on Event Occure
-- DDL
-- Instead Of  || After || For


create trigger T1 on employee
instead of delete
as

select * from employee


delete [dbo].[employee]

create trigger T2 on Employee
for update
as

print 'Data Updated'



update employee
set name = 'aaaaa'
where Id = 3


create trigger T3 on [dbo].[employee]
after delete
as

declare @name nvarchar(50) = (select Name from deleted)
declare @salary int = (select Salary from deleted)

insert into [dbo].[Employee_Log] 
([ActionType],[ColumnName] , [OldValue])
values('Delete','Employee Name' , @name)

insert into [dbo].[Employee_Log] 
([ActionType],[ColumnName] , [OldValue])
values('Delete','Employee Salary' , @salary)


create trigger T4 on [dbo].[employee]
after update
as

declare @OldName nvarchar(50) = (select Name from deleted)
declare @NewName nvarchar(50) = (select Name from inserted)

declare @OldSalary int  = (select Salary from deleted)
declare @NewSalary int  = (select Salary from inserted)


insert into [dbo].[Employee_Log]
([ActionType],[ColumnName] ,[OldValue] , [NewValue]) 
values ('Update' ,  'Employee Name' ,@OldName ,@NewName )

insert into [dbo].[Employee_Log]
([ActionType],[ColumnName] ,[OldValue] , [NewValue]) 
values ('Update' ,  'Employee Salary' ,@OldSalary ,@NewSalary )



delete [dbo].[employee]
where Id = 4026


update employee
set Name = 'NewNameValue' , Salary = 000
where Id = 3026


-- Id
-- ColumnName
-- ActionType
-- ActionDateTime
-- UserId
-- OldValue
-- NewValue



---------------------------------------------------
-------------- Transactions -----------------------

-- Commit (Done)
-- Rollback (Cancle)



begin tran 
insert into employee (Name ,Salary) values ('tttt' , 6666)

if(@@error > 0)
begin
 rollback
end
else
begin
 commit
end



rollback


----------------------------------------------------------
------------------ Reporting -----------------------------

-- SSRS ==> Sql Server Reporting Services
   -- .rdl  / .rdlc


-- Power BI




-- Sql (Create Procedure)
-- Design Tool (Crystal - Sql Builder)
-- Programming


exec [dbo].[P2] 3




































































