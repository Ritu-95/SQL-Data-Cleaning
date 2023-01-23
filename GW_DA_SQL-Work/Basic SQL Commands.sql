--Create Table Student 
--Insert Record using INSERT INTO Command
--SELECT Record from Student TAble using Select Command
--Delete table Student from  Object Explorer
--Create Table Student with a change to data type for S_Phone as varchar(10)
--Insert records using Insert into command
--Create Table (Examples)
--Insert Records
--Select data with different Clauses  1.Where 
---2.Group by
---3. Into (Coping entire data into different table )
---4. Having
---5. 



--Create the table
Create table Student(
Student_ID Int,
S_Fname varchar(50),
S_Lname varchar(50),
S_Address1 varchar(50),
S_Address2 varchar(50),
S_City varchar(50),
S_Zip varchar(8),
S_Country varchar(50),
S_Phone varchar(10)
);


---Insert the data into Student Table
Insert into Student(
Student_ID,
S_Fname,
S_Lname,
S_Address1,

S_City,
S_Zip,
S_Country,
S_Phone
)
values
(1007,'Lisa','Johnson','6522 Pike tree Lane','Detroit',45644,'USA','4567654897'),
(1004,'Cathy','Gordon','652 Pike tree Lane',' ','Detroit',45644,'USA','4567654897'),
(1003,'John','Philips','652 Pike tree Lane',' ','Detroit',45644,'USA','4567654897')


--Retrieve the data from Student
Select * From Student
Select Student_ID,S_Fname,S_Lname From Student
Select Student_ID,S_Lname,S_City,S_Phone From Student

