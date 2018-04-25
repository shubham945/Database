

create table contact12
(contact_ID int primary key ,
Last_Name char(10) not null,
First_name char(10) not null,
Address varchar(10),
city char(20),
State char(10),
Gender char(10), 
Salary money   );
-------------------------------------------------------------------------------------------------------------------------------------
select * from contact12;
-------------------------------------------------------------------------------------------------------------------------------------
select max(Salary) from contact12 where salary < (select max(Salary) from contact12 where salary < (select max(salary) from contact12))
-------------------------------------------------------------------------------------------------------------------------------------
select  max(salary)  as salary from
 contact12  where Salary < (select max(salary) from contact12);
 -------------------------------------------------------------------------------------------------------------------------------------

alter table contact12 add contact_ID int identity(1,1) primary key;   
alter table contact12 drop column contactID
alter table contact12 drop PK__contact1__7121FD15D07EFD59
-------------------------------------------------------------------------------------------------------------------------------------
select top 1 max(salary),first_name from contact12 group by First_name;

 select first_name,salary from contact12 where 
 salary = (select max(salary) from contact12)

------------------------------------------------------------------------------------------------------------------------

select city,sum(salary) from contact12 group by city
-------------------------------------------------------------------------------------------------------------------------------------

delete from contact12 where Last_Name like '%caty%'
------------------------------------------------------------------------------------------------------------------------
alter table contact12 add contactID int identity(1,1) primary key;
alter table contact12 drop contact_ID;

alter table contact12 drop 


Alter table contact12 drop PK__contact1__024F7EDE8276CB33;



alter table contact12 add contact_Id12 int identity(1,1) ;
alter table contact12 drop constraint pk_contact_id ;
alter table contact12 drop constraint PK_contact_contact_ID;

alter table contact12 drop column contact_ID;




-------------------------------------------------------------------------------------------------------------------------------------
--RANK FUNCTION

select last_name,first_name,city,salary, dense_rank() over(order by salary desc) as Rank   from contact12 ;

select gender , salary,  DENSE_RANK() over(partition by Gender order by salary desc) as RANk from contact12;

select last_name,first_name,city,salary, NTILE(5) over(order by salary desc) as Rank   from contact12 ;
  
--------------------------------------------------------------------------------------------------------------------------------------
 
  select first_name, salary from
  (
  select first_name, salary , DENSE_RANK() over(order by salary desc)as rank from contact12
  ) 
  AS a where rank=2;
  

-------------------------------------------------------------------------------------------------------------------------------------

  select first_name,salary from contact12 where 
  salary = (select max(salary)from contact12 where 
   salary <(select max(salary) from contact12))

-------------------------------------------------------------------------------------------------------------------------------------
with T as 
( 
select first_name, salary , DENSE_RANK() over(order by salary desc)as rank from contact12
)
select * from t where rank=2;

--````````````````````````````````````````````````````````````````````````````````````````````````````````````````````

--Index
create index contect123 ON contact12 (salary);
------------------------------------------------------------------------------------------------------------------------

create table employeedetails(id int,Fullname varchar(20),managerid int, joining date);
alter table employeedetails alter column joining date ;

insert into employeedetails (id,fullname,managerid,joining) 
values
(321,'Walter White',986,'30-jan-2015'),
(421,'kuldeep Rana',876,'27-nov-2016');

select * from employeedetails
insert into employeedetails values(121,'John Snow',321,'31-jan-2014')

create table empSalary(id int, project char(10),salary money)

insert into empSalary(id,project,salary) values (121,'p1',8000),
												(321,'p2',1000),
												(421,'p1',12000);


select count(*) as number from empsalary where project='p1' ;
select * from empSalary where salary between 5000 And 10000;


select Fullname from employeedetails
where id in(select  id from empSalary where
salary between 5000 and 10000)

select * from employeedetails
select * from empSalary




select fullname from employeedetails where id in 
(select id from empSalary where salary between 5000 and 10000)

select count(id) from empSalary group by project order by count(id) desc;
--------------------------------------------------------------------------------------------------------------------------------------------
--STRING

