---- Trigger Demo --
--CREATE TRIGGER TriggerDemo on AGENTs
--AFTER UPDATE
--AS
--BEGIN
--INSERT INTO AGENTS VALUES('A013','JAMES','UK',0.11,11232145,'UK')
--END
--SELECT * FROM AGENTS;
---------------------------------------
CREATE TABLE Employee_Test
(
Emp_ID int identity,
Emp_Name Varchar(200),
Emp_Sal Decimal(10,2),
Emp_State VArchar(200)
);
--INSERT INTO Employee_Test VALUES('John',1000,'Delhi')
--INSERT INTO Employee_Test VALUES('Walker',123,'Pune')

SELECT * from Employee_Test