--Create a table Persons(
Create Table Persons
( 
Person_Id Int,
First_Name varchar(100),
Last_Name varchar(100),
Address varchar(255),
Country varchar(50),
DOB date
)

Select * From Persons

Insert into Persons
( 
Person_Id,
First_Name ,
Last_Name ,
Address ,
Country,
DOB 
)
Values (1004,'Parth','Saradhi','234 Tomshort Ln','USA','09/19/1967')




update Student 
 Set Student_ID = '1005'
where S_Fname ='John'

---create the Product table
Create table Products(
Product_Id Int,
product_Name varchar(100),
Supplier_Id Int,
category_ID Int,
Unit Int,
Price Decimal (10,2))

---remove the Product table completely
drop table Products

--- created Products with units varchar
Create table Products(
Product_Id Int,
product_Name varchar(100),
Supplier_Id Int,
category_ID Int,
Unit Varchar(100),
Price Decimal (10,2))

----Bulk Upload
Bulk Insert Products
From 'C:\Users\rituj\Desktop\da fall 2022\Products.txt'
with (Fieldterminator = ',',Rowterminator = '\n')


--Retrieve the data from Products
Select * From Products

---Retrieve Product_ID,Product_Name,Units from Products
Select Product_Id Int,
product_Name,
Unit,Price From Products

--------Retrieve Product_Name,Units from Products
Select 
product_Name,
Unit,Price From Products


--------Retrieve Category_ID,Units,Price from Product
Select 
category_ID,
Unit,Price From Products

----- SQL CLAUSES

Select * from Products
select count(Product_Id) from Products

-- Product with Supplier_ID = 2
Select *
From Products 
where
Supplier_Id = 2

---Retrive Product Name
Select *
From Products 
where
product_Name  = 'ABC'

--- Retrieve

Select Supplier_Id
From Products 
where
product_Name  = 'DEF'

----Retrieve Supplier_ID,Unit from Products where Category_ID =2
Select Supplier_Id, Unit
From Products 
where
category_ID=2

--Retrieve all the data from Products table where Product name = ABC and DEF
Select *
From Products 
where
product_Name  = 'DEF' OR product_Name  = 'ABC'

----Retrieve with Operators
Select *
From Products 
where
product_Name IN ('ABC','DEF','GHI')


Select *
From Products 
where
product_Name IN ('ABC','DEF','GHI')


Select *
From Products 
where
Price < 11

Select *
From Products 
where
Price > 

---Retrieve all the data from products where supplier_id =1 and Price > 20
Select *
From Products 
where
Supplier_Id = 1 AND 
Price > 20

--- ---Retrieve all the data from products where Price > 10 and Price > 20
Select *
From Products 
where
price > 10 AND price < 20

---




Select * , ROW_NUMBER() over(order by category_ID) as Row
From Products 
where
Supplier_Id = 1 or
Price > 20


Select * 
from Persons

----Retrieve the data last name =P

Select * 
from Persons
where Last_Name ='P'

Select * 
from Persons
where Last_Name Like '%i'


----Retrieve the data from person table where DOB >2000-09-01
Select * 
from Persons
where DOB > '2000-09-09'

Select * 
from Persons
where DOB > '1967-sep-19'

----Student table data where 

Select * 
from 
Student
-----
Select Student_ID,S_Lname,S_City,S_Zip  
from 
Student
where S_Zip  > 28277

Select Student_ID,S_Lname,S_City,S_Zip  
from 
Student
where S_Zip  > '28277'

----Retrieve all the data from Student table where Student_ID >1003 and <1006

Select *
from 
Student
where Student_ID > 1003 AND Student_ID < 1006

Select *
from 
Student
where Student_ID >= 1003 AND Student_ID <= 1006

Select *
from 
Student
where Student_ID >= 1003 AND Student_ID < 1006


----Group By
Select  Count(Student_ID) as Students,S_Zip
from 
Student
group by S_zip


Select category_ID ,Sum(Price) as Sum_of_Prices
from Products
group by category_ID



Select category_ID ,Sum(Price) as SumofPrices
from Products
group by category_ID
--- All Coulums are required in group by

Select category_ID ,Supplier_ID,Sum(Price) as Sum_of_Prices
from Products
group by Supplier_ID,category_ID

Select Supplier_ID,Avg(Price) as 'Avg of Prices'
from Products
group by Supplier_ID


Select category_ID,Avg(Price) as 'Avg of Prices'
from Products
group by category_ID


Select category_ID,MIN(Price) as 'Mininum of Prices'
from Products
group by category_ID

--INTO clause
--Create a table Products_Sub from Products table with columns Product_Id,Product_Name,Supplier_Id,Price

Select * Into Product_Sub from Products

select * from Product_Sub

Select Product_Id,product_Name,Supplier_Id,Price 
Into Product_Sub1
from Products

select * from Product_Sub1

---Create table product_sub2 from product table with rows where category_Id=2
Select *
Into Product_Sub2
from Products
where category_ID = 2

select * from Product_Sub2 
select * from Products
---Select all the data from Student table into Student_Temp1

Select *
Into Student_Temp1
from Student

Select * from Student_Temp1
----With limited columns and where clause
Select Student_ID,S_Fname,S_Lname,S_Address1,S_City,S_Zip,S_Country
Into Student_Temp2
from Student 

Select * from Student_Temp2

Select Student_ID,S_Lname,S_City,S_Country
Into Student_Temp3
from Student 
where S_City = 'Charlotte'

Select * from Student_Temp3


 ---If dbo.Student_Temp4  exits then drop 

DROP TABLE IF EXISTS Student_Temp4
Select Student_ID,S_Lname,S_City,S_Country
Into Student_Temp4
from Student 
where S_City = 'Charlotte' 

--Retrieve the no. of products by Category_ID where no. of products are equal to 5 (Having Clause)

Select Category_ID,count(Product_Id) as 'No. of Products'
from Products 
group by category_ID
having count(Product_Id) = 5


Select Category_ID,count(Product_Id) as 'No. of Products'
from Products 
group by category_ID
having count(Product_Id) < 5

Select Category_ID,Sum(Price) as 'Sum_Price'
from Products 
group by category_ID
having  Sum(Price) < 60


Select Category_ID,Sum(Price) as 'Sum_Price'
from Products 
group by category_ID
having  Sum(Price) > 110


Select Category_ID,Sum(Price) as 'Sum_Price'
from Products 
group by category_ID
having Sum(Price) < 60 Or  Sum(Price) > 130

----Order by Clause
Select *
from Products 
Order By Price ASC ---By Default

Select *
from Products 
Order By Price DESC

Select * 
from Student
order by S_Fname Desc

Select * 
from Student
order by S_City 

Select * 
from Student
order by S_City Desc

Select * 
from Persons
order by First_Name Desc


Select * 
from Persons
order by Person_Id Desc


---Splitting the address ----
-- Using LEFT , Substing , CharIndex these are build in string functions

SELECT  Address,
LEFT(Address,4) AS 'House_No.'
FROM Persons


SELECT  Address,
LEFT(Address,CHARINDEX(' ', Address)) AS House_No,
SUBSTRING(Address,CHARINDEX(' ', Address) ,LEN(Address)-CHARINDEX(' ', Address)) As House_Lane
FROM Persons






----String Functions  Varchar data types string functions will work
---String Functions

---Lower()
Select Lower('GOODWILL DA') As Lowercase
Select Lower('GOODWILL Da Class') As Lowercase

---Upper()
Select Upper('GOODWILL DA') As Lowercase
Select Upper('GOODWILL Da Class') As Lowercase

--Trim() Trims the preceedings and trailing spaces
Select ('    GOODWILL DA     ') As No_Trim,trim('       GOODWILL DA   ') As Trim
Select trim('    GOODWILL DA   '+'Test') As Trim

--Ltrim

--Rtrim


--String_Split() This function will split a target string by a spearator
select value from string_split('This is a, split string test',',') as Splitstring
Select value from string_split('This is a-split string test','-') as Splitstring
Select value from string_split('This is a split string test',' ') as Splitstring
Select value from string_split('This is a sp$lit string test','$') as Splitstring
Select value from string_split('This is a @split string test','@') as Splitstring
Select value from string_split('This is a split string test','i') as Splitstring

Select * from string_split('This is a split string test','i') as Splitstring6

---Replace()
--this functions will replace a specified string with the another specified string within the function
Select Replace ('Replace Test','Test','Jhon') as ReplaceFunction
Select Replace ('Replace Test','T','Jhon') as ReplaceFunction
Select Replace ('Replace Test','T','B') as ReplaceFunction

--Reverse()
Select Reverse('test') as ReverseFunction
Select Reverse('Reverse test') as ReverseFunction
Select Reverse('GW DA Class') as ReverseFunction

--Difference() Difference (Character_expression, Character_expression)
--0 indicates Weak or no similarity , 4 indicate strong similarity or identical value
Select difference('Word','Word') as Diff_Function
Select difference('Werd','Word') as Diff_Function
Select difference('Word','Wordrap') as Diff_Function
Select difference('Word','Worrap') as Diff_Function
Select difference('Word',' ') as Diff_Function
Select difference('Word','1234') as Diff_Function -- outcome 0
Select difference('Word',' Class') as Diff_Function --- outcome 0
Select difference('Ritu','Sharma') as Diff_Function
Select difference('GW DA Class','GW12345') as Diff_Function

--Replicate()
Select Replicate(' DA',6) as ReplicateFunction
Select Replicate(' 123456',10) as ReplicateFunction
Select Replicate(' This GW Test for DA',4) as ReplicateFunction

--- Translate() -Translate (inputstring,characters,translations) -- matches by charaters with charaters and replace


Select Translate('Word1','1','s') as Translations
Select Translate('Word1','o','0') as Translations
Select Translate('Words are bigger','bigger','smaler') as Translations
Select Translate('GW DAS CLASS','DAS','JAV') as Translations
Select Translate('GW DAS CLASS For DAS','DAS','SQL') as Translations  
Select Translate('3*[8-4]/{6+4}','[]{}','()()') as Translations  --3*(8-4)/(6+4)
Select Translate('3*[8-4]/{6+4}','-+/','***') as Translations --3*[8*4]*{6*4}

---Difference between Translate and replace  observe the string is replaced
Select REPLACE('GW DAS CLASS For DAS','DAS','SQL') as ReplaceGW

----Arithmetic Functions:
Select Abs(-23) as AbsoluteValue
Select Abs(+23) as AbsoluteValue
Select Abs(-78736698) as AbsoluteValue

Select CEILING(32.12) as Ceilings
Select CEILING(32) as Ceilings

Select Floor(32.08) as Floorx
Select Floor(32.90) as Floorx
Select Floor(-32.55) as Floorx

---Exp() Function returns e raised to the power of a specified number
Select Exp (2) as ExpEx
Select Exp (3) as ExpEx
Select Exp (4) as ExpEx
Select Exp (1) as ExpEx

---Square() - Function  returns square of a numbere 
Select Square(2) as Square
Select Square(2) as Square
Select Square(92) as Square

----Sqrt() - Function returns the square of a number

Select SQRT(2) as SQRT
Select SQRT(16) as SQRT
Select SQRT(81) as SQRT

---Power() - returns the value of a number raised to the power of another number
Select Power(2,3) as Power
Select Power(4,3) as Power
Select Power(2,2) as Power

--Boolean Operators:
	---AND
	---OR
	---IN
	---Between
	---Not
	---Like
	---Exists
	---ALL
	---ANY


--
Select * from Student
---AND
---First name Mark city Charlotte retrieve the records
Select * from Student
where S_Fname ='Mark' and S_City = 'Charlotte'
-- Retrieve data where the first name is Steve and zip code  is 68903
Select * from Student
where S_Fname ='Steve' and S_Zip =68903 ---No records 

--OR
Select * from Student
where S_City = 'Pineville' Or S_City = 'Charlotte'

Select * from Student
where S_Fname ='Mark' or S_Fname ='Jhon'

--IN & NOTIN
---Select All data from S_City charlotte,Detroit,Pineville
Select *
from Student
where S_City IN('Charlotte','Detroit','Pineville')
Select *
from Student
where S_Fname IN('Mary','Steve','Cathy')

--NOT IN
Select *
from Student
where S_City NOT IN('Charlotte','Detroit','Pineville')

Select *
from Student
where S_Fname Not in('Mary','Steve','Cathy')

--Between works with range of vaules
Select *
from Student
where Student_ID between 1001 and 1005

Select *
from Student
where Student_ID between 1001 and 1005
order by S_City

Select *
from Student
where Student_ID between 1001 and 1005
order by S_City Desc

---Bulk insert from Excel .csv file we can do with .csv only

CREATE TABLE Products2(
	Product_ID int NULL,
	Product_NAME varchar(50) NULL,
	Product_SUBCATEGORY varchar(50) NULL,
	Product_SUBCATEGORY_ID int NULL,
	Product_CATEGORY varchar(50) NULL,
	Product_CATEGORY_ID int NULL,
	Product_COST decimal(18,2) NULL,
	Product_BEGIN_DATE datetime NULL
)

Select *
From Products2


Bulk Insert Products2
From 'C:\Users\rituj\Desktop\da fall 2022\Products.csv'
WITH
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)

