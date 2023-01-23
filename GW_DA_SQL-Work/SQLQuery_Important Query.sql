---Create

----9. CASE


----Transactional Control with Delete and Truncate
	---Commit
	---Rollback Tran
	---Save Point
--PLEASE CREATE the below two tables

Create Table Geodata(
Country_Name Varchar (100),
Capitol_city Varchar (100) Not Null,
Continent Varchar (100) Not Null,
Area Decimal (10,2),
Population Integer,
GDP Decimal (10,2),
Constraint PK_Country_Name PRIMARY KEY (Country_Name))

Create Table Country(
Country_Name Varchar(100) Not Null,
No_Cities Integer,
Major_City_1 Varchar(100),
Major_City_2 Varchar(100),
Major_City_3 Varchar(100),
Edu_Percentage Decimal(10,2),
Poverty_Percentage Decimal(10,2),
Life_expectancy Integer,
Avg_Climate_temp Integer,
CONSTRAINT FK_Country_Name Foreign Key (Country_Name) REFERENCES GEODATA(Country_Name))

----Bulk Upload
Bulk Insert GeoData
From 'C:\Users\rituj\Desktop\da fall 2022\GeoData.txt'
with (Fieldterminator = ',',Rowterminator = '\n')

Bulk Insert Country
From 'C:\Users\rituj\Desktop\da fall 2022\Country.txt'
with (Fieldterminator = ',',Rowterminator = '\n')

Select * From GeoData
Select * from Country

---CASE
select country_Name,Capitol_city,continent,GDP,
Case
	When GDP > 2.0 then 'Growing Economy'
	When GDP > 1 AND GDP < 2.0 then 'Potential Growing Economy '
	When GDP = 1 then 'Support Needed'
	Else 'Mere Support Needed'
End
As 'Economy situation By Country'
From GeoData Order BY GDP

----10. Transactional Control with Delete and Truncate
	---Commit
	---Rollback Tran
	---Save Point


Select * from Student
---update student  and rollback changes
Begin Tran
update Student
set S_City = 'Detroit'
where Student_ID = 1004

Rollback Tran
---update student and commit and try rollback
Begin Tran
update Student
set S_City = 'Pineville'
where Student_ID = 1007

commit

Rollback Tran

---Delete a record from student and rollback
Select * from Student

Begin Tran
Delete from Student
where Student_ID = 1007

Rollback Tran

---Delete a record from student and  commit and try rollback
Begin Tran
Delete from Student
where Student_ID = 1007

commit

Rollback Tran

Select * from Student

---SavePoint
Insert Into Student(Student_ID,S_Fname,S_Lname,S_Address1,S_Address2,S_City,S_Zip,S_Country,S_Phone)
Values
(1007,'Savepoint','Test','234 Savepoint lane','Savepont','25252','USA',9847748978)

Insert Into Student (Student_ID, S_Fname, S_Lname, S_Address1, S_Address2, S_City, S_Zip,S_Country, S_Phone)
Values (1008, 'Savepoint','Test', '6662 Trecott Ln', 'Suite 100', 'Charlotte', '27787', 'USA', '7787786543')

Begin Tran
Save tran SP1
Insert Into Student (Student_ID, S_Fname, S_Lname, S_Address1, S_Address2, S_City, S_Zip,S_Country, S_Phone)
Values (1008, 'Savepoint1','Test', '6662 Trecott Ln', 'Suite 100', 'Charlotte', '27787', 'USA', '7787786543')
Save tran SP2
Insert Into Student (Student_ID, S_Fname, S_Lname, S_Address1, S_Address2, S_City, S_Zip,S_Country, S_Phone)
Values (1009, 'Savepoint2','Test', '6662 Trecott Ln', 'Suite 100', 'Charlotte', '27787', 'USA', '7787786543')
Save tran Sp3
Insert Into Student (Student_ID, S_Fname, S_Lname, S_Address1, S_Address2, S_City, S_Zip,S_Country, S_Phone)
Values (1009, 'Savepoint3','Test', '6662 Trecott Ln', 'Suite 100', 'Charlotte', '27787', 'USA', '7787786543')
Save tran Sp4
Insert Into Student (Student_ID, S_Fname, S_Lname, S_Address1, S_Address2, S_City, S_Zip,S_Country, S_Phone)
Values (1010, 'Savepoint4	`','Test', '6662 Trecott Ln', 'Suite 100', 'Charlotte', '27787', 'USA', '7787786543')

Select * from Student

Rollback tran SP1
Rollback tran SP2
Rollback tran SP3
Rollback tran SP4