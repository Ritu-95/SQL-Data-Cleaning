--JOINS :
--Joins are used to retrieve data from two or more related tables in SQL Server.
--These tables are related each other using Foreign Key Constraint.
-- Types of Joins
-- 1.Join or Inner Join
-- 2.Ourter Join
	 -- Left Join OR Left Outer Join
	 -- Right Join OR Right Outer Join
	 -- Full Join OR Full Outer Join
-- 3.Cross Join

Select * from EMPLOYEE
Select * from EMP_DEPARTMENT


---Ineer Join or join
Select Emp_ID,Emp_FName,Emp_Lname,Emp_City,Emp_Sal,Dept_Name,Dept_City
from EMPLOYEE
Inner Join Emp_Department
on EMPLOYEE.Dept_Id = EMP_DEPARTMENT.Dept_Id

Select Emp_ID,Emp_FName,Emp_Lname,Emp_City,Emp_Sal,Dept_Name,Dept_City
from EMPLOYEE
Join Emp_Department
on EMPLOYEE.Dept_Id = EMP_DEPARTMENT.Dept_ID

---Left Outer join
Select Emp_ID,Emp_FName,Emp_Lname,Emp_City,Emp_Sal,Dept_Name,Dept_City
from EMPLOYEE
Left outer Join Emp_Department
on EMPLOYEE.Dept_Id = EMP_DEPARTMENT.Dept_ID

Select Emp_ID,Emp_FName,Emp_Lname,Emp_City,Emp_Sal,Dept_Name,Dept_City
from EMPLOYEE
Left Join Emp_Department
on EMPLOYEE.Dept_Id = EMP_DEPARTMENT.Dept_ID

---Right Outer Join
Select Emp_ID,Emp_FName,Emp_Lname,Emp_City,Emp_Sal,Dept_Name,Dept_City
from EMPLOYEE
Right outer Join Emp_Department
on EMPLOYEE.Dept_Id = EMP_DEPARTMENT.Dept_ID

Select Emp_ID,Emp_FName,Emp_Lname,Emp_City,Emp_Sal,Dept_Name,Dept_City
from EMPLOYEE
Right Join Emp_Department
on EMPLOYEE.Dept_Id = EMP_DEPARTMENT.Dept_ID

---Full Outer
Select Emp_ID,Emp_FName,Emp_Lname,Emp_City,Emp_Sal,Dept_Name,Dept_City
from EMPLOYEE
FUll outer Join Emp_Department
on EMPLOYEE.Dept_Id = EMP_DEPARTMENT.Dept_ID

Select Emp_ID,Emp_FName,Emp_Lname,Emp_City,Emp_Sal,Dept_Name,Dept_City
from EMPLOYEE
FUll Join Emp_Department
on EMPLOYEE.Dept_Id = EMP_DEPARTMENT.Dept_ID


---CRoss Join  (DOES NOT HAVE CONDITION) cartision Product 
Select Emp_ID,Emp_FName,Emp_Lname,Emp_City,Emp_Sal,Dept_Name,Dept_City
from EMPLOYEE
cross Join Emp_Department