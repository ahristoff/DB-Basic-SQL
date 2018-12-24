USE TableRelation

CREATE TABLE Manufacturers(
ManufacturerID INT Primary Key IDENTITY(1,1),
Name NVARCHAR (50),
EstablishedOn DATE
)

CREATE TABLE Models(
ModelID INT PRIMARY KEY IDENTITY(101, 1),
Name NVARCHAR(50),
ManufacturerID INT

CONSTRAINT FK_Models_Manufacturers
FOREIGN KEY (ManufacturerID)
REFERENCES Manufacturers(ManufacturerID)
)



INSERT INTO Manufacturers
VALUES ('BMW','07/03/1916'),
('Tesla', '01/01/2003'),
('Lada', '01/05/1966')

INSERT INTO Models(Name, ManufacturerID)
VALUES ('X1',1),('i6', 1),('Model S', 2),('Model X', 2),('Model 3', 2),('Nova', 3)



SELECT*FROM Models
SELECT*FROM Manufacturers


--DROP TABLE Models
--DROP TABLE Manufacturers