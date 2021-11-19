CREATE TABLE Details( 
CusId int,
Firstname varchar(250),
Lastname varchar(250),
Address varchar(250),
Dept varchar(250),
);
INSERT INTO Details VALUES ( 001,'Kal','Damon','Seattle','Testing');

SELECT * FROM Details

UPDATE Details
SET Dept ='DB'
where CusId = 001;

SELECT * FROM Details

DELETE FROM Details where Dept='Testing';

SELECT * FROM Details
DELETE FROM Details where Dept='DB';
SELECT * FROM Details
INSERT INTO Details VALUES ( 001,'Anky','Shroff','Seattle','Testing')
SELECT * FROM Details

CREATE TABLE Person( 
Id int identity(2,5),
First_name varchar(250) NOT NULL,
Last_name varchar(250) NOT NULL,
City varchar(250) DEFAULT 'UK'
);
SELECT * FROM Person
INSERT INTO Person VALUES ( 1,'Ank','Saraf','Seattle')
INSERT INTO Person VALUES ( 2,'Katty','Shroff','New York')
SELECT * FROM Person
DELETE FROM Person where City='New York';
SELECT * FROM Person


CREATE TABLE CheckAge( 
Id int identity(10,50),
First_name varchar(250) NOT NULL,
Age int Check (Age>=18)
);

insert into CheckAge VALUES('Vicky',11);
SELECT * FROM CheckAge
insert into CheckAge VALUES('Vcky',30);
SELECT * FROM CheckAge

SELECT name, crdate
FROM  SYSOBJECTS
WHERE xtype='U';
GO

SELECT * from  Details

CREATE VIEW [Seattle Customer] AS
SELECT CusId,Dept 
FROM Details
WHERE Lastname = 'Shroff';

SELECT * FROM [Seattle Customer]

DROP VIEW [Seattle Customer] 

CREATE SCHEMA NEWSchema;
Go

SELECT *
FROM sys.schemas

CREATE TABLE NEWSchema.MYCustomer(
CsutomerID int PRIMARY KEY IDENTITY,
Name varchar(200),
DOJ datetime NOT NULL
);

INSERT into NEWSchema.MYCustomer 
Values('RISHABH','2021/11/11')
INSERT into NEWSchema.MYCustomer 
Values('SAURABH','2021/10/11')

SELECT * FROM NEWSchema.MYCustomer

--CREATE SCHEMA DBOSchema
--AUTHORIZATION dbo
--Go

Create Table MYPerson(
PersonId int PRIMARY KEY NOT NULL,
Lastname varchar(250) NOT NULL,
FirstName varchar(250) nOT NULL,
Age int 
);
Insert into MYPerson Values(
2,'Parmar', 'Deep', 25)
Select * from MYPerson

Create Table Orders (
OrderId int NOT NULL PRIMARY KEY,
OrderNumber int NOT NULL,
PersonId int FOREIGN KEY REFERENCES MYPerson(PersonId)
);

Insert into Orders VALUES
(0120,020,001),
(0121,021,002);

Select * FROM MyPerson, Orders
Where MYPerson.PersonId = Orders.PersonId

Create Table MyPlayerDetails(
Lastname varchar(250) NOT NULL,
FirstName varchar(250) nOT NULL,
TopScore int NOT NULL,
No_of_matches int NOT NULL,
PersonId int FOREIGN KEY REFERENCES MYPerson(PersonId)
);

Insert into MyPlayerDetails Values
('Parmar', 'Deep', 25, 250, 01),
('Dhoni','MS', 50, 300, 02)
--('Dhawan','Shikhar', 50, 300, 03),

Select * from MyPlayerDetails

Select * FROM MyPerson,MyPlayerDetails
Where MYPerson.PersonId = MyPlayerDetails.PersonId

--Select * From MyPerson,Orders,MyPlayerDetails
--Where MYPerson.PersonId = Orders.PersonId
------------------------------------------------------------------
--Implementing t-sql

--Select * FROM MYPerson ,Orders
--if row
--Where MYPerson.PersonId=Orders.PersonId 

SELECT CURRENT_TIMESTAMP
SELECT SYSTEM_USER
SELECT CURRENT_USER
--Formatting Functions
DECLARE @d DATETIME = '12/01/2021';
SELECT FORMAT (@d,'d','en-Us') AS 'US English Result',
FORMAT (@d,'d','no') AS 'Norwegian Result',
FORMAT (@d,'d','zu') AS 'Zulu Result'

--Use MM/DD/YYYY as date
--Format (value,format,culture)

SELECT FirstName, ASCII(FirstName) As NumCodeofFirstChar
From MyPlayerDetails

SELECT TRIM('   DEMO FOR TRIM   ') As TrimmedString
--ASCII(Character)

SELECT RAND(21);
SELECT FLOOR(RAND()* (10-5)+5); -- >==5 and <=10
SELECT NEWID() -- returns a unique identifier
SELECT MAX(Age) as oldplayer FROM MYPerson;
SELECT AVG(Age) as avgplayer FROM MYPerson;

