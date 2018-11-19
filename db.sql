create database Majid;
GO

use Majid;
Go

CREATE TABLE Librians
	(LibID integer primary key,
		LibName varchar(50) not null,
		DOB date not null,
		LibStatus varchar(50) not null,
		LibGender varchar(6) not null);
Go

CREATE TABLE Publisher
	(PubID integer Primary key,
		PubName varchar(50) not null,
		PubYear integer not null);
		
GO

CREATE TABLE Author
	(AutID integer primary key,
		AuthName varchar(50) not null,
		AuthAddress varchar(50) not null);
GO

CREATE TABLE Catalogue
	(CatID integer primary key,
		CatDesc varchar(50) not null,
		CatTitle varchar(50) not null);
GO

CREATE TABLE Tag
	(TagType varchar(50) Primary key,
		TagName varchar(50) not null,
		LoanDur varchar(50) not null);
GO

CREATE TABLE Department
	(DepID integer primary key,
		DepName varchar(50) not null,
		DepEmail varchar(40) not null,
		DepPhone integer not null,
		DepLocation varchar(50) not null);
GO

CREATE TABLE Book
	(BookID INTEGER PRIMARY KEY,
	LibID integer not null
		references Librians(LibID),
	TagType varchar(50) not null
		references Tag(TagType),
	PubID integer not null
		references Publisher(PubID),
	 CatID integer not null
		references Catalogue(catID),
		ISBN INTEGER NOT NULL,
		SubjectArea VARCHAR(40) NOT NULL,
		Title VARCHAR(50) NOT NULL,
	AutID integer not null
		references Author(AutID));
GO

CREATE TABLE Members
	(MemID INTEGER PRIMARY KEY,
	 DepID integer not null
		references Department(DepID),
	BookID integer not null,
	ExpiryDate Date not null,
	 LibID integer not null
		references Librians(LibID),
		Username varchar(50) not null,
		Pass varchar(50) not null,
		MemName varchar(50) not null,
		MemGender varchar(50) not null,
		Phone integer not null,
		Email varchar(30) not null);
		
GO

create table BooksMembers
	(BookID integer not null
		references Book(BookID),
	 MemID integer not null
		references Members(MemID),
		Fine varchar(20) not null,
		DateBorrowed date not null,
		DateDue date not null);
Go

Create Table BooksAuthor
	(BookID integer not null
		references Book(BookID),
	 AutID integer not null
		references Author(AutID));
Go

Create table Reservation
	(BookID integer not null
		references Book(BookID),
	 MemID integer not null
		references Members(MemID),
		ResDate date not null);
Go

insert into Librians values (11111,'Micheal Smith','1994-12-09','inactive','Male');
insert into Librians values (22222, 'Jeniffer Cruz','1995-10-07','inactive','Female');
insert into Librians values (33333,'Mark Bridge','1990-06-16','active', 'Male');
insert into Librians values (44444,'Bob Sunny','1993-06-26','inactive','Male');
insert into Librians values (55555,'Julie Jordan','1992-05-27','active','Female');
insert into Librians values (66666,'Sarah Sharipova','1993-06-21','active','Female');
insert into Librians values (77777,'John Berry','1989-10-28','active','Male');
insert into Librians values (88888,'Engolo Kante','1994-12-07','inactive','Male');
insert into Librians values (99999,'Sozan Lee','1990-06-19','inactive','Female');
insert into Librians values (10000,'Elizabeth Teylor','1988-09-23','active','Female');
insert into Librians values (10001,'Cathrine Bright','1993-07-27','active','Female');
Go

Insert into Publisher values (100,'Prentice Hall', 2012);
Insert into Publisher values (200,'Hennry Tommy', 2012);
Insert into Publisher values (300,'Hachette Livre', 2011);
insert into Publisher values (400,'HarperCollins', 2015);
insert into Publisher values (500,'Pan Macmillan', 2016);
insert into Publisher values (600,'Bloomsbury', 1998);
insert into Publisher values (700,'Simon & Schuster', 1997);
insert into Publisher values (800,'John Wiley & Sons', 2001);
insert into Publisher values (900,'Egmont', 2003);
insert into Publisher values (110,'Elsevier', 1992); 
insert into Publisher values (111,'C.J. Date', 2017); 
Go