-----String Operators 
Select *
From Student
---Find the first name starting with C
Select *
From Student
where S_Fname like 'C%'
--- Find the City starting with De
Select *
From Student
where S_City like 'DE%'
---First  C and last E
Select *
From Student
where S_City like 'C%e' 
---LAst name Ending M
Select *
From Student
where S_Fname like '%N' 
--Middle Last name like 
Select *
From Student
where S_Lname like '%OR%' 

Select *
From Student
where S_Fname like '_R%' 

Select *
From Student
where S_Fname like '__R%' 

Select *
From Student
where S_Fname like '%t%' 

Select *
From Student
where S_Fname like 'M__%' 

Select *
From Student
where S_Fname like 'M___%'

Select *
From Student
where S_Lname like 'M__%'

Select *
From Student
where S_Fname like 'L____%'

Select *
From Student
where S_Fname like 'L___%'

Select *
From Student
where S_Fname NOT like 'L__%'

----Very Important CAST
--Cast() conversion function converts value into a specified datatype.

Select CAST(45.55 as varchar) as Castfunction

Select 'Total Amount: '+ 45.55  --- shows an error as 45.55 is an integer
Select 'Total Amount: '+ CAST(45.55 as varchar)

Select *
From Student

Select Student_ID +'is'+ S_Fname from Student --- Show an error
Select Cast(Student_ID as Varchar) +' is '+ S_Fname  from Student