SELECT LEFT(FullName, CHARINDEX(' ',FullName) - 1) FROM EmployeeDetails;

select SUBSTRING(fullname,0, charindex(' ',fullname)) from employeedetails
--------------------------------------------------------------------------------------------------------------------------------------------
select fullname, salary from employeedetails right join empSalary
 on employeedetails.id=empSalary.id ;

 SELECT E.FullName, S.Salary  
FROM EmployeeDetails E LEFT JOIN empSalary S
ON E.Id = S.Id;


select E.fullname from employeedetails E
join employeedetails M on E.id=m.managerid

--------------------------------------------------------------------------------


select * from employeedetails where id in (select Id from empSalary) 

SELECT * FROM EmployeeDetails E 
WHERE EXISTS 
(SELECT * FROM empSalary S WHERE  E.Id = S.Id);


-----------------------------------------------------------------------------------------

select project,count(*) from empSalary group by project
having count(*)>1 

SELECT Id, Project, Salary, COUNT(*)
FROM empSalary
GROUP BY Id, Project, Salary
HAVING COUNT(*) > 1; 

delete from  empSalary where id in(select project, count(*) from empSalary group by id having count(*)>1); 

DELETE FROM EmpSalary  
WHERE Id IN (
SELECT Id 
FROM EmpSalary       
GROUP BY Project, Salary
HAVING COUNT(*) > 1);

select * from empSalary where project='p1'
-------------------------------------------------------------------------------------------------------------------------------------------------
 
 select * into newtable from employeedetails

 select * into new_Table from employeedetails where 1=0;  -- create a table  with no records.
-------------------------------------------------------------------------------------------------------------------------------------------------

select * from new_Table12
select * from new_Table12
select * from datevalues;
select * from employeedetails
select * from new_Table;
----------------------------------------------------------------------------------------------------------------------------------------------------
--     --
-- VIEW--
--     --

CREATE TABLE PRODUCTS
(ProductID INT PRIMARY KEY CLUSTERED,
ProductDesc VARCHAR(50) NOT NULL,
ManufacturingDate DATETIME,
ExpiryDate DATETIME,
IsSalable BIT,--1 Salable/Active FOR 0 For NonSalable/Passive Product
Price MONEY NOT NULL
)

CREATE TABLE Customer
(CustID INT IDENTITY(1002,2)PRIMARY KEY CLUSTERED,
 FName VARCHAR(50) NOT NULL,
 LNme VARCHAR(50) NOT NULL,
 UserID VARCHAR(100) NOT NULL,
 Pswd NVARCHAR(100) NOT NULL DEFAULT 'password123'
)

CREATE TABLE BOOKING
( BookingID INT IDENTITY(10,2) PRIMARY KEY CLUSTERED,
  ProductID INT REFERENCES dbo.Products(ProductID),
  CustID INT REFERENCES dbo.Customer(CustID),
  DateOfBooking DATETIME NOT NULL,
  QTY INT
)

INSERT INTO PRODUCTS VALUES
(1,'Biscuits','2011-09-01 00:00:00.000','2012-09-01 00:00:00.000',1,20),
(2,'Butter','2010-09-01 00:00:00.000','2011-09-01 00:00:00.000',1,30),
(3,'Milk','2011-10-01 00:00:00.000','2011-11-01 00:00:00.000',1,46)

INSERT INTO Customer (FName,LNme,UserID,Pswd)
 VALUES
('Sara','Verma','S.Verma@abc.com','S123'),
('Rick','Singh','G.Singh@xyz.com','G311'),
('Micky','Khera','M.Khera@mno.com','M222')

INSERT INTO BOOKING (ProductID,CustID,DateOfBooking,QTY)
VALUES
(1,1002,'2011-11-01 00:00:00.000',3),
(2,1004,GETDATE(),4),
(3,1006,'2011-10-01 00:00:00.000',2)

select * from PRODUCTS;
select * from Customer;
select * from booking;