Insert into Author values (112,'Thomas Connolly');
insert into Author values (212,'Ramez Elmasri');
insert into Author values (313,'J.K. Rowling');
insert into Author values (414,'Ayn Rand');
insert into Author values (515,'Ernest Hemingway');
insert into Author values (616,'Stephen Covey');
insert into Author values (717,'Mark Twain');
insert into Author values (818,'Tony Robbins');
insert into Author values (919,'Robert Koysaki');
insert into Author values (920,'Stephen King');
insert into Author values (921,'C.J. Date');
Go

Insert into Catalogue values (11,'This Book is about sport','Sport');
Insert into Catalogue values (12,'This Book is suitable for Designing','Design & Art');
insert into Catalogue values (13,'This Book is for engineering','Engineering');
insert into Catalogue values (14,'This Book is for Computing','Computing');
insert into Catalogue values (15,'This Book is for Business','Business');

Go

insert into Tag values ('Open-Stack', 'Comics', '1 month');
insert into Tag values ('Yellow-Tagged', 'Magazine', '1 month');
insert into Tag values ('Red-Tagged','Newspaper', '1 month');
insert into Tag values ('Green-Tagged','Novel', '1 month');
Go


Insert into Department values (1,'Engineering','engineering@gmail.com',03-4568765,'Bukit Jalil');
Insert into Department values (2,'Computing','computing@gmail.com',03-4767568,'Shah Alam');
Insert into Department values (3,'Design & Art','design.art@gmail.com',03-9378779,'Cyber Jaya');
Insert into Department values (4,'Business','business@gmail.com',03-2374864,'Putra Jaya');
Insert into Department values (5,'Sport','sport@gmail.com',03-9766756,'Damansara');
Go

