-- Stored Procedure
-- Container for DML Statements 
   -- Select
   -- Insert
   -- Update
   -- Delete

-- Security wise

-- SP ==> Can Stop The Attacks of Sql Injection
-- You use procedures with reporting



create proc SelectEmpsData
as

select * from Employee

exec [dbo].[SelectEmpsData]




alter proc SelectEmpsDataById
@id int = 0
as


select * from employee
where Id = @id


exec [dbo].[SelectEmpsDataById] 4




create proc InsertDataIntoEmployee
@name nvarchar(30) , @salary int
as

insert into employee (Name , Salary) values (@name , @salary)


exec [dbo].[InsertDataIntoEmployee] 'PRoAaaaaaaaa' , 656666




create proc UpdateEmpsData
@name nvarchar(30) , @salary int , @id int
as

update employee
set Name = @name , Salary = @salary
where Id = @id


exec UpdateEmpsData 'NewProAaaaaaaaaa' , 11111 , 5028



create proc DeleteEmpsData
@id int = 0
as

delete from employee
where Id = @id


exec DeleteEmpsData 5028



create proc CreateDb
as

create database dbName500

exec CreateDb
-----------------------------------------------------
-- Functions
   -- Built In Functions (System Functions)

   select upper(name) from employee
   select [dbo].[Capitalize](name) from employee
   select [dbo].[Capitalize](DepartmentName) from Department
   select lower(name) from employee
   select len(LTRIM(name)) from employee
   select len(rtrim(name)) from employee
   select substring(name,2,2) from employee

   --select UPPER(SUBSTRING(LTRIM(name) , 1 , 1 )) + 
   --lower(SUBSTRING(ltrim(name) , 2 , len(ltrim(name))))
   --from employee

   select CONCAT( 
   UPPER(SUBSTRING(LTRIM(name) , 1 , 1 )) ,
   lower(SUBSTRING(ltrim(name) , 2 , len(ltrim(name))))
   )  
   from employee

    select count(name) from employee

   -- User Define Functions
      -- Scalar Valued Fundtions

	  -- create function Fname(--parameters Type)
	  -- returns DataType
	  -- begin
	  -- return
	  -- ( Code )
	  -- end



	  create function Capitalize(@param nvarchar(50))
	  returns nvarchar(50)
	  begin
	  return
	  (
	       select CONCAT( 
		   UPPER(SUBSTRING(LTRIM(@param) , 1 , 1 )) ,
		   lower(SUBSTRING(ltrim(@param) , 2 , len(ltrim(@param))))
		   )  
	  )
	  end



	  -- Table Valued Functions

	  -- create function Fname(--parameters Type)
	  -- returns table
	  -- return
	  -- ( Code )


	  create function GetEmpsDataBySalary(@salary int)
	  returns table
	  return 
	  (
	     select * from employee
		 where Salary > @salary
	  )

	  select * from [dbo].[GetEmpsDataBySalary](7000)
	  order by Salary asc

	  

-------------------------------------------------------------------------
------- Programming With Sql --------------------------------------------

-- IF (Conditions)

-- if(condition)
-- begin
-- Code
-- end
-- else
-- begin
-- code
-- end

--declare @x int = 10;
--if(@x < 100)
--begin
-- print concat(@x , ' Less Than 100')
--end
--else
--begin
-- print concat(@x , ' Greater Than 100')
--end

-- While (Loops)

-- Initial Value
-- Counter + , -
-- Condition


--declare @y int = 1
--while(@y <= 10)
--begin
-- print concat('Welcome ' , @y)
-- set @y += 1;
--end

--use [dbName500]


--create table emp
--(
-- Id int primary key identity ,
-- Name nvarchar(50),
-- Salary float
--)

--declare @a int = 1;
--while(@a <= 1000)
--begin
-- insert into emp values (concat('Emp ', @a) , (1000 + @a))
-- set @a += 1;
--end


--select GETDATE()

-----------------------------------------------------------------
-- Transaction --------------------------------------------------

-- Commit
-- Rollback

begin tran
insert into employee (Name) values ('testnameeeeeeeeeeeeeeee')

if(@@error > 0)
begin 
 rollback
end
else
begin
 commit
end

--------------------------------------------------------------------
------------- Triggers ---------------------------------------------

-- Action ==> Event
-- DDL

-- Instead Of
-- For
-- after


-- create trigger Tname on TableName
-- instead of (delete) , for (update) , after (insert)
-- as

-- logic



create trigger T1 on [dbo].[employee]
instead of delete
as

print 'can not delete data'


delete [dbo].[employee]



create trigger T2 on [dbo].[employee]
for update
as

print 'data updated'


update [dbo].[employee]
set Name = 'abbbbbbbbbbbbb'
where Id = 5031



select GETDATE()



create trigger T3 on [dbo].[employee]
after insert
as

declare @newName nvarchar(50) = (select Name from inserted)
declare @newSalary int = (select Salary from inserted)


insert into [dbo].[Employee_Log] ([ColumnName],[ActionType],[NewValue]) values
('Name' , 'Insert' , @newName)

insert into [dbo].[Employee_Log] ([ColumnName],[ActionType],[NewValue]) values
('Salary' , 'Insert' , @newSalary)



insert into employee (Name , Salary) values ('TriggerName' , 00000)




create trigger T4 on [dbo].[employee]
after update
as

declare @oldName nvarchar(50) = (select Name from deleted)
declare @oldSalary int = (select Salary from deleted)

declare @newName nvarchar(50) = (select Name from inserted)
declare @newSalary int = (select Salary from inserted)

insert into [dbo].[Employee_Log] ([ColumnName],[ActionType],[OldValue],[NewValue]) values
('Name' , 'Update' , @oldName , @newName )

insert into [dbo].[Employee_Log] ([ColumnName],[ActionType],[OldValue],[NewValue]) values
('Salary' , 'Update' , @oldSalary , @newSalary )



update [dbo].[employee]
set Name = 'Salma' , Salary = 93339
where Id = 1007






-- Id
-- ActionDateTime
-- ActionType
-- ColumnName
-- OldValue
-- NewValue


































