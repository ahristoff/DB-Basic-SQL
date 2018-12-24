--CREATE DATABASE Minions

CREATE TABLE Minions(
Id INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(50) NOT NULL,
Age NVARCHAR(50)
)
CREATE TABLE Towns(
Id INT PRIMARY KEY IDENTITY(1,1),
Name NVARCHAR(50) NOT NULL
)

ALTER TABLE Minions
ADD TownId int FOREIGN KEY REFERENCES Towns(Id)

INSERT INTO Towns(Name) Values('Sofia'),('Plovdiv'),('Varna')
INSERT INTO Minions(Name,Age,TownId) Values('Kevin',22,1),('Bob',15,3),('Steward',NULL,2)



SELECT*FROM Towns
SELECT*FROM Minions
 
 --Drop TABLE Minions,Towns