insert into Book values (120,11111,'Open-Stack',111,13,12645647,'Engineering','Engineering Econimic', 112);
insert into Book values (121,10000,'Green-Tagged',111,14,32545455,'Computing','Python',212);
insert into Book values (171,10000,'Green-Tagged',111,14,32545455,'Computing','Python',212);
insert into Book values (122,10001,'Red-Tagged',700,14,56473563,'Computing','Java Tutorial',112);
insert into Book values (123,22222,'Green-Tagged',500,11,77656477,'Sport','Sport Science',212);
insert into Book values (124,77777,'Yellow-Tagged',400,15,7672586,'Business','The Lean Startup',112);
insert into Book values (125,66666,'Open-Stack',200,12,65765679,'Design & Art','Logo Design',112);
insert into Book values (126,55555,'Red-Tagged',110,14,75467436,'Computing','Numerical Recipes',212);
insert into Book values (127,22222,'Green-Tagged',800,11,62478323,'Sport','Methods in Pysical Activities',414);
insert into Book values (128,44444,'Yellow-Tagged',600,13,32432707,'Engineering','Social Engineering',112);
insert into Book values (129,88888,'Open-Stack',800,15,76456798,'Business','Built to Last',414);
insert into Book values (130,55555,'Red-Tagged',300,14,45676454,'Computing','Mathematic for Computer',212);
insert into Book values (131,66666,'Green-Tagged',100,11,45673653,'Sport','Running Science',414);
insert into Book values (132,33333,'Open-Stack',300,12,32567488,'Design & Art','Change by Design',313);
insert into Book values (133,99999,'Yellow-Tagged',110,15,77862345,'Business','The Founders Dellema',313);
insert into Book values (134,77777,'Red-Tagged',600,14,64738757,'Computing','Operational System',414);
insert into Book values (135,44444,'Green-Tagged',800,13,34567889,'Engineering','Mechanical Engineering',515);
insert into Book values (136,77777,'Open-Stack',900,14,34567654,'Computing','Computing Fundomentals',515);
insert into Book values (137,88888,'Red-Tagged',500,12,54652384,'Design & Art','Graphic Design',616);
insert into Book values (138,22222,'Yellow-Tagged',300,11,33265474,'Computing','Operational System',616);
insert into Book values (139,22222,'Yellow-Tagged',300,11,33265474,'Sport','Sports Medicine',717);
insert into Book values (140,66666,'Open-Stack',110,15,64454623,'Business','Blue Ocean Strategy',717);
insert into Book values (141,55555,'Green-Tagged',700,13,32431476,'Engineering','Electronics Engineering',818);
insert into Book values (142,11111,'Red-Tagged',200,12,34343145,'Design & Art','Design in The USA',919);
insert into Book values (143,10000,'Yellow-Tagged',500,14,12312442,'Computing','Computer Network',818);
insert into Book values (144,33333,'Open-Stack',600,11,34235923,'Sport','Genetics and Sports',717);
insert into Book values (145,66666,'Green-Tagged',900,15,87327844,'Business','Marketing Rules',920);
insert into Book values (146,11111,'Red-Tagged',700,13,83747836,'Engineering','The Finite Element Method',920);
insert into Book values (147,22222,'Yellow-Tagged',100,12,11245435,'Design & Art','The Industrial Design',920);
insert into Book values (149,10001,'Open-Stack',800,14,32842865,'Computing','Hackers',616);
insert into Book values (150,10000,'Red-Tagged',110,11,28393844,'Sport','Sport Analytics',717);
insert into Book values (151,99999,'Yellow-Tagged',700,15,76656726,'Business','Business Adventure',818);
insert into Book values (152,55555,'Green-Tagged',800,13,86566787,'Engineering','Good To Great',515);
insert into Book values (152,77777,'Open-Stack',400,14,73674862,'Computing','Think Complexity',920);
insert into Book values (153,88888,'Red-Tagged',900,12,65656876,'Design & Art','Drawing Is Thinking',112);
insert into Book values (154,33333,'Green-Tagged',200,11,64587478,'Sport','Training In Sport',212);
insert into Book values (155,10001,'Yellow-Tagged',400,15,76565767,'Business','Advanced Rowing',112);
insert into Book values (156,44444,'Open-Stack',500,13,68765683,'Engineering','The Engineer',212);
insert into Book values (157,66666,'Red-Tagged',300,14,765754564,'Computing','Coding',212);
insert into Book values (158,99999,'Green-Tagged',200,12,98973703,'Design & Art	','Designing Brands',414);
insert into Book values (159,55555,'Open-Stack',110,11,65677883,'Sport','Born To Run',313);
insert into Book values (160,22222,'Yellow-Tagged',900,15,53237476,'Business','Think And Grow Rich',112);
insert into Book values (161,11111,'Red-Tagged',800,13,12812833,'Engineering','Statics',616);
insert into Book values (162,77777,'Green-Tagged',100,14,23432443,'Computing','Mindstorm',717);
insert into Book values (163,88888,'Open-Stack',400,12,83874323,'Design & Art','Interior Design Theory',818);
insert into Book values (164,44444,'Red-Tagged',200,15,55456473,'Business','Super Connector',919);
insert into Book values (165,33333,'Yellow-Tagged',900,11,45435366,'Sport','Biomechanics In Sport',920);
insert into Book values (166,99999,'Open-Stack',700,13,90634346,'Engineering','Circuit Engineering',212);
insert into Book values (167,44444,'Green-Tagged',400,12,65677867,'Design & Art','Basic Principal Of Design',112);
insert into Book values (170,10001,'Open-Stack',100,14,75663264,'Sport','Endurance In Sport',515);
insert into Book values (168,22222,'Yellow-Tagged',110,15,12233794,'Business','in Search Of Excellence',616);
insert into Book values (169,10000,'Red-Tagged',600,14,87664567,'Computing','Computer Performance',717);
insert into Book values (111,10000,'Red-Tagged',600,14,87664567,'Computing','Computer Performance',921);
Go

