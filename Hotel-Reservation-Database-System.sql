CREATE DATABASE Hotel
GO
use Hotel
Go
CREATE TABLE Customer
(
Cust_Id INT PRIMARY KEY ,
Cust_Name VARCHAR (50),
Gender VARCHAR (10),
City VARCHAR (20),
Phone VARCHAR (11)
)
Go
CREATE TABLE Room
(
Room_No INT PRIMARY KEY ,
RoomType VARCHAR (50),
Price float 
)
GO
CREATE TABLE Booking
(
Booking_No INT PRIMARY KEY ,
Room_No INT,
IN_Date Date,
Out_Date Date,
No_Of_Days INT,
Cust_ID INT,
FOREIGN KEY (Room_No) REFERENCES Room(Room_No),
FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID),
)
Go


insert into [dbo].[Customer] values (1,'Ahmed','Male','Cario','0102505545') 
insert into [dbo].[Customer] values (2,'Mohamed','Male','Cario','0102505545') 
insert into [dbo].[Customer] values (3,'Mahmoud','Male','Cario','0102505545') 

insert into [dbo].[Room] values (313,'Single','700')
insert into [dbo].[Room] values (212,'Douple','1000')
insert into [dbo].[Room] values (21,'Single','500')

insert into [dbo].[Booking] values (1,313,'10/10/2020','10/15/2020','4','1')
insert into [dbo].[Booking] values (2,212,'8/10/2020','8/15/2020','10','2')
insert into [dbo].[Booking] values (3,21,'9/10/2020','9/15/2020','20','3')

Go

UPDATE [Room]
SET Price = (Price / 100) * 15 + Price
WHERE RoomType='Douple'

GO
SELECT Room_No,RoomType,Price from Room 
GROUP BY Room_No,RoomType,Price
HAVING Price <= AVG(Price)

GO
SELECT Booking_No,Room_No,No_Of_Days,Booking.Cust_ID,Customer.Gender,Customer.Cust_Name from Booking join Customer ON
Customer.Cust_Id= Booking.Cust_ID
GROUP BY Booking_No,Room_No,No_Of_Days,Booking.Cust_ID,Customer.Gender,Customer.Cust_Name
Order By No_Of_Days
GO

SELECT Cust_Id,Room_No,IN_Date from Booking 
WHERE No_Of_Days >3

GO

Create FUNCTION RoomDetials(@temp int )
returns @t table
(
Room_No INT PRIMARY KEY ,
RoomType VARCHAR (50),
Price float 
)
as
begin
    if(@temp = 313)
	insert into @t
		select Room_No, RoomType,Price from Room 
		Where Room_No=313
		group BY 
		Room_No,RoomType,Price
	return
end

select * from RoomDetials('313')

