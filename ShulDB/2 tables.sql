use ShulDB
go 
drop table if exists Minyan
go

--AS Regular cannot be a column in the table since it is based on how many times a person is in the database in the past 30 days. Therefore it cannot be included in each row if the
--AS guy is a regular since it is only based on how many rows he is in.
create table dbo.Minyan(
    MinyanId int not null identity primary key,
    FirstName varchar(30) not null constraint ck_Minyan_FirstName_cannot_be_blank check(FirstName <> ''),
    LastName varchar(30) not null constraint ck_Minyan_LastName_cannot_be_blank check(LastName <> ''),
    Telephone char(10) not null constraint ck_Minyan_Telephone_must_all_be_numbers check(Telephone like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
    DayOfWeek varchar(9) not null constraint ck_Minyan_DayOfWeek_must_be_sunday_through_friday check(DayOfWeek in ('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')),
    TimeIn datetime not null constraint ck_Minyan_TimeIn_must_be_between_5_30_and_11_30_am check(format(TimeIn, 'hh:mm') between '05:30' and '11:30'),
    TimeOut datetime not null constraint ck_Minyan_TimeOut_must_be_latest_12_30_pm check(format(TimeOut, 'hh:mm') between '05:30' and '12:30'),
    MinyanTime int constraint ck_Minyan_MinyanTime_must_be_either_6_7_8_or_9 check(MinyanTime in (6,7,8,9)),
    Aliya decimal(6,2) constraint ck_Minyan_Aliya_must_be_greater_than_zero check(Aliya >= 0),
    constraint ck_Minyan_TimeOut_must_be_greater_than_TimeIn check(TimeOut >= TimeIn),
    constraint u_Minyan_FirstName_LastName_TimeIn unique(FirstName, LastName, TimeIn),
    constraint ck_Minyan_TimeIn_and_TimeOut_must_be_the_same_day check(year(TimeIn) = year(TimeOut) and month(TimeIn) = month(TimeOut) and day(TimeIn) = day(TimeOut))
)
go

