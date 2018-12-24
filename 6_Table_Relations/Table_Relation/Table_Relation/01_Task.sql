USE TableRelation

CREATE TABLE Passports(
PassportID INT Primary Key IDENTITY(101,1),
PassportNumber NVARCHAR (50)
)

CREATE TABLE Persons(
PersonID INT Primary Key IDENTITY(1,1),
FirstName VARCHAR (50),
Salary DECIMAL (8,2),
PassportID INT UNIQUE

CONSTRAINT FK_Persons_Passports
FOREIGN KEY (PassportID)
REFERENCES Passports(PassportID)
)

INSERT INTO Passports
VALUES ('N34FG21B'),('K65LO4R7'),('ZE657QP2')

INSERT INTO Persons (FirstName, Salary, PassportID)
VALUES ('Roberto', 43300.00, 102),
('Tom', 56100.00, 103),
('Yana', 60200.00, 101)



SELECT*FROM Passports
SELECT*FROM Persons

--DROP TABLE Persons
--DROP TABLE Passports

