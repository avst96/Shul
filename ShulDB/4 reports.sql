--1) On Sunday only, how many people in shul arrived between 10 and 11
select NumberOfPeopleBetween10And11 = count(*)
from Minyan m 
where m.DayOfWeek = 'Sunday'
and datepart(hour,m.TimeIn) between 10 and 11
--2) On Sunday only, how many people in shul arrived between 11 and 12
select NumberOfPeopleBetween11And12 = count(*)
from Minyan m 
where m.DayOfWeek = 'Sunday'
and datepart(hour,m.TimeIn) between 11 and 12
--3) On Sunday only, how many people arrived in shul at :15 (any hour), sort by hour
select NumberOfPeopleToArriveAt15 = count(*), Hour = datepart(hour, TimeIn)
from Minyan m 
where m.DayOfWeek = 'Sunday'
and datepart(minute,m.TimeIn) = 15
group by datepart(hour, TimeIn)
order by datepart(hour, TimeIn)
--4) 5) 6) Same as above however show weekdays only, excluding Sunday
select NumberOfPeopleBetween10And11 = count(*)
from Minyan m 
where m.DayOfWeek <> 'Sunday'
and datepart(hour,m.TimeIn) between 10 and 11

select NumberOfPeopleBetween11And12 = count(*)
from Minyan m 
where m.DayOfWeek <> 'Sunday'
and datepart(hour,m.TimeIn) between 11 and 12

select NumberOfPeopleToArriveAt15 = count(*), Hour = datepart(hour, TimeIn)
from Minyan m 
where m.DayOfWeek <> 'Sunday'
and datepart(minute,m.TimeIn) = 15
group by datepart(hour, TimeIn)
order by datepart(hour, TimeIn)

--7) How many people were in shul for over 2 hours, sort by day of week and only include regulars
 select m.FirstName, m.LastName, m.DayOfWeek, count(*) 
 from Minyan m  where datediff(minute, TimeIn, TimeOut) > 120 
 and datediff(day,TimeIn, getdate()) < 60 
 group by m.FirstName, m.LastName, m.DayOfWeek 
 having count(*) > 15 
 order by m.DayOfWeek
--8) How long did regulars wait around until is minyan started on average. Also show the max and min. Do not count anyone that joined a minyan which started before he arrived.
select AvgWait = avg(datediff(minute, m.TimeIn, datetimefromparts(year(m.TimeIn), month(m.TimeIn), day(m.TimeIn), MinyanTime, 0, 0, 0 ))),
       MaxWait = max(datediff(minute, m.TimeIn, datetimefromparts(year(m.TimeIn), month(m.TimeIn), day(m.TimeIn), MinyanTime, 0, 0, 0 ))),
       MinWait = min(datediff(minute, m.TimeIn, datetimefromparts(year(m.TimeIn), month(m.TimeIn), day(m.TimeIn), MinyanTime, 0, 0, 0 ))), FirstName, LastName
from Minyan m 
where datetimefromparts(year(m.TimeIn), month(m.TimeIn), day(m.TimeIn), MinyanTime, 0, 0, 0 ) > m.TimeIn
group by m.FirstName, m.LastName
--9) Show a list of people that waited more than 30 min for their minyan to start, show the name and minyan.
select m.FirstName, m.LastName, m.MinyanTime
from Minyan m 
where datediff(minute, m.TimeIn, datetimefromparts(year(m.TimeIn), month(m.TimeIn), day(m.TimeIn), MinyanTime, 0, 0, 0 )) > 30
--10) Show a list of people that joined a miyan that started before they arrived or didn't join a minyan at all. I don't need the names only time arrived and minyan joined.
select m.TimeIn, m.MinyanTime
from Minyan m 
where m.MinyanTime is null 
or datetimefromparts(year(m.TimeIn), month(m.TimeIn), day(m.TimeIn), MinyanTime, 0, 0, 0 ) < m.TimeIn
--11) Show the amount of money that came in today
select sum(m.Aliya)
from Minyan m 
where year(m.TimeIn) = year(getdate()) and month(m.TimeIn) = month(getdate()) and day(m.TimeIn) = day(getdate())
--12) Show the top ten spenders on Aliyas 
select top 10 m.FirstName, m.LastName, sum(m.Aliya)
from Minyan m
group by m.FirstName, m.LastName
order by sum(m.Aliya) desc