Create view v_Totalamount 
As
select p.productId,p.ProductDesc,c.fname,c.LNme, p.price,b.qty, (p.price * b.qty) as totalAmt from 
PRODUCTS P 
inner join booking B On P.ProductID=B.ProductID
inner join Customer C on C.CustID=B.CustID;

select * from v_Totalamount
--------------------------------------------------------------------------------------------------------------------------------------------
----PROCEDURE--------


create proc test12 as 
begin
select * from v_Totalamount 
end
-------------------------------------------
Create proc ArgProc @productDesc char(10)
as
begin
select * from v_Totalamount
where ProductDesc = @productDesc;
end
--------------------------
ArgProc 'milk';
exec ArgProc 'milk';
---------------------



select * from Customer
select * from booking
select * from PRODUCTS

Alter proc SSRS_TESTING as
begin
select C.FName,C.lNme, p.productdesc, c.custId,p.price,b.qty, p.price * b.qty as Total from customer c inner join BOOKING b ON 
c.CustID=b.CustID inner join Products p ON p.ProductID=b.ProductID; 
end


SSRS_TESTING


sp_helptext SSRS_testing   --code of store procedure and view

sp_help ssrs_testing       --

sp_depends ssrs_testing

sp_rename

------------------------------------output Procedure--------------------------------------------------------------------------------
create proc EmpDetailsCount
 @EmpCount int output,
 @Gender varchar(10) as 
begin
select @EmpCount =count(first_name) from contact12 where Gender= @gender;
end
 ----------------------------------------------------------------------------------------

 ----------------------------------------------------------------------------------------
 declare @total int
 exec EmpDetailsCount  @total out,@Gender='male'
 print @total

-------------------------------------------------------------------------------------------------------------------------------------
Alter proc cityproc @cityCount int output,
@city varchar(12) 
as 
begin 
select  @cityCount=(contact_id) from contact12 where city=@city
end 

declare @total int
exec cityproc @total out, @city='India'
print @total


select * from contact12 order by salary  desc

alter proc chutiyapa
as 
begin 

select * from contact12 where city like 'i%' And Salary between 2000 and 25000
 end

 Exec sp_rename 'chutiyapa' ,'India'  -- Rename procedure name..

 india


select * from contact12 where city like  'i%';

select * into #temp from contact12

-----------------------------------------------------------------------------------------
select * from #temp;     --temp table exist till current session(Query Window) exist.
-----------------------------------------------------------------------------------------

select salary As 'old salry' , salary+10000 as 'new salary' ,city from contact12 where city like 'i%'  

-----------------------------------------------------------------------------------------

select c.fname,c.lnme,p.productDesc,b.ProductID
from Customer c inner join BOOKING b on C.CustID=B.CustID inner join 
PRODUCTS p on P.ProductID=B.ProductID 
-----------------------------------------------------------------------------------------

 --trigger---
  select * from contact_audit
 select * from contact12
 insert into contact12 values('ranvijay','dhole','pen','mmbai','MH','Male',150000)


 create table Contact_audit(contact_id int, first_name varchar(15), last_name varchar(15), salary money) 

 create trigger audit_trigger ON contact12       --- insert trigger with condition
 for insert
 as
 declare @id int,
 @first_name varchar(15),
  @last_name varchar(15),
  @salary money

  select @id = i.contact_id from inserted i;
  select @first_name=i.first_name from inserted i;
  select @last_name=i.last_name from inserted i;
  select @salary=i.salary from inserted i;
  
  insert into Contact_audit(contact_id, first_name, last_name, salary) values (@id,@first_name,@last_name,@salary);
  print 'After insertion'
  go
---------------------------------------------------------------------------------------------------------------------------

 alter trigger audit_trigger ON contact12   -- Alter the above Trigger
 for insert
 as
 declare @id int,
 @first_name varchar(15),
 @last_name varchar(15),
 @salary money 

  select @id = i.contact_id from inserted i;
  select @first_name=i.first_name from inserted i;
  select @last_name=i.last_name from inserted i;
  select @salary = i.salary from inserted i;

   
   if (@salary> 2000)    

  insert into Contact_audit(contact_id, first_name, last_name, salary) values (@id,@first_name,@last_name,@salary);
  go