Select * from Products2

Select Product_ID + 'is' + Product_Name + 'Part of group' + Product_SubCategory
From products2 
where Product_Category ='Hardware'---Conversion failed when converting the varchar value 'is' to data type int

Select Cast(Product_ID as varchar) + ' is ' + Product_Name + ' Part of group ' + Product_SubCategory
From products2 
where Product_Category ='Hardware' ---Cast example No error

--Convert()
Select CONVERT(varchar,34.56)as string
Select CONVERT(varchar,34.56) + ' Has converted to varchar' as CONVERTEX

Select CONVERT( varchar,Product_ID) + ' is ' + Product_Name + ' Part of group ' + Product_SubCategory
From products2 
where Product_Category ='Hardware' ---CONVERT example No error

Select * 
From Student

Select CONVERT(varchar,Student_ID) + ' is '+ S_Fname +' ' + S_Lname + ' '
		+S_Address2+' ' + ', '+S_City as Students
	From Student---


	---Delete

Select *
From Product_Sub

---Delete from Product_Sub with Product_name = MNO
Delete --- We don't use *
From Product_Sub
where Product_name = 'MNO'

Select *
From Product_Sub

---Delete from Product_Sub with Product_Id = 10

Delete --- We don't use *
From Product_Sub
where Product_Id = 10