insert into Members values (1991,1,11111,'TP12736','Ma123456','Majid Aghighi','Male',0127348743,'majid.a@gmail.com');
insert into Members values (1992,2,22222,'TP21214','Na123456','Ali Karimi','Male',0182625446,'ali.k@gmail.com');
insert into Members values (1993,3,33333,'TP34445','Ja123456','Jannet William','Female',0163425547,'jannet.w@gmail.com');
insert into Members values (1994,4,44444,'TP32474','Sa123456','Sara Zargar','Female',0142213442,'sara.z@gmail.com');
insert into Members values (1995,5,55555,'TP21334','Ha123456','William Sanchez','Male',0113243243,'william.san@gmail.com');
insert into Members values (1996,5,66666,'TP65645','Fa123456','Giovanni Bruce','Male',0123432242,'giovanni.Br@gmail.com');
insert into Members values (1997,4,77777,'TP76723','Ra123456','Maryam Zamani','Female',0176567533,'maryam.za@gmail.com');
insert into Members values (1998,3,88888,'TP132423','Ka123456','Jackline Johnny','Female',0115635432,'jackline.j@gmail.com');
insert into Members values (1999,2,99999,'TP65326','Ga123456','Margaret Taylor','Female',0183473473,'margaret.ta@gmail.com');
insert into Members values (2000,1,10000,'TP14333','Ya123456','Mohammad Jamal','Male',0121242343,'mohammad.ja@gmail.com');
insert into Members values (2001,2,10001,'TP76143','La123456','Josef Salem','Male',0121728122,'josef.sa@gmail.com');
insert into Members values (2002,3,11111,'TP87862','Qa123456','Emily Bob','Female',0176347364,'emily.b@gmail.com');
insert into Members values (2003,4,22222,'TP76457','Wa123456','Emma Jackson','Female',0187786982,'emma.jack@gmail.com');
insert into Members values (2004,5,33333,'TP32432','Ta123456','Sam Samuel','Male',0128776653,'sam.sa@gmail.com');
insert into Members values (2005,2,44444,'TP56567','Ua123456','Hamed Alipoor','Male',0154356563,'hamed.ali@gmail.com');
insert into Members values (2006,4,55555,'TP9987','Pa123456','Siamak Ansari','Male',0176876822,'siamak.an@gmail.com');
insert into Members values (2007,3,66666,'TP57676','La123456','Hannah Oliver','Female',0198877676,'hannah.ol@gmail.com');
insert into Members values (2008,1,77777,'TP76436','Ma123456','Isabella Solivan','Female',0176563686,'isabella.sl@gmail.com');
insert into Members values (2009,5,88888,'TP34439','Na123456','Olivia Luck','Female',0187665689,'olivia.lu@gmail.com');
insert into Members values (2010,3,99999,'TP76327','Za123456','Navid Salami','Male',0128787688,'navid.sa@gmail.com');
Go

insert into BooksMembers values (120,1991,'150RM','2018-10-01','2018-11-01');
insert into BooksMembers values (121,1992,'N/A','2018-10-01','2018-10-20');
insert into BooksMembers values (122,1993,'150RM','2018-10-04','2018-11-04');
insert into BooksMembers values (123,1994,'150RM','2018-09-10','2018-10-10');
insert into BooksMembers values (124,1994,'N/A','2018-10-21','2018-11-11');
insert into BooksMembers values (125,1995,'150RM','2018-08-04','2018-09-04');
insert into BooksMembers values (126,1996,'150RM','2018-07-20','2018-08-20');
insert into BooksMembers values (127,1997,'150RM','2018-10-04','2018-11-04');
insert into BooksMembers values (128,1998,'N/A','2018-10-13','2018-11-01');
insert into BooksMembers values (129,1999,'N/A','2018-09-05','2018-09-29');
insert into BooksMembers values (130,2000,'150RM','2018-07-15','2018-08-15');
insert into BooksMembers values (131,2001,'N/A','2018-09-23','2018-10-10');
insert into BooksMembers values (132,2002,'150RM','2018-08-19','2018-09-19');
insert into BooksMembers values (133,2003,'N/A','2018-09-28','2018-10-19');
insert into BooksMembers values (134,2004,'150RM','2018-09-05','2018-10-05');
insert into BooksMembers values (135,2005,'150RM','2018-07-10','2018-08-10');
insert into BooksMembers values (136,2006,'N/A','2018-08-05','2018-08-29');
insert into BooksMembers values (137,2007,'150RM','2018-08-11','2018-09-12');
insert into BooksMembers values (138,2008,'150RM','2018-09-04','2018-10-04');
insert into BooksMembers values (139,2009,'N/A','2018-06-20','2018-07-04');
insert into BooksMembers values (140,2010,'150RM','2018-07-20','2018-08-20');
Go

insert into BooksAuthor values (120,414);
insert into BooksAuthor values (121,515);
insert into BooksAuthor values (122,212);
insert into BooksAuthor values (123,313);
insert into BooksAuthor values (124,515);
insert into BooksAuthor values (125,414);
insert into BooksAuthor values (126,112);
insert into BooksAuthor values (127,313);
insert into BooksAuthor values (128,515);
insert into BooksAuthor values (129,414);
insert into BooksAuthor values (130,313);
insert into BooksAuthor values (131,212);
insert into BooksAuthor values (132,414);
insert into BooksAuthor values (133,313);
insert into BooksAuthor values (134,112);
insert into BooksAuthor values (135,414);
insert into BooksAuthor values (136,212);
insert into BooksAuthor values (137,515);
insert into BooksAuthor values (138,313);
insert into BooksAuthor values (139,414);
insert into BooksAuthor values (140,212);
insert into BooksAuthor values (141,112);
insert into BooksAuthor values (142,515);
insert into BooksAuthor values (143,313);
insert into BooksAuthor values (144,212);
insert into BooksAuthor values (145,112);
insert into BooksAuthor values (146,313);
insert into BooksAuthor values (147,414);
insert into BooksAuthor values (158,112);
insert into BooksAuthor values (149,212);
insert into BooksAuthor values (150,515);
Go

