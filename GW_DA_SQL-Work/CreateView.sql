---Create Commands
	--Table
	--view
	--Index
	--Unique Index
	--Database
	--Procedure

-- A view may consist of columns from multiple tables using joins or just a subset of columns of a single table.
-- This makes views useful for abstracting or hiding complex queries.
-- Advantages of Views
-- 1.Security: Restrict users to access directly to a table and allow them to access a subset of data via views
-- 2.Simplicity: A relational database may have many tables with complex relationships
   -- e.g., one-to-one and one-to-many that make it difficult to navigate.
   -- However, you can simplify the complex queries with joins and conditions using a set of views.
-- 3.Consistency:Sometimes, there is need to write a complex formula or logic in every query.
   -- To make it consistent, you can hide the complex queries logic and calculations in views.
   -- Once views are defined, you can reference the logic from the views rather than rewriting it in separate queries.
   Select * 
   from Persons

   Create View Person_View
   as select * from Persons

   Create View Person_View1
   as Select Person_Id,First_Name,Last_Name,DOB from Persons

   select * from Person_View1

      Create View Person_View2
   as Select * from Persons
   where Person_Id between 1001 and 1002
   ---Inserting data will add to original table 
   Insert into Person_View2(Person_Id,First_Name,Last_Name,Address,Country,DOB)
   values(106,'asdasa','ioiuo','345688 Tyler St', 'USA','1967-08-20')
 
  select * from Persons
      select * from Person_View2


	   Create View Person_View3
   as Select * from Persons
      select * from Person_View3

--Deleting records from View will delete from original table also
	  Delete from Person_View2
	  where Person_Id = 1002
