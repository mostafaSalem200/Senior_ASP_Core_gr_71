 --print 'Welcome To Sql Server'

-- Notes About SQL Server
   -- SQL Server Not Case Sensitive
   -- (;) Not Mandatory
   -- Parsing Thrrough Compiler
   -- Sql Server Recomend (Bascal Case)
   -- Strong Type

-- Comment in Sql Server

-- Single Line Comment

/*

 Multi Line Comment

*/


-- Variables

  -- Global Variable
     -- Start With @@
	 -- Built In - Sql Server
	 --select @@VERSION
	 --@@error

  -- Local Variable
     -- Start With @
	 -- User Define
  
  --declare @x int = 10;
  --print @x;


  -- Data Types :
  ----------------


  -- Integer Data
  -- TinyInt  , SmallInt , Int , BigInt


  -- Fraction Data
  -- decimal , Float

  -- Boolean
  -- bit

  -- Date and Time
  -- Date , Time , DateTime , DateTime2 , SmallDateTime , DateTimeOffset

  -- Characters

  -- Char(n)
  -- NChar(n)

  -- Varchar(n)
  -- Nvarchar(n)

  -- Varchar(max)
  -- Nvarchar(max)


  --declare @a bigint = 200;

  --declare @b float = 20.7567;
  --print @b

  --declare @c decimal(4,2) = 20.7547;
  --print @c

  --declare @d bit = 1
  --print @d

  --declare @e nvarchar(10) = N'ÃÍãÏ';
  --print @e



  ------------------------------------------------------------

  -- Database First
  -- Code First


  -- Sql Categories

     -- DDL ( Data Defination Langugae ) - Structure
	   -- Create

	   create database [Db100]


	   use [Db100]

	   create table Employee
	   (
	   Id int primary key identity,
	   Name nvarchar(50) not null,
	   Salary float ,
	   IsActive bit 
	   )

	   -- Alter "Modify"

	   alter database [Db200] modify name = Db100


	   alter table [dbo].[Employee]
	   add SSN nvarchar(14) , MobileNumber nvarchar(11)


	   alter table [dbo].[Employee]
	   drop column SSN

	   -- Drop "remove"

	   drop database [Db100]

	   drop table [dbo].[Employee]

	   
	 -- DML ( Data Manipulation Language ) - Data
	   -- Insert

	   insert into [dbo].[Employee] values 
	   ('Sara' , 6000 , 1 , '12345698742')

	   insert into [dbo].[Employee] values 
	   ('Sara' , 6000 , 1 , '12345698742'),
	   ('Sara' , 6000 , 1 , '12345698742'),
	   ('Sara' , 6000 , 1 , '12345698742'),
	   ('Sara' , 6000 , 1 , '12345698742'),
	   ('Sara' , 6000 , 1 , '12345698742')


	   insert into [dbo].[Employee] ([Name],[Salary]) values 
	   ('Ahmed' , 7000 )


	   insert into [dbo].[Employee] ([Name],[Salary]) values 
	   ('Ahmed' , 7000 ),
	   ('Ahmed' , 7000 ),
	   ('Ahmed' , 7000 ),
	   ('Ahmed' , 7000 ),
	   ('Ahmed' , 7000 ),
	   ('Ahmed' , 7000 )

	   -- update

	   update [dbo].[Employee]
	   set [Name] = 'Sara' , [Salary] = 5000
	   where [Id] = 18


	   -- delete

	   delete from [dbo].[Employee]
	   where [Id] = 16


	 -- DCL ( Data Control Language )
	   -- Grant
	   -- Revoke
	   -- Deny

	 -- DQL ( Data Query Language )
	    -- select

		--* ==> All Data

		select * from [dbo].[Employee]

		select [Name] , [Salary]
		from [dbo].[Employee]

		select [Name] , [Salary]
		from [dbo].[Employee]
		where [Id] > 2

		select [Name] as FullName , [Salary] as TotalSalary
		from [dbo].[Employee]

		select [Name] FullName , [Salary] TotalSalary
		from [dbo].[Employee]

		
		select emp.Name
		from [dbo].[Employee] emp



	 -- Truncate

	 truncate table [dbo].[Employee]


