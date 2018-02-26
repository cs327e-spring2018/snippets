\c postgres;
drop database if exists tickit;
create database tickit;
\c tickit;

create table Users(
	userid int primary key,
	username char(8),
	firstname varchar(30),
	lastname varchar(30),
	city varchar(30),
	state char(2),
	email varchar(100),
	phone char(14),
	likesports boolean,
	liketheatre boolean,
	likeconcerts boolean,
	likejazz boolean,
	likeclassical boolean,
	likeopera boolean,
	likerock boolean,
	likevegas boolean,
	likebroadway boolean,
	likemusicals boolean);
	
create table Venue(
	venueid smallint primary key,
	venuename varchar(100),
	venuecity varchar(30),
	venuestate char(2),
	venueseats integer);

create table Category(
	catid smallint primary key,
	catgroup varchar(10),
	catname varchar(10),
	catdesc varchar(50));

create table Date(
	dateid smallint primary key,
	caldate date not null,
	day char(3) not null,
	week smallint not null,
	month char(5) not null,
	qtr char(5) not null,
	year smallint not null,
	holiday boolean);

create table Event(
	eventid int primary key,
	venueid smallint not null references Venue(venueid),
	catid smallint not null references Category(catid),
	dateid smallint not null references Date(dateid),
	eventname varchar(200) not null,
	starttime timestamp);

create table Listing(
	listid int primary key,
	sellerid int not null references Users(userid),
	eventid int not null references Event(eventid),
	dateid smallint not null references Date(dateid),
	numtickets smallint not null,
	priceperticket decimal(8,2),
	totalprice decimal(8,2),
	listtime timestamp);
	
create table Sales(
	salesid integer primary key,
	listid integer not null references Listing(listid),
	sellerid integer not null references Users(userid),
	buyerid integer not null references Users(userid),
	eventid integer not null references Event(eventid),
	dateid smallint not null references Date(dateid),
	qtysold smallint not null,
	pricepaid decimal(8,2),
	commission decimal(8,2),
	saletime timestamp);
	