---Delete from Product_Sub with Product_Id between 9 and 15
Delete --- We don't use *
From Product_Sub
where Product_Id between 9 and 15

---Delete from Product_Sub with price > 23
Delete --- We don't use *
From Product_Sub
where Price > 23

---Delete from Product_Sub with Supplier_id = 1 
Delete --- We don't use *
From Product_Sub
where Supplier_id = 1 

Truncate table Product_Sub ---Truncate evey thing  wipe out  Only Skeleton will be there

Drop table  Product_Sub

Select  * into Product_Sub --- Bring back data from One table to another table.(Table should be without Skeleton)
from Product_Sub1


--Update Command

/* update table_name
set col1= value1, col2 = value2,....
where condition  */

Select *
from Student

update Student 
Set S_Lname = 'Philips'
where Student_ID = 1004

---- update S_city as Concord for student ID 1005
update Student 
Set S_City = 'Concord'
where Student_ID = 1005

---- update S_zip as 28202 for S_City = 'Charlotte'
update Student 
Set S_Zip = 28202
where S_City = 'Charlotte'

Select *
From Student

--- update Student with S_ country = 'UK' for student_ID between 1001 and 1005 
update Student 
Set S_Country = 'UK'
where Student_ID  between 1001 and 1005

--- update Student with S_  = 'UK' for student_ID between 1001 and 1005 

update Student 
Set S_Address2 = 'Suite 100'
where S_Fname IN ('Mark','Mary','John')  















Insert into Product
( 
Product_Id,
product_Name ,
Supplier_Id,
category_ID,
Unit,
Price
)
Values (1,'ABC',1,1, )