----------------------------------------------------------------------------------------
 select * from contact12
 -----------------------------------------------------------------------------------------
 create table Employee_Demo_Audit   -- new table for auditing Employe Event
(
 Emp_ID int,
 Emp_Name varchar(55),
 Emp_Sal money,
 Audit_Action varchar(100),
 Audit_Timestamp datetime
)
-----------------------------------------------------------------------------------------
select * from Employee_Demo_Audit;
-----------------------------------------------------------------------------------------

create trigger Emp_demo_trigger On contact12     --update trigger 
for update
as
declare @Emp_id int , @emp_name varchar(15), @Emp_salary money, @audit_action varchar(100)

select @Emp_id = i.contact_ID from inserted i;
select @emp_name = i.first_name from inserted i;
select @Emp_salary=i.salary from inserted i;

set @audit_action='Recoder Update'

if update (salary)
insert into Employee_Demo_Audit(emp_id,emp_name,Emp_sal,Audit_Action,Audit_Timestamp) values (@Emp_id,@Emp_name,@Emp_salary,@audit_action,GETDATE())
go
-----------------------------------------------------------------------------------------
insert into contact12 values('MAyuri','dhole','pen','mmbai','MH','Male',150)
update contact12 set Salary=50000 where first_name = 'mayur'
-----------------------------------------------------------------------------------------
alter trigger delete_Trigger On contact12         --- delete Trigger
for delete
as
declare @emp_id int , @emp_name varchar(12), @emp_sal money, @audit_action varchar(100)

select @emp_id = i.contact_id from deleted i;                      -- deleted instead of inserted
select @emp_name =i.first_name from deleted i;
select @emp_sal =i.salary from deleted i;
set @audit_action= 'deleted Data'

insert into Employee_Demo_Audit(emp_id,emp_name,Emp_Sal,Audit_Action,Audit_Timestamp)values(@emp_id,@emp_name,@emp_sal,@audit_action,GETDATE())
go
-----------------------------------------------------------------------------------------
 select * from contact12

 delete from contact12 where contact_ID=1045
 -----------------------------------------------------------------------------------------  
 ---------Instead of insert trigger---------------

alter trigger instead_insert_trigger On contact12

 instead of insert
 as
 declare @emp_id int , @emp_name varchar(20), @emp_sal money, @Audit_action varchar(20)

 select @emp_id=i.contact_id from inserted i;
 select @emp_name=i.first_name from inserted i;
 select @emp_sal= i.salary from inserted i;
 set @Audit_action ='data inserted'

 begin
 begin tran
 set nocount off

 if(@emp_sal<15000)
begin
RAISERROR('salary should be greter than 15000',16,1);
rollback; 
end
else 
begin
insert into Employee_Demo_Audit(emp_id,emp_name,Emp_Sal,Audit_Action,Audit_Timestamp)values(@emp_id,@emp_name,@emp_sal,@audit_action,GETDATE());
COMMIT; 
end
end
 -----------------------------------------------------------------------------------------  

alter trigger instead_update On contact12
 instead of delete
 as
 declare @id int, @name varchar, @salary money,@Action varchar(100)

 select @id=i.contact_ID from deleted i;
 select @name =i.first_name from deleted i;
 select @salary =i.Salary from deleted i;
 set @Action='succsessfully update';

 begin
 begin tran
 set nocount on
 if(@salary> 15000)
 begin
 raiserror ('salary should be greater than 15k',16,1);
 rollback;
 end
 else
 begin
 insert into Employee_Demo_Audit values(@id,@name,@salary,@Action,GETDATE())
 commit;
 end 
 end

 --------------------------------------------------------------------------------------------------------------
 -----Cursor--------



 select * from contact12 where contact_ID=1024

 update contact12 set Salary=25000 where contact_ID=1

 -----------------------------------------------------------------------------------------  
 delete from Employee_Demo_Audit where Emp_Name='NULL';


