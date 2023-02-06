/* 
Hi I am a gabbai in a busy shul in an up and coming neighborhood. Currently I am focusing in expanding our shachris minyanim. Currently we only have 4 minyanim at 6, 7, 8, and 9.
The crowd has grown a lot and there is demand for more minyanim. The rav told me that I can't start a minyan before I am sure I can keep it going, however when I try to 
approach people about committing to a minyan, people find it too hard. Instead I would like to create a database consisting of the people in shul at any given time in the morning and 
figure out my minyanim off that.

I want to record the name of every person, telephone #, time he walked in to shul, which minyan he davened in, and the time he left shul (this info will be kept strictly confidential).
I also need the date, day of week, and a column showing if he is a regular in the shul. A regular means that he is in shul more than 16 weekdays, in the past 30 days. 
As long as I am anyways setting up a database, I would like to add in a column showing if that person brought an aliya, and if yes for how much.

Questions: 
1) Is there a start time and end time for the database?
    A: Well we are only doing shachris so the latest time (bdieved) would be 30 min before midday (11:30). Anyone coming in after 11:30 is not entered at all. Anyone leaving after 12:30 
    should be counted as left at 12:30.
    In the morning we will start arrival time at 5:30, anyone coming in earlier will count as 5:30. 

2) Are we doing shabbos and yum tov?
    A: No

3) Is there income every day?
    A: No, usually its only Monday and Thursday, however on Rosh Chodosh and Chol Hamoed it can be any day.

4) Can a person be counted twice on one day?
    A: No, we count the first time he walked in and the last time he walked out (the rest of the time he was probably in the mikvah).

5) Can a person daven in more than 1 minyan?
    A: Strictly speaking yes, however for our purposes we count the minyan he started in. 

6) Can a person daven in a minyan starting before he walked in?
    A: Unfortunately, yes.

7) Can a person come into shul without joining a minyan?
    A: Yes, those are prime targets for new minyanim.

Reports:
1) On Sunday only, how many people in shul arrived between 10 and 11
2) On Sunday only, how many people in shul arrived between 11 and 12
3) On Sunday only, how many people arrived in shul at :15 (any hour), sort by hour
4) 5) 6) Same as above however show weekdays only, excluding Sunday
7) How many people were in shul for over 2 hours, sort by day of week and only include regulars
8) How long did regulars wait around until is minyan started on average. Also show the max and min. Do not count anyone that joined a minyan which started before he arrived.
9) Show a list of people that waited more than 30 min for their minyan to start, show the name and minyan.
10) Show a list of people that joined a miyan that started before they arrived or didn't join a minyan at all. I don't need the names only time arrived and minyan joined.
11) Show the amount of money that came in today
12) Show the top ten spenders on Aliyas 


Sample Data:
Name, Telephone, Date, Day, Time in, Davened in Minyan, Time out, Is regular, Brought an aliya
Avrum Y. Tenenbaum, 845-857-6585, 2023-02-02, Thursday, 7:00 am, 7,  8:30 am, ?, $40
Yankov Zitorski, 845-245-8585, 2023-02-02, Thursday, 7:15 am, 8,  9:20 am, ?, $10
Shmuel Fuerst, 773-221-5260, 2023-02-02, Thursday, 5:45 am, 6, 7:10 am, ?, --
David Shnell, 212-585-1285, 2023-02-02, Thursday, 7:20 am, 8,  8:50 am, ?, --
Avrum Zirkin, 506-757-8243, 2023-02-02, Thursday, 9:10 am, 9,  10:30 am, ?, $26
Shimon Fuchs, 845-524-4253, 2023-02-02, Thursday, 8:15 am, 9,  9:05 am, ?, --
Burech Klein, 845-857-2569, 2023-02-02, Thursday, 6:40 am, 7,  8:20 am, ?, --
Yisroel A. Jaccob, 845-425-7597, 2023-02-02, Thursday, 8:25 am, 9,  9:45 am, ?, --
Efraim Greenberg, 845-854-9785, 2023-02-02, Friday, 7:50 am, 8,  8:55 am, ?, $18
Simcha Bunin, 206-768-5261, 2023-01-29, Sunday, 10:20 am, --,  11:35 am, ?, --
Yisroel Carcoos, 845-245-8230, 2023-01-29, Sunday, 11:15 am, --,  12:30 pm, ?, --

Take any 3 names and add them in at least 16 times (with different dates) in the past 30 days to make them regulars
*/