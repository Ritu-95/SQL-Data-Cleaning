/*
 Cleaning  EMPLOYEE Data with SQL Queries
*/

Select * 
From EMPLOYEE


-----Checking for Duplicates ----

Select Emp_ID,count(Emp_ID) as DuplicateRecords
from EMPLOYEE
group by  Emp_ID
Having count( Emp_ID)>1


------Removing duplicate rows ----Not a best practice to do , as the number is very less I'll go for it.

With EMP_CTE as
(
Select *,ROW_NUMBER() over (Partition by Emp_ID Order by Emp_ID) as RowNumber
from EMPLOYEE
)


---Select * from EMP_CTE
Delete from EMP_CTE Where RowNumber >1

Select * from EMPLOYEE

---Standartize Day /Date 
---Rename column as Date

Select Day,CONVERT(Date,Day)
From EatingHabits.dbo.dietary_choices

update dietary_choices
set Day = CONVERT(Date,Day)

Alter Table dietary_choices
Add SurveyDate Date

update dietary_choices
set SurveyDate = CONVERT(Date,Day)

--------------------------------------------------------
-----Populate Survey Location Address 



Select * 
from dietary_choices
where SurveyLocation is NULL


Select a.Unique_ID,a.SurveyLocation,b.SurveyLocation,ISNULL(a.SurveyLocation,b.SurveyLocation)
from dietary_choices a
Join dietary_choices b
on a.Vegetarian  = b.Vegetarian
and
a.Unique_ID <> b.Unique_ID
where a.SurveyLocation is NULL


Update a
Set SurveyLocation =ISNULL(a.SurveyLocation,b.SurveyLocation) 
from dietary_choices a
Join dietary_choices b
on a.Vegetarian  = b.Vegetarian
and
a.Unique_ID <> b.Unique_ID
where a.SurveyLocation is NULL


------------Separating City from Address

Select SurveyLocation from dietary_choices

Select
SUBSTRING(SurveyLocation, 1,CharIndex('.',SurveyLocation)-1)As address,
SUBSTRING(SurveyLocation,CharIndex('.',SurveyLocation)+1,LEN(SurveyLocation))As address
from dietary_choices

-----Adding the State Column to the table

Alter Table EMPLOYEE
Add STATE Nvarchar(255)

update dietary_choices
set SurveyLocationSplit = SUBSTRING(SurveyLocation, 1,CharIndex('.',SurveyLocation)-1)

Alter Table dietary_choices
Add SurveyLocationSplitCIty  Nvarchar(255)

update dietary_choices
set SurveyLocationSplitCIty = SUBSTRING(SurveyLocation,CharIndex('.',SurveyLocation)+1,LEN(SurveyLocation))


Select *
 from dietary_choices


 -----Anotherway is to use ParseName

 ----Checking distinct count for  Choices

 Select Distinct (Flexitarian),Count(Flexitarian)
 from dietary_choices
 Group by Flexitarian
 order by  2


  Select Distinct (Plant_based),Count(Plant_based)
 from dietary_choices
 Group by Plant_based
 order by  2


 -------Delete unused Columns


 Select *
 from dietary_choices

 Alter Table dietary_choices
 drop Column SurveyLocation

  Alter Table dietary_choices
 drop Column Day


 -------Change 18-24y to 18-24 in Age_Group

 Select Age_Group
, CASE When Age_Group = '18-24y' THEN '18-24'
		When Age_Group = '25-49y' THEN '25-49'
		When  Age_Group = '50-64y' THEN '50-64'			
		When  Age_Group = '65y+' THEN '>65'
END
 from dietary_choices

 update dietary_choices
 Set Age_Group = CASE When Age_Group = '18-24y' THEN '18-24'
					When Age_Group = '25-49y' THEN '25-49'
					When  Age_Group = '50-64y' THEN '50-64'			
					When  Age_Group = '65y+' THEN '>65'
				 END

Select *
  from dietary_choices
