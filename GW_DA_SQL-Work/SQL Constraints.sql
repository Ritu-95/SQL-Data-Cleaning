--SQL Constraints

--Primary Key --- clustered index
---Foreign Key
---Unique
---check
---Default
--Not Null

--Update(DML)
--Alter(DDL)

--Between/Order By
--Group by/ Count of
-- Sub Queries/Embedded Queries
--Create Commands
	-- Create Table
	--Create View
	--create Index
	--Create Unique Index
	--Create Database
	--Create Procedure
--Drop Commands


Create table Cust_Department
(Dept_Id Int,
Dept_Name Varchar(50),
Dept_Loc Varchar(50)
CONSTRAINT PK_Dept_ID PRIMARY KEY (Dept_Id));

Create table Customers
(Cust_Id Int,
Cust_Fname Varchar (50),
Cust_Lname Varchar(50),
Cust_Addr1 Varchar (50),
Cust_Addr2 Varchar(50),
Cust_City Varchar(50),
Cust_Zip int,
Cust_DOB Date,
Dept_Id Int,
Cust_Basic_Sal Decimal(10,2),
Cust_Benefits Decimal(10,2),
Cust_Commision Decimal(10,2)
CONSTRAINT PK_Cust_Id PRIMARY KEY (Cust_Id),
CONSTRAINT FK_Dept_ID FOREIGN KEY (Dept_Id) REFERENCES Cust_Department(Dept_Id));

----Bulk Upload
Bulk Insert Cust_Department
From 'C:\Users\rituj\Desktop\da fall 2022\Cust_Department.txt'
with (Fieldterminator = ',',Rowterminator = '\n')

----Bulk Upload
Bulk Insert Customers
From 'C:\Users\rituj\Desktop\da fall 2022\Customers.txt'
with (Fieldterminator = ',',Rowterminator = '\n')

Select * from Cust_Department
Select * from Customers
----Bulk Upload
Insert Into Cust_Department(Dept_Id,Dept_Name,Dept_Loc)
Values(111,'Salon','North Lake')

----Retrieve data for customers between 1001 and 1005
Select * from Customers
where Cust_Id between 1001 and 1005
----Retrieve data for customers who belongs to Dept_id 104
Select * from Customers
where Dept_id = 104
----Retrieve data for Cust_Department Dept_id 104
Select * from Cust_Department
where Dept_id = 104



---Foreign Key
---Unique
---check
---Default
--Not Null

Select * from Persons
---Unique
Create Table Persons_Uniq
( 
P_Id Int,
P_Name varchar(100),
P_Age Int,
P_City varchar(255),
P_Zip varchar(50),
Constraint UQ_P_ID UNIQUE(P_Id)
)

Select * from Persons_Uniq
---Insert the data
Insert Into Persons_Uniq(P_Id,P_Name,P_Age,P_City,P_Zip)
Values(100,'Guest_Unique',34,'Charlotte',23098)---Insert data with no error


Insert Into Persons_Uniq(P_Id,P_Name,P_Age,P_City,P_Zip)
Values(100,'Guest_Unique1',35,'Charlotte',23099) ---  show an error for unique constraint

Insert Into Persons_Uniq(P_Id,P_Name,P_Age,P_City,P_Zip)
Values(101,'Guest_Unique1',35,'Charlotte',23099) 

---check
Create Table Persons_Check
( 
P_Id Int,
P_Name varchar(100),
P_Age Int check (P_Age > 18),
P_City varchar(255),
P_Zip varchar(50),
)

Insert Into Persons_Check(P_Id,P_Name,P_Age,P_City,P_Zip)
Values(101,'Guest_Unique1',35,'Charlotte',23099) ---Insert data with no error

Insert Into Persons_Check(P_Id,P_Name,P_Age,P_City,P_Zip)
Values(101,'Guest_Unique1',3,'Charlotte',23099) ----show an error for Check constraint

Select * from Persons_Check

---Default Constraint
Create Table Persons_Default
( 
P_Id Int,
P_Name varchar(100),
P_Age Int ,
P_City varchar(255) Default 'Charlotte',
P_Zip varchar(50),
)

Insert Into  Persons_Default(P_Id,P_Name,P_Age,P_Zip)
Values(101,'Guest_Unique1',3,23099) ---Insert data with no error insert Charlotte

Insert Into  Persons_Default(P_Id,P_Name,P_Age,P_City,P_Zip)
Values(100,'Guest_Unique1',3,'Charleston',23099) ---insert data with charleston 

Select * from Persons_Default

--Not Null Constraint
Create Table Persons_NotNull
( 
P_Id Int,
P_Name varchar(100),
P_Age Int ,
P_City varchar(255) Not Null,
P_Zip varchar(50),
)


Insert Into  Persons_NotNull(P_Id,P_Name,P_Age,P_City,P_Zip)
Values(101,'Guest_Unique1',3,'Charlotte',23099) ---Insert data with  No error 

Insert Into  Persons_NotNull(P_Id,P_Name,P_Age,P_Zip)
Values(100,'Guest_Unique1',3,23099) ---insert data with error  Not Null

