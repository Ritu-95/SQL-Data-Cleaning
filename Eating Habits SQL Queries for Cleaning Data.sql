/*
 Cleaning Data with SQL Queries

*/

Select * 
From EatingHabits.dbo.dietary_choices


-----Checking for Duplicates ----

Select Unique_ID,count(Unique_ID)
from dietary_choices
group by unique_ID
Having count(Unique_ID)>1


------Removing duplicate rows ----Not a best practice to do , as the number is very less I'll go for it.

With dietary_choiceCTE as
(
Select *,ROW_NUMBER() over (Partition by Unique_ID Order by Unique_ID) as RowNumber
from dietary_choices
)
---Select * from dietary_choiceCTE
Delete from dietary_choiceCTE Where RowNumber >1

Select * from dietary_choices

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

-----Adding the City Column to the table


Alter Table dietary_choices
Add SurveyLocationSplit Nvarchar(255)

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


		

