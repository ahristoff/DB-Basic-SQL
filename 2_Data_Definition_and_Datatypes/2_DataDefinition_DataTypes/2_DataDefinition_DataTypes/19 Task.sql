CREATE DATABASE SoftUni

CREATE TABLE Towns(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(60) NOT NULL,
)

CREATE TABLE Addresses(
Id INT PRIMARY KEY IDENTITY,
AddressText NVARCHAR(60) NOT NULL,
TownId INT NOT NULL
)

CREATE TABLE Departments(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(60) NOT NULL,
)

CREATE TABLE Employees(
Id INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(20) NOT NULL,
MiddleName NVARCHAR(20) NOT NULL,
LastName NVARCHAR(20) NOT NULL,
JobTitle NVARCHAR(50) NOT NULL,
DepartmentId INT FOREIGN KEY REFERENCES Departments(Id) NOT NULL,
HireDate DATE NOT NULL,
Salary DECIMAL(10,2) NOT NULL,
AddressId INT
)

INSERT INTO Towns(Name) VALUES('Sofia'),('Plovdiv'),('Varna'),('Burgas')

INSERT INTO Departments(Name)
 VALUES('Engineering'),('Sales'),('Marketing'),('Software Development'),
 ('Quality Assurance')

INSERT INTO Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary, AddressId)
VALUES('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-2-1', 3500, 1),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2013-3-2', 4000, 2),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-8-28', 525.25, 3),
('Georgi', 'Teziev', 'Ivanov', 'CEO', 2, '2007-12-9', 3000, 4),
('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-8-28', 599.88, 5)



SELECT*FROM Towns

SELECT*FROM Departments

SELECT*FROM Employees

SELECT*FROM Addresses