---Drop Commands
	---Drop Column(With Alter)
	---Drop Constraint(With Alter)
	--Drop Index
	---Drop Database
	--Drop View


Create table DropTest
(DropDept_Id Int,
Dept_Name Varchar(50),
Dept_Loc Varchar(50),
Dept_Startdate date
CONSTRAINT PK_DropDeptID	
PRIMARY KEY (DropDept_Id));

Create Index IX_Dept_Name
On DropTest (Dept_Name ASC)

Select * from DropTest

Select * from dbo.Products2

----Alter command with Add will help add a col, Index,Constraint
-----Alter Comand will help drop a col, an Index,or a Constaint

---Add Column using Alter Command
Select * from DropTest
--Add Email1 to DropTest Table

Alter table DropTest 
Add Email1 Varchar(50)

Alter table DropTest 
Add Phone_No1 Varchar(10),
Phone_No2 Varchar(10)


---remove Phone_No2
--Delete a column using Alter and Drop Command
Alter table DropTest 
Drop column Phone_No2 

---Drop Index 
Drop Index DropTest.IX_Dept_Name
Drop Index DropTest.PK_DRopDeptID ---This will Show an error as this Index is part of PK

--- Drop Constraint using Alter Command
Alter Table DropTest
Drop Constraint Pk_DropDeptID

---Add Constraint Using Alter Add Command
Alter Table DropTest
Add Constraint Pk_DropDeptID Primary Key(DropDept_ID)

---Create Database
 Create Database DropTestDB
 Use  DropTestDB
 ---Drop Database
 Drop Database DropTestDB


 ---Creat table for Employee, Emp Department and Department Location Tables
 ---Building relation between three tables


 Drop Table Dept_Location
 --DEPT LOCATION Table

Create Table Dept_Location
(Department_City Varchar (30),
Addr1 Varchar(50),
Addr2 Varchar(50),
Zip_Code int,
Phone_No Varchar(10),
CONSTRAINT PK_DeptCity Primary Key (Department_City))

BULK
INSERT Dept_Location
From 'C:\Users\rituj\Desktop\da fall 2022\Dept_Location.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')


--************* EMP DEPARTMENT Table **********************

CREATE TABLE EMP_DEPARTMENT
(Dept_Id Int,
Dept_Name Varchar(40),
Dept_City Varchar(30),
Dept_State Varchar(10)
CONSTRAINT PK_Deptid PRIMARY KEY (Dept_Id)
CONSTRAINT FK_Deptcity FOREIGN KEY (Dept_City) REFERENCES Dept_Location(Department_City));
BULK
INSERT Emp_Department
FROM'C:\Users\rituj\Desktop\da fall 2022\Department.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

---***************** EMPLOYEE Table *************************
CREATE TABLE EMPLOYEE
(Emp_ID Int,
Emp_FName Varchar (50),
Emp_LName Varchar (50),
Emp_Addr1 Varchar (40),
Emp_Addr2 Varchar (40),
Emp_City Varchar (40),
Emp_Zip Int,
Emp_Sal Decimal(10,2),
Dept_Id Int,
CONSTRAINT PK_EMPID PRIMARY KEY (Emp_ID),
CONSTRAINT FK_DeptId FOREIGN KEY (Dept_Id) REFERENCES EMP_DEPARTMENT(Dept_Id));
BULK
INSERT Employee
FROM'C:\Users\rituj\Desktop\da fall 2022\Employee.txt'
WITH (FIELDTERMINATOR = ',',ROWTERMINATOR = '\n')


Select * From Employee
Select * From EMP_DEPARTMENT
Select * From Dept_Location

----Retrive All the records from Employee Table for Dept_Id = 1003

Select * From Employee
where Dept_Id = 1003
----Retrive All the records from Employee Table for Emp_zip = 28998 
Select * From Employee
where Emp_zip = 28998 
---Retrieve employee with Emp_Id between 101 and 106
Select * From Employee
where Emp_Id between 101 and 106
--Retrieve all employee working in dept_id 1001, 1004,1008
Select * From Employee
where dept_id in (1001, 1004,1008)


----Retrieve all the records from Emp_Department table for Dept_City = Charlotte
Select * From Emp_Department
where Dept_City = 'Charlotte'
---Retrieve allthe records from Emp_Department table for Dept_State = NC
Select * From Emp_Department
where  Dept_State = 'NC'
---Retrieve allthe records from Emp_Department table for Dept_State = NC



---Sub Queries/Embedded Sql / Nested Sql Commands
---The deptment name where Jhon Smith is working 

Select Dept_Name from Emp_Department
where Dept_Id in (Select Dept_Id from Employee
where Emp_ID = 101)

---Find out the Dept_Name ,Dept_City for the employee ID 105
Select Dept_Name,Dept_City from EMP_DEPARTMENT
Where Dept_ID in (Select Dept_Id from Employee
where Emp_Id =105 )

----All the employees IDs, Emp Fname, Emp _Lastname who are  working for the Dept_Name Sales 

Select Emp_ID,Emp_FName,Emp_LName from 
EMPLOYEE where Dept_Id in (
Select Dept_ID from EMP_DEPARTMENT
Where Dept_Name = 'Sales')

