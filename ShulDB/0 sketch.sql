/*
Minyan
	FirstName varchar(30) not null not blank
	LastName varchar(30) not null not blank
	Telephone char(9) not null must be numbers
	DayOfWeek varchar(9) not null must be sunday-friday
--AS Date and time are combined into one column.
	TimeIn datetime not null time cannot be before 5:30 and past 11:30 am
	MinyanTime int null must be either 6,7,8,9
	TimeOut datetime not null cannot be past 12:30 am
--AS Regular cannot be a column in the table since it is based on how many times a person is in the database in the past 30 days. Therefore it cannot be included in each row. It can be a report
	Aliya decimal(6,2) null must be greater than zero
	constraint TimeOut must be greater than TimeIn
	constraint unique: FirstName, LastName, TimeIn
*/