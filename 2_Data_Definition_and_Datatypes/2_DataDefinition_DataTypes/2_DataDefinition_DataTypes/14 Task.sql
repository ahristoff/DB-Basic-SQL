CREATE DATABASE CarRental 

CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY,
CategoryName NVARCHAR(20) NOT NULL,
DailyRate DECIMAL(6,2) NOT NULL,
WeeklyRate DECIMAL(6,2) NOT NULL,
MonthlyRate DECIMAL(6,2) NOT NULL,
WeekendRate DECIMAL(6,2) NOT NULL,
)
CREATE TABLE Cars(
Id INT PRIMARY KEY IDENTITY,
PlateNumber NVARCHAR(10) NOT NULL,
Manufacturer NVARCHAR(20) NOT NULL,
Model NVARCHAR(50) NOT NULL,
CarYear DATE NOT NULL,
CategoryId INT NOT NULL,
Doors INT NOT NULL,
Picture VARBINARY(2000),
Condition VARCHAR(MAX),
Available BIT DEFAULT 1,
) 
CREATE TABLE Employees(
Id INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL,
Title NVARCHAR(20) NOT NULL,
Notes VARCHAR(MAX),
) 
CREATE TABLE Customers(
Id INT PRIMARY KEY IDENTITY,
DriverLicenceNumber INT NOT NULL,
FullName NVARCHAR(50) NOT NULL,
Address NVARCHAR(50) NOT NULL,
City NVARCHAR(50) NOT NULL,
ZIPCode INT NOT NULL,
Notes VARCHAR(MAX),
) 
CREATE TABLE RentalOrders(
Id INT PRIMARY KEY IDENTITY,
EmployeeId INT NOT NULL,
CustomerId INT NOT NULL,
CarId INT NOT NULL,
TankLevel NVARCHAR(20) NOT NULL,
KilometrageStart INT NOT NULL,
KilometrageEnd INT NOT NULL,
TotalKilometrage INT NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
TotalDays INT NOT NULL,
RateApplied DECIMAL(4,2) NOT NULL,
TaxRate DECIMAL(4,2) NOT NULL,
OrderStatus VARCHAR(20) NOT NULL,
Notes VARCHAR(MAX),
) 


INSERT INTO Categories(CategoryName,DailyRate,WeeklyRate,MonthlyRate,WeekendRate) 
VALUES('LUX',39.99, 249.99, 1049.99, 55.99),
('AVERAGE',29.99, 189.99, 849.99, 45.99),
('CHEAP',19.99, 129.99, 490.99, 35.99)

INSERT INTO Cars(PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors,
Picture, Condition, Available) 
VALUES('ZXS12345', '456ASD123', 'OPEL VECTRA', '2014-5-6', 2, 4, NULL, NULL, 1),
('DFG84567', 'DFDF12DH5', 'OPEL iNSIGNA', '2016-4-9', 1, 4, NULL, NULL, 0),
('JHK48621', 'DGFFD1234', 'JAGUAR', '2016-5-18', 1, 4, NULL, NULL, 1)

INSERT INTO Employees(FirstName, LastName, Title, Notes)   
VALUES('Jan','Becker', 'Installer', NULL),
('Tomas', 'Schmidt', 'Ing', NULL),
('Harry', 'Kross', 'Installer', NULL)

INSERT INTO Customers(DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
VALUES(11226633, 'Andreas Birke', 'vogelwiederstr 21', 'Zalzburg', 123456, NULL),
(24560321, 'Volker Kranich', 'wendelstr 126', 'Hamburg', 654321, NULL),
(98725493, 'Franz Krach', 'Tueringerweg 59', 'Chemnitz', 754135, NULL)

INSERT INTO RentalOrders(EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)
VALUES(2, 1, 3, 'full', 65234, 65943, 709, '2017-3-14', '2017-3-16', 2, 5.14, 2.11, 'completed', NULL),
(1, 2, 3, 'full', 72894, 73598, 704, '2017-7-10', '2017-7-13', 3, 5.14, 1.18, 'completed', NULL),
(3, 3, 2, 'full', 35234, 36456, 1222, '2017-5-20', '2017-5-26', 6, 5.14, 2.15, 'completed', NULL)


select*from Categories
select*from Cars
select*from Employees
select*from Customers
select*from RentalOrders
