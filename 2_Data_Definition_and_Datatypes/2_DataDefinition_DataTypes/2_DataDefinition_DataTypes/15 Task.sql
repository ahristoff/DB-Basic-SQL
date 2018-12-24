CREATE DATABASE Hotel 

CREATE TABLE Employees(
Id INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR (50) NOT NULL,
LastName NVARCHAR (50) NOT NULL,
Title NVARCHAR (50) NOT NULL,
Notes VARCHAR(50)
) 
INSERT INTO Employees(FirstName, LastName, Title, Notes)
VALUES('Gergi', 'Resku', 'Cleaner', Null),
('Maja', 'Popova', 'Maid', Null),
('Tomas', 'Graf', 'Maneger', Null)

CREATE TABLE Customers(
AccountNumber INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR (50) NOT NULL,
LastName NVARCHAR (50) NOT NULL,
PhoneNumber NVARCHAR (50) NOT NULL,
EmergencyName NVARCHAR (50),
EmergencyNumber NVARCHAR (50),
Notes VARCHAR(MAX)
) 

INSERT INTO Customers(FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
VALUES('Aleks', 'Dow', '+0877 146 298', 'Ema', NULL, NULL),
('Ivan', 'Petroff', '+0894 123 568', 'Ivo', '+0888 236 548', NULL),
('Jasmin', 'Abdul', '+0487 125 398', NULL, NULL, NULL)

CREATE TABLE RoomStatus(
Id INT PRIMARY KEY IDENTITY,
RoomStatus VARCHAR(20) NOT NULL,
Notes VARCHAR(MAX)
) 
INSERT INTO RoomStatus(RoomStatus, Notes) VALUES('occupied', NULL),('free', NULL),('occupied', Null)

CREATE TABLE RoomTypes(
Id INT PRIMARY KEY IDENTITY,
RoomType VARCHAR(20) NOT NULL,
Notes VARCHAR(MAX)
) 
INSERT INTO RoomTypes(RoomType, Notes) VALUES('lux', NULL),('normal', NULL),('small', Null)

CREATE TABLE BedTypes(
Id INT PRIMARY KEY IDENTITY,
BedType VARCHAR(20) NOT NULL,
Notes VARCHAR(MAX)
) 
INSERT INTO BedTypes(BedType, Notes) VALUES('single bed', NULL),('double bed', NULL),('three bed', Null)

CREATE TABLE Rooms(
Id INT PRIMARY KEY IDENTITY,
RoomNumber INT NOT NULL,
RoomType VARCHAR(20) NOT NULL,
BedType VARCHAR(20) NOT NULL,
Rate DECIMAL(5,2) NOT NULL,
RoomStatus VARCHAR(20) NOT NULL,
Notes VARCHAR(MAX)
)

INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
VALUES(4, 'lux', 'single bed', 98.45, 'occupied', NULL),
(12, 'normal', 'double bed', 110.99, 'occupied', NULL),
(28, 'lux', 'single bed', 98.45, 'free', NULL)

CREATE TABLE Payments (
Id INT PRIMARY KEY IDENTITY,
EmployeeId INT NOT NULL,
PaymentDate DATE NOT NULL,
AccountNumber NVARCHAR(50),
FirstDateOccupied DATE NOT NULL,
LastDateOccupied DATE NOT NULL,
TotalDays INT NOT NULL,
AmountCharged DECIMAL(10,2) NOT NULL,
TaxRate DECIMAL(10,2) NOT NULL,
TaxAmount DECIMAL(10,2) NOT NULL,
PaymentTotal DECIMAL(10,2) NOT NULL,
Notes VARCHAR(MAX)
)
INSERT INTO Payments(EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
Values(1, '2017-4-20', '12345aad25df', '2017-4-12', '2017-4-15', 4, 359.20, 20.14, 25.3, 404.64, NULL),
(2, '2017-4-20', '56srthrt123', '2017-4-11', '2017-4-16', 6, 559.20, 30.14, 35.3, 624.64, NULL),
(3, '2017-4-20', '8949raeg111', '2017-4-16', '2017-4-17', 2, 159.20, 10.14, 15.3, 184.64, NULL)



CREATE TABLE Occupancies(
Id INT PRIMARY KEY IDENTITY,
EmployeeId INT NOT NULL,
DateOccupied DATE NOT NULL,
AccountNumber NVARCHAR(50),
RoomNumber INT NOT NULL,
RateApplied BIT NOT NULL,
PhoneCharge DECIMAL(10,2) NOT NULL,
Notes VARCHAR(MAX)
)

INSERT INTO Occupancies(EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
VALUES(2, '2017-4-12', '125FGSDF125', 16, 1, 23.56, NULL),
(1, '2017-4-10', '564SDFG12', 10, 1, 10.31, NULL),
(3, '2017-4-15', '789DGHJ15', 8, 0, 2.36, NULL)


