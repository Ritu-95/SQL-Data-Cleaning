---INDEX
----clustered non clustered Index
---SQL Table can have only one Clustered Index -- Interview 
---with PK its default

--NC Index stored at different place


/*
Indexes will be used in SQL Server extensively for the purpose of faster retrieval of data without spending time on searching for
the required data set. Tables or Views without indexes will be inefficient with large datasets. Indexes are two types in SQL
Server.
1. Clustered Index
2. Non-Clustered Index
• Clustered & Non-Clustered Indexes
• Existence of an index in a table or view will ease the search
• Having the proper indexes on tables will enhance the performance of scans on a table or view
• Scan/Searching a Table or View will have a bad performance
• Database will have to go through entire table data to get the requested data
Creating an Index:
Create Index IX_Employee_EmpSal
On Employee (Emp_Sal ASC)
• The index on Emp_Sal will sort the data in ascending order and add an address to each sal row for an easy search
• The above Index will create Non Unique, Non-Clustered Index
• We can find the Indexes using a system stored procedure Sp_HelpIndex
• We can drop an index using Drop Command
An Index by default will be Non-Clustered Index, unless specified as Clustered. The above
index IX_Employee_EmpSal will be a Non-Clustered Index
Clustered Indexes:
• Clustered Index orders the data in the physical order
• Primary Key constraint on the table by default will create a Clustered Index (see Emp_Id from Employee to be
PK with Clustered Index)
• Only one Clustered index is allowed on each table
• One Clustered Index can have multiple columns, called as composite Clustered index
• Non-Clustered indexes can also have multiple columns, called as Composite Non-Clustered Index
Non-Clustered
A non-clustered index doesn’t sort the physical data inside the table. In fact, a non-clustered index is stored at
one place and table data is stored in another place.
• Non-Clustered indexes are stored different place from the original table data
• The index will have pointer address to the data in the table
• Create an index on the FName of Employee
• It will store FName in the order with address of the data in the table
• We can create any number of Non-Clustered indexes in the table
*/


Select * Into Employee_Temp from EMPLOYEE
--Copies the table struture and data but does not copy Constraints
Select * from Employee_Temp

--Delete 103,110,127
Delete from Employee_Temp
where Emp_ID  in (103,110,127)

Insert into Employee_Temp(Emp_Id, Emp_Fname, Emp_Lname, Emp_City, Emp_Zip,Emp_Sal, Dept_Id)
Values(103,'oneofThree','Test CI','Alan Town',28277,28000,1002)

--create Clustered Index on the Emp_ID --- Always goes on sequence
create Clustered Index EmpID_CIX 
on Employee_Temp(Emp_ID)

Insert into Employee_Temp(Emp_Id, Emp_Fname, Emp_Lname, Emp_City, Emp_Zip,Emp_Sal, Dept_Id)
Values(141,'oneofThree','Test CI','Alan Town',28277,28000,1002)

Insert into Employee_Temp(Emp_Id, Emp_Fname, Emp_Lname, Emp_City, Emp_Zip,Emp_Sal, Dept_Id)
Values(135,'oneofThree','Test CI','Alan Town',28277,28000,1002)

Insert into Employee_Temp(Emp_Id, Emp_Fname, Emp_Lname, Emp_City, Emp_Zip,Emp_Sal, Dept_Id)
Values(138,'oneofThree','Test CI','Alan Town',28277,28000,1002)

---Create Non-Clustered Index
create NonClustered Index EmpSal_NCIX
on Employee_Temp(Emp_Sal)

---Drop Index
Drop Index Employee_Temp.EmpID_CIX
Drop Index Employee_Temp.EmpSal_NCIX

---Retrieve No_Cities,Edu_Percentage,Life Expentancy, Avg_Climate_Temp for all countries
--in Continent Africa

---Nested Query
Select  Country_Name,No_Cities,Edu_Percentage,Life_expectancy, Avg_Climate_Temp
from Country 
 where  Country_name in(
		Select Country_Name 
		from Geodata
			where  Continent ='Africa')

--Join
Select Country.Country_Name,No_Cities,Edu_Percentage,Life_expectancy,Avg_Climate_Temp
from Country 
Join  Geodata 
On  Geodata.Country_Name = Country.Country_Name and 
 Geodata.Continent ='Africa'

Select Emp_ID,Emp_FName,Emp_Lname,Emp_City,Emp_Sal,Dept_Name,Dept_City
from EMPLOYEE
Join Emp_Department
on EMPLOYEE.Dept_Id = EMP_DEPARTMENT.Dept_ID




---Table Alias
Select  c.Country_Name,c.No_Cities,c.Edu_Percentage,c.Life_expectancy, c.Avg_Climate_Temp
from Country c,Geodata g
where g.Continent ='Africa' and 
c.Country_Name = g.Country_Name