Insert into Reservation values (140,2010,'2018-07-13');
Insert into Reservation values (132,2002,'2018-08-16');
Insert into Reservation values (130,2000,'2018-07-10');
Insert into Reservation values (121,1992,'2018-09-28');
Insert into Reservation values (135,2007,'2018-07-07');
Insert into Reservation values (124,1994,'2018-10-18');
Insert into Reservation values (125,1998,'2018-10-10');
Insert into Reservation values (137,2007,'2018-08-08');
Insert into Reservation values (126,1996,'2018-07-13');
Insert into Reservation values (150,2009,'2018-08-25');
Go
-- Scenario #1
SELECT MemName, COUNT(r.MemID) AS "Books Borrowed"
FROM Members m
LEFT JOIN Reservation r ON m.MemID = r.MemID
GROUP BY m.MemName
HAVING COUNT(r.MemID) > 1
ORDER BY m.MemName;


-- Scenario #2
SELECT COUNT(*) Title, TagType
FROM Book
GROUP BY TagType
ORDER BY Title DESC

-- Scenario #3
SELECT bookID, Title, ISBN, TagType, SubjectArea, p.PubName
FROM Book b
LEFT JOIN Publisher p ON b.pubID = p.pubID
WHERE b.AutID IN (
SELECT a.AutID
FROM Author a 
WHERE AutName = 'Thomas Connolly' OR AutName = 'Ramez Elmasri')

-- Scenario #4
SELECT b.Title, b.ISBN, b.TagType, b.SubjectArea, b.TagType, p.PubName, a.AutName, m.MemName, m.Email
FROM Reservation r
LEFT JOIN [Book] b ON r.BookID = b.BookID
LEFT JOIN [Publisher] p ON b.PubID = p.PubID
LEFT JOIN [BooksMembers] bb ON bb.BookID = b.BookID
LEFT JOIN [Author] a ON b.AutID = a.AutID
LEFT JOIN [Members] m ON bb.MemID = m.MemID

-- Scenario #5
SELECT d.DepName, COUNT(b.BookID) AS 'Borrowed By Students'
FROM Department d
LEFT JOIN [Members] m ON m.DepID = d.DepID
LEFT JOIN [BooksMembers] b on b.MemID = m.MemID 
LEFT JOIN [Reservation] r ON r.MemID = m.MemID
GROUP BY d.DepName


-- Scenario #6
SELECT m.MemName, m.MemGender, m.Email, m.Phone
FROM Members m
LEFT JOIN [Book] b ON b.LibID = m.LibID
LEFT JOIN [BooksMembers] bb ON bb.BookID = b.BookID
LEFT JOIN [Author] a ON b.AutID= a.AutID
WHERE a.AutName = 'C.J. Date';

-- Scenario #7
SELECT b.Title
FROM Book b
LEFT JOIN [Publisher] p ON b.PubID= p.PubID
WHERE p.PubName = 'Prentice Hall' AND b.SubjectArea = 'Computing' AND p.PubYear = 2017;


-- Scenario #8
SELECT d.DepID AS 'Dep. No.', l.LibName AS 'Name', l.DOB AS 'DOB', l.LibGender AS 'Gender', l.LibStatus AS 'Status'
FROM Department d
LEFT JOIN [Book] b ON b.SubjectArea = d.DepName
LEFT JOIN [Librians] l ON l.LibID = b.LibID
WHERE l.LibStatus = 'inactive'
ORDER BY d.DepID ASC, l.LibName ASC;

-- Scenario #9
--Assuming the fine is RM 0.20/day;
SELECT br.DateDue, b.Title, b.ISBN, m.MemName, DATEDIFF(day, br.DateBorrowed, CONVERT(date, getdate()))*.2 "Fines Incurred"
FROM BooksMembers br
LEFT JOIN [Book] b ON br.BookID= b.BookID
LEFT JOIN [Members] m ON br.MemID = m.MemID
WHERE br.DateDue < CONVERT(date, getdate())