SELECT SUBSTRING('SQLDEMO',2,5) As sb;
SELECT CRYPT_GEN_RANDOM(128,1234589) As Encryptedvalues;

SELECT * from sys.objects
WHERE type_desc LIKE '%CONSTRAINT';

SELECT MYPerson.PersonId, MYPerson.FirstName From MYPerson 
INNER JOIN  MyPlayerDetails

on MYPerson.PersonId=MyPlayerDetails.PersonId;
SELECT MYPerson.PersonId, MYPerson.FirstName From MYPerson 
RIGHT JOIN  MyPlayerDetails

on MYPerson.PersonId=MyPlayerDetails.PersonId;
SELECT MYPerson.PersonId, MYPerson.FirstName From MYPerson 
FULL JOIN  MyPlayerDetails
on MYPerson.PersonId=MyPlayerDetails.PersonId;

------------------------------------------
--Day-3--------------------------


Create Table Salesman1(
SalesmanId int Primary key NOT NULL,
SalesmanName varchar(250) NOT NULL,
Scity varchar(250) NOT NULL,
Commission int NOT NULL
);

Insert Into Salesman1 values (23,'Pratik','Delhi',2000),(45,'Kartik','UP',3500)
Select * from Salesman1;

Create Table CustomerData1(
CustomerId int Primary key NOT NULL,
CusName varchar(250) NOT NULL,
Ccity varchar(250) NOT NULL,
Grade varchar(250) NOT Null,
SalesmanId int FOREIGN KEY REFERENCES Salesman1(SalesmanId)
);

Insert Into CustomerData1 values (40,'Akansha','UP','A',23),(100,'Gulprit','Delhi','B',45)
Select * from CustomerData1;

SELECT SalesmanName,CusName,Scity
FROM Salesman1 
Inner join CustomerData1
on Salesman1.Scity = CustomerData1.Ccity;


SELECT SalesmanName,CusName,Scity,Commission,grade
FROM Salesman1 
Inner join CustomerData1
on Salesman1.SalesmanId = CustomerData1.SalesmanId;

SELECT SalesmanName,CusName,Scity
FROM Salesman1 
Inner join CustomerData1
on Salesman1.SalesmanId = CustomerData1.SalesmanId;

---------------------------------------------------------------------
CREATE TABLE  "AGENTS"(	
"AGENT_CODE" CHAR(6) NOT NULL PRIMARY KEY, 
"AGENT_NAME" CHAR(40), 
"WORKING_AREA" CHAR(35), 
"COMMISSION" Numeric(5,2),
"PHONE_NO" CHAR(15), 
"COUNTRY" VARCHAR(25) 
);

INSERT INTO AGENTS VALUES ('A007', 'Ramasundar', 'Bangalore', '0.15', '077-25814763', '');
INSERT INTO AGENTS VALUES ('A003', 'Alex ', 'London', '0.13', '075-12458969', '');
INSERT INTO AGENTS VALUES ('A008', 'Alford', 'New York', '0.12', '044-25874365', '');
INSERT INTO AGENTS VALUES ('A011', 'Ravi Kumar', 'Bangalore', '0.15', '077-45625874', '');
INSERT INTO AGENTS VALUES ('A010', 'Santakumar', 'Chennai', '0.14', '007-22388644', '');
INSERT INTO AGENTS VALUES ('A012', 'Lucida', 'San Jose', '0.12', '044-52981425', '');
INSERT INTO AGENTS VALUES ('A005', 'Anderson', 'Brisban', '0.13', '045-21447739', '');
INSERT INTO AGENTS VALUES ('A001', 'Subbarao', 'Bangalore', '0.14', '077-12346674', '');
INSERT INTO AGENTS VALUES ('A002', 'Mukesh', 'Mumbai', '0.11', '029-12358964', '');
INSERT INTO AGENTS VALUES ('A006', 'McDen', 'London', '0.15', '078-22255588', '');
INSERT INTO AGENTS VALUES ('A004', 'Ivan', 'Torento', '0.15', '008-22544166', '');
INSERT INTO AGENTS VALUES ('A009', 'Benjamin', 'Hampshair', '0.11', '008-22536178', '');

Select * FROM AGENTS




---to details of agent where customer name is carolina
CREATE TABLE  "CUSTOMER" 
   (	"CUST_CODE" VARCHAR2(6) NOT NULL PRIMARY KEY, 
	"CUST_NAME" VARCHAR2(40) NOT NULL, 
	"CUST_CITY" CHAR(35), 
	"WORKING_AREA" VARCHAR2(35) NOT NULL, 
	"CUST_COUNTRY" VARCHAR2(20) NOT NULL, 
	"GRADE" NUMBER, 
	"OPENING_AMT" NUMBER(12,2) NOT NULL, 
	"RECEIVE_AMT" NUMBER(12,2) NOT NULL, 
	"PAYMENT_AMT" NUMBER(12,2) NOT NULL, 
	"OUTSTANDING_AMT" NUMBER(12,2) NOT NULL, 
	"PHONE_NO" VARCHAR2(17) NOT NULL, 
	"AGENT_CODE" CHAR(6) NOT NULL REFERENCES AGENTS
);   

