--- 1.Update Exercise
-- 2.Column Alias and Table Alias
-- 3.MERGE Command
-- 4.Select Top
-- 5.Distinct
-- 6.Rename
-- 7.CASE
-- 8. Transaction Control with Delete and Truncate
      -- Commit
      -- Rollback Tran
      -- Save Point (edited)
	  

--Merge
--This command will merge tow tables(Update target with sourcw data) by looking for 
--

CREATE TABLE EMP_Merge_Source
(Emp_Id Int,
Emp_Name Varchar(50),
Emp_City Varchar(50),
Emp_Zip Int,
Emp_Age Int)

CREATE TABLE EMP_Merge_Backup
(Emp_Id Int,
Emp_Name Varchar(50),
Emp_City Varchar(50),
Emp_Zip Int,
Emp_Age Int)

----Bulk Upload
Bulk Insert EMP_Merge_Source
From 'C:\Users\rituj\Desktop\da fall 2022\EMP_Merge.txt'
with (Fieldterminator = ',',Rowterminator = '\n')

----Bulk Upload
Bulk Insert EMP_Merge_Backup
From 'C:\Users\rituj\Desktop\da fall 2022\EMP_Merge.txt'
with (Fieldterminator = ',',Rowterminator = '\n')

Select * from Emp_Merge_Source

Select * from EMP_Merge_Backup
--Must use source table
-- Update a record in Source table (Update EmpID 103 with Emp_City Charlotte, Emp_Zip to 28262)
Update Emp_Merge_Source Set Emp_City = 'Delhi', Emp_Zip ='00909' where Emp_Id = 105
-- Update a record in Source table (Insert a new record 109 Steve Stokes, Nashville, 38515, 45)
Insert into Emp_Merge_Source(Emp_Id ,Emp_Name,Emp_City, Emp_Zip, Emp_Age)
Values (106, 'Jobs', 'Nashville', 38515, 45)
Insert into Emp_Merge_Source(Emp_Id ,Emp_Name,Emp_City, Emp_Zip, Emp_Age)
Values (111, 'Jobs', 'Nashville', 38515, 45)
Insert into Emp_Merge_Source(Emp_Id ,Emp_Name,Emp_City, Emp_Zip, Emp_Age)
Values (112, 'Jobs', 'Nashville', 38515, 45)
--Delete a record from source table (Delete Record 106)
Delete from Emp_Merge_Source where Emp_Id = 109
Delete from Emp_Merge_Source where Emp_Id = 106


Merge Emp_Merge_Backup T Using Emp_Merge_Source S
On (S.Emp_id = T.Emp_Id)
When Matched Then
Update Set
T.Emp_Name = S.Emp_Name,
T.Emp_City = S.Emp_City,
T.Emp_Zip = S.Emp_Zip,
T.Emp_Age = S.Emp_Age
When Not Matched By Target
Then Insert (Emp_Id,Emp_Name,Emp_City,Emp_Zip, Emp_Age)
Values (S.Emp_Id,S.Emp_Name,S.Emp_City,S.Emp_Zip, S.Emp_Age)
When Not Matched by Source
Then Delete;

----The MERGE statement attempted to UPDATE or DELETE the same row more than once. This happens when a target row matches more than one source row. A MERGE statement cannot UPDATE/DELETE the same row of the target table multiple

---4.SELECT TOP 

Select TOP 5 * from EMPLOYEE
Select TOP 10 * from EMPLOYEE

Select Top 5 Emp_Zip, count(Emp_ID) as EmpIDsByZIP
from EMPLOYEE
group by Emp_Zip
order by EmpIDsByZIP 

Select Top 5 Emp_Zip, count(Emp_ID) as EmpIDsByZIP
from EMPLOYEE
group by Emp_Zip
--order by EmpIDsByZIP 
Having count(Emp_ID) > 2

----5. Distinct

Select * from EMPLOYEE
Select Distinct Emp_FName from  EMPLOYEE
Select Distinct Emp_FName, Emp_City from  EMPLOYEE
Select Distinct Emp_City from  EMPLOYEE

----6.Find out the highest and lowest Salary from Employee Table
Select Max(Emp_Sal) as Highest_Sal from Employee
Select Min(Emp_Sal) as Lowest_Sal from Employee


---Another way of selecting Highest and Lowest Salary
Select Top 1 Emp_Sal as Highest_Salary from Employee order by Emp_Sal Desc
Select Top 1 Emp_Sal as Highest_Salary from Employee order by Emp_Sal 

-----7. Find out the 2 nd highest salary from Employee Table
--Step 1: Select top 2 Salaries from Employee table  order by desc
--Step 2: Select top 1 Salaries from above result(Step1)  order by ASC
Select top 1 * from EMPLOYEE
Where Emp_Sal in
			(Select Distinct top 2 Emp_Sal from Employee Order by Emp_Sal DEsc)
				order by  Emp_Sal Asc
-----8. Find out the 3 rd highest salary from Employee Table

Select top 1 * from EMPLOYEE
Where Emp_Sal in
			(Select Distinct top 3 Emp_Sal from Employee Order by Emp_Sal DEsc)
				order by  Emp_Sal Asc

Select  Emp_Sal from Employee order by Emp_Sal 

--- Find out the second lowest sal
Select top 1 * from Employee
where Emp_Sal in(
			Select Distinct top 2 Emp_Sal
			from EMPLOYEE
			order by Emp_Sal )
				order by Emp_Sal Desc
----2 nd highest Salary
Select Max(Emp_Sal) from EMPLOYEE
Where Emp_Sal NOt in(
Select Emp_Sal as Highest_Sal from Employee
order by Emp_Sal Desc)

-----6. Raname
 exec sp_rename 'Persons','Person_renametest'
  exec sp_rename 'Person_renametest','Persons'
  --can renme column also in a table
   exec sp_rename 'Persons.DOB','Persons.Person_renameDOBtest'
   exec sp_rename 'Persons.Person_renameDOBtest','Persons.DOB'--- Sql Error

-----7.Case
Select Emp_id,Emp_Fname,Emp_Lname,Emp_Sal,
	case 
		When Emp_Sal >8000 then 'Salary above market'
		When Emp_Sal >600 then 'Salary per  market'
		Else 'Sal below market'
	End
	as 'Salary Ranking'
from Employee