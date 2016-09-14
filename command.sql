create database railway_management;

CREATE TABLE Train (
	Train_No INT(6),
	Name VARCHAR(25) NOT NULL,
	Seat_Sleeper INT(4) NOT NULL,
	Seat_First_Class_AC INT(4) NOT NULL,
	Seat_Second_Class_AC INT(4) NOT NULL, 
	Seat_Third_Class_AC INT(4) NOT NULL,  
	Wifi CHAR(1) NOT NULL,
	Food CHAR(1) NOT NULL,
	Run_On_Sunday CHAR(1) NOT NULL,
	Run_On_Monday CHAR(1) NOT NULL,
	Run_On_Tuesday CHAR(1) NOT NULL,
	Run_On_Wednesday CHAR(1) NOT NULL,
	Run_On_Thursday CHAR(1) NOT NULL,
	Run_On_Friday CHAR(1) NOT NULL,
	Run_On_Saturday CHAR(1) NOT NULL,
	PRIMARY KEY(Train_No)
);

CREATE TABLE Station (
	Station_Code CHAR(5),
	Station_Name VARCHAR(25) NOT NULL,
	PRIMARY KEY(Station_Code)
);

-- add constraint Arrival Time < Departure Time
CREATE TABLE Stoppage (
	Train_No INT(6), 
	Station_Code CHAR(5),
	Arrival_Time TIME,
	Departure_Time	TIME,
	PRIMARY KEY(Train_No, Station_Code),
	FOREIGN KEY(Train_No) references Train(Train_No) on delete cascade on update cascade,
	FOREIGN KEY(Station_Code) references Station(Station_Code) on delete cascade on update cascade
);


CREATE TABLE Account (
	Username varchar(15) PRIMARY KEY,
	Password varchar(20) NOT NULL,
	Email_Id varchar(30) NOT NULL,
	Address varchar(50) 
);


CREATE TABLE Contact (
	Username varchar(15),
	Phone_No CHAR(10),
	PRIMARY KEY(Username, Phone_No),
	FOREIGN KEY(Username) references Account(Username) on delete cascade 
);

-- think what will happen to Ticket table when entry of Train will be deleted
CREATE TABLE Ticket (
	Ticket_No int(10) PRIMARY KEY,
	Train_No INT(6) NOT NULL,	
	Date_of_Journey DATE NOT NULL,
	Username varchar(15) NOT NULL,	
	FOREIGN KEY(Username) references Account(Username) on delete cascade,
	FOREIGN KEY(Train_No) references Train(Train_No) on update cascade
);

CREATE TABLE Passenger(
	Passenger_Id int NOT NULL AUTO_INCREAMENT,
	First_Name varchar(20) NOT NULL,
	Middle_Name varchar(20),
	Last_Name varchar(20) NOT NULL,
	Date_of_Birth DATE NOT NULL,
	Gender CHAR(1) NOT NULL,
	Coach CHAR(4) NOT NULL,
	Seat_No int NOT NULL,
	Phone_No CHAR(10), 
	Ticket_No int(10) NOT NULL,
	PRIMARY KEY(Passenger_Id),
	FOREIGN KEY(Ticket_No) references Ticket(Ticket_No) on delete cascade		
);

	

-- Commands

select	Train_No,
	Name,
	Seat_Sleeper,
	Seat_First_Class_AC,
	Seat_Second_Class_AC,
	Seat_Third_Class_AC,
	Wifi,
	Food from Train;

select	Train_No,
	Run_On_Sunday,
	Run_On_Monday,
	Run_On_Tuesday,
	Run_On_Wednesday,
	Run_On_Thursday,
	Run_On_Friday,
	Run_On_Saturday from Train;

select * from Station;
select * from Stoppage;
select * from Account;
select * from Contact;
select * from Ticket;
select * from Passenger;



