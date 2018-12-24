Use Minios

TRUNCATE TABLE Minios
DROP TABLE People
DROP TABLE Towns

CREATE TABLE People(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(200) NOT NULL,
Picture VARBINARY(2000),
Height DECIMAL(3,2),
Weight DECIMAL(5,2),
Gender char(1) NOT NULL,
Birthdate DATE NOT NULL,
Biography NVARCHAR(MAX)
)
INSERT INTO People(Name, Picture, Height, Weight, Gender, Birthdate, Biography) VALUES('Pesho', NULL, 1.78, 76.6, 'm', '1982-01-12', 'this is the bio'),
        ('Gosho', NULL, 1.68, 88.6, 'm', '1983-01-12', 'this is the bio'),
        ('Stoyan', NULL, 1.80, 72.4, 'm', '1984-01-12', 'this is the bio'),
        ('Petja', NULL, 1.58, 50.3, 'f', '1985-01-12', 'this is the bio'),
        ('Nadja', NULL, 1.71, 66.2, 'f', '1986-01-12', 'this is the bio')


SELECT*FROM People