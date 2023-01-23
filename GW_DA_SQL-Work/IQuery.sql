Create table Table1
( num int)

Create table Table2
( num int)

Insert into table2 (num)values(1)
Insert into table2 (num)values(1)
Insert into table2 (num)values(2)
Insert into table2 (num)values(2)
Insert into table2 (num)values(4)

Delete from Table2 where num= 0
Insert into table2 (num)values('NULL')

Select * from Table1
Select * from Table2

Alter table Table2 alter column num nvarchar(25)
Alter table Table1 alter column num nvarchar(25)

---NO. Of records returned for Inner Join (8 rows)
Select *
from Table1 t1
join Table2  t2
on t1.num = t2.num

---NO. Of records returned for Left Join( 11 rows)
Select * 
from Table1 t1
left Join table2 t2
on t1.num = t2.num

---NO. Of records returned for Right Join( 10 rows)
select *
from Table1 t1
right join table2 t2
on t1.num = t2.num

---NO. Of records returned for Full Outer Join(13 rows)
Select * 
from Table1 t1
full outer join table2 t2
on t1.num = t2.num


---NO. Of records returned for cross Join(42 rows)
Select * 
from Table1 t1
cross join table2 t2

----In SQL NULL in a table cannot be same . One Null in one table1 is different from Table2 null.
---SQL never matches null it returs 0