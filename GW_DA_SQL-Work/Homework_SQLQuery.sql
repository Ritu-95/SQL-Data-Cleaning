******************** HOME WORK ***********************************************
-- Retrive all the records from Employee table for the Dept_id = 1003
Select * from Employee
Where Dept_id = 1003
-- Retrieve all the reords from Employee tabke for Emp_Zip = 28998
Select * from Employee
Where  Emp_Zip = 28998
-- Retrieve emplyee with Empi_Ids between 101 and 106
Select * from Employee
Where  Emp_Id between 101 and 106
-- Retrieve all employees whose Emp_Sal > 9000
Select * from Employee
Where Emp_Sal > 9000
-- Retrieve All employee woriking in dept_id 1001, 1004,1008
Select * from Employee
Where dept_id in (1001, 1004,1008)
-- Select all the records from Employee whose F_Names between the letter starts with D & S Order by Emp Fname
Select * from Employee
Where Emp_FName like 'D%' or Emp_FName like 'S%'
Order By Emp_FName
-- Select all the records from Employee whose F_Names between the letter starts with J & S Order by Dept_ID
Select * from Employee
Where Emp_FName like 'J%' or Emp_FName like 'S%'
Order By Dept_id
-- Select all the employees from Employee table Order by Emp_Fname for the Employee IDs between 103 and 110
Select * from Employee
Where Emp_ID between 103 and 110
Order By Emp_Fname
-- Retrieve data from Employee table group by Emp_Zip
Select Count(*),Emp_Zip from Employee
group by Emp_Zip
-- Retrieve all the records from Emp_DEpartment table for Dept_City = Charlotte
Select * from Emp_DEpartment
Where Dept_City = 'Charlotte'
-- Retrieve all the records from Emp_Department table for Drpt_State = NC
Select * from Emp_DEpartment
Where Dept_State = 'NC'
-- Retrieve all teh records from Emp_Department table for Dept_Name in Mechanical, Treasury, Sales
Select * from Emp_DEpartment
Where Dept_Name in ('Mechanical', 'Treasury', 'Sales')
-- Retrieve all the records from department where dept name is mechanical or chemical
Select * from Emp_DEpartment
Where Dept_Name = 'Mechanical'  or Dept_Name = 'chemical'
-- Retrieve Dept_Id, Dept_Name from Department whose Dept_City is Charlotte
Select Dept_Id, Dept_Name from EMP_DEPARTMENT
Where Dept_City = 'Charlotte'
-- Retrieve Dept_Id, Emp_FName from Employee group by Dept_Id, Emp_Fname
--(Did not understood)
Select * from Employee
Select count(*) as DEP_ID,Dept_Id, Emp_FName from Employee
group by Dept_Id, Emp_Fname

-- Retrieve count of emp_id, Emp_Zip from Employee group by emp_Zip
Select count(*)As emp_count,emp_id,Emp_Zip from Employee 
group by emp_id,Emp_Zip

-- Retrieve all the data from Dept_Location for Dept_City =  Troy
Select * from Dept_Location 
where  Department_City =  'Troy'
-- Retrieve all the data from Dept_Location for Zip_Code = 88160
Select *
from Dept_Location 
where Zip_Code = 88160
-- Retrieve all the data from Dept_Location where Dept_City in Charlotte, Detroit, Troy
Select *
from Dept_Location 
where Department_City in ('Charlotte', 'Detroit', 'Troy')
-- Select Emp_ID, Emp_Fname, Emp_Lname, Emp_Sal from employee for dept_id 1009
Select Emp_ID, Emp_Fname, Emp_Lname, Emp_Sal from employee 
Where dept_id = 1009
-- Select all the records from Employee where Emp_Sal < 5000 and Dept_ID in 1002,1004,1005,1008
Select *  from employee 
Where Emp_Sal < 5000 and Dept_ID in (1002,1004,1005,1008)
-- Selelct Dept_Name, Dept_City for Employee 106
Select Dept_Name,Dept_City from [dbo].[EMP_DEPARTMENT]
where Dept_ID in(
				Select Dept_Id from Employee
				Where Emp_id = 106)
-- Select all employees who are working in Dept_City = Charlotte


Select Emp_ID,Emp_FName,Emp_LName,Dept_Id from Employee
where Dept_Id in (
				Select Dept_Id from [dbo].[EMP_DEPARTMENT]
				where Dept_City = 'Charlotte')


Select * from Employee
where Dept_Id in (
				Select Dept_Id from [dbo].[EMP_DEPARTMENT]
				where Dept_City = 'Charlotte')


-- Select dept_Name for the Emp_Lname with Dutt
Select Dept_Name from [dbo].[EMP_DEPARTMENT]
where Dept_ID in(
				Select Dept_Id from Employee
				where Emp_Lname = 'Dutt')

-- Select Emp_Fname, Emp_Sale for all employees whose dept_Name = Compliance
 Select Emp_Fname, Emp_Sal from  employee 
 where Dept_id in (
				Select Dept_Id from [dbo].[EMP_DEPARTMENT]
				where Dept_Name = 'Compliance')
************************ HOME WORK ********************************