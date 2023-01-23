 --1.Update Exercise
-- 2.Column Alias and Table Alias
-- 3.MERGE Command
-- 4.Select Top
-- 5.Distinct
-- 6.Rename
-- 7.CASE
-- 8. Transaction Control with Delete and Truncate
      -- Commit
      -- Rollback Tran
      -- Save Point
	  Select * from Products
	  --Update Product_Name to BOX for Product _ID =1
	  update Products
	  set product_Name = 'BOX'
	  Where Product_ID = 1

	  ----Update Product_Name to Bottle for  for Product _ID =2
	   update Products
	  set product_Name = 'Bottle'
	  Where Product_ID = 2
	  -- ----Update Supplier to 2 for product_Name= 'PQR' 
	     update Products
	  set Supplier_id = 2
	  Where product_Name = 'PQR'
-- ----Update Category_Id to 3  for product_Id= 10
    update Products
	  set Category_Id = 3
	  Where product_Id = 10
-- ----Update Category_Id to 3  and Supplier _id to 2 for product_Id= 11
    update Products
	 Set Supplier_Id = 2,
	 category_ID = 3
	  Where product_Id = 11 

---Column Alias and Table Alias
Select * from EMPLOYEE
Select * from EMP_DEPARTMENT

--Retrieve Emp_ID,Emp_Fname,Emp_Lname from Employee who are all workinh in Dept_Name ='Compliance'

Select Emp_ID,Emp_Fname,Emp_Lname,Emp_Sal from EMPLOYEE
where Dept_Id in (
				Select Dept_id from EMP_DEPARTMENT
				where Dept_Name ='Compliance')

--Retrieve Emp_ID,Emp_Fname,Emp_Lname,Emp_Sal,Dept_Id, Dept_Name from Employee  and Emp _Department 
--who are all workinh in Dept_Name ='Compliance'

Select e.Emp_ID,e.Emp_Fname,e.Emp_Lname,e.Emp_Sal,ed.Dept_Id,ed.Dept_Name
from EMPLOYEE  e, EMP_DEPARTMENT ed
where ed.Dept_Name ='Compliance' and e.Dept_Id = ed.Dept_Id

Select * from EMPLOYEE
where Dept_Id = 1008

-----Retrieve Emp_ID,Emp_Fname,Emp_Lname,Emp_Sal,Dept_Id, Dept_Name from Employee  and Emp _Department 
--who are all workinh in Dept_City ='Brentwood'
Select e.Emp_ID,e.Emp_Fname,e.Emp_Lname,e.Emp_Sal,ed.Dept_Id,ed.Dept_Name,ed.Dept_City
from EMPLOYEE  e, EMP_DEPARTMENT ed
where ed.Dept_City ='Brentwood'and e.Dept_Id = ed.Dept_Id

-----Retrieve Emp_ID,Emp_Fname,Emp_Zip,Dept_State from Employee  and Emp _Department 
--who are all workinh in Department  HR&Training and/ or Compliance
Select e.Emp_ID,e.Emp_Fname,e.Emp_Zip,ed.Dept_City,Ed.Dept_State
from EMPLOYEE  e, EMP_DEPARTMENT ed
where ed.Dept_Name in ('HR&Training','Compliance')
and e.Dept_Id = ed.Dept_Id

---retrieve Emp_ID,Emp_Fname,Emp_Lname,Emp_Sal,Phone_No from Employee, Emp_Department,Dept_Location
--Where Employees working in department_Name = Treasury.
Select e.Emp_ID,e.Emp_Fname,e.Emp_Zip,ed.Dept_Name,dl.Phone_No
from EMPLOYEE  e, EMP_DEPARTMENT ed, Dept_Location dl
 where ed.Dept_Name = 'Treasury'
 and
 e.Dept_Id = ed.Dept_Id
 and
 ed.Dept_City = dl.Department_City


 
---retrieve Emp_ID,Emp_Fname,Emp_Lname,Emp_Sal,Dept_Id,Dept_Name,Dept_Name ,Dept_City,Addr1,Phone_No
---,Phone_No from Employee, Emp_Department,Dept_Location  from Employee, Emp_De[artmentr,Dept_Location for 
---Employee who is having Emp_sal >5000 and Dept_Name in Treasury and Mechanical

Select e.Emp_ID,e.Emp_Fname,e.Emp_Zip,ed.Dept_Name,dl.Department_City,dl.Addr1,dl.Phone_No
from EMPLOYEE  e, EMP_DEPARTMENT ed, Dept_Location dl
where E.Emp_Sal >9000 
and ed.Dept_Name in ('Treasury','Mechanical')
 and
 e.Dept_Id = ed.Dept_Id
 and
 ed.Dept_City = dl.Department_City

