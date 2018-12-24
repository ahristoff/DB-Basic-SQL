CREATE DATABASE Movies

CREATE TABLE Directors(
Id INT PRIMARY KEY IDENTITY,
DirectorName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)
CREATE TABLE Genres (
Id INT PRIMARY KEY IDENTITY,
GenreName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)
CREATE TABLE Categories  (
Id INT PRIMARY KEY IDENTITY,
CategoryName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)
CREATE TABLE Movies   (
Id INT PRIMARY KEY IDENTITY,
Title NVARCHAR(50) NOT NULL,
DirectorId INT UNIQUE NOT NULL,
CopyrightYear DATE NOT NULL,
Length DECIMAL(3,2),
GenreId INT UNIQUE NOT NULL,
CategoryId INT UNIQUE NOT NULL,
Rating NVARCHAR(20),
Notes NVARCHAR(MAX)
)

INSERT INTO Directors(DirectorName,Notes) VALUES
('Matthew Vaughn', 'very good'),
('Simon Verhoeven',NULL),
('Stanley Kubrick',NULL),
('Joseph L. Mankiewicz',Null),
('Kim Longinotto',NULL)

INSERT INTO Genres(GenreName,Notes) VALUES
('Drama', 'very good'),
('Action',NULL),
('Triller',NULL),
('Horror',Null),
('Comedy',NULL)

INSERT INTO Categories(CategoryName,Notes) VALUES
('Adventure', 'good'),
('Documentary',NULL),
('Cartoon',NULL),
('Crime',Null),
('Fantasy','good')

INSERT INTO Movies(Title,DirectorId,CopyrightYear,Length,GenreId,CategoryId,Rating,Notes) VALUES
('The Golden Circle', 1,'2017-4-15',1.41,2,1,Null,Null),
('Friend Request', 2,'2017-1-19',1.32,4,2,Null,Null),
('Victoria and Abdul', 3,'2017-3-26',1.56,1,5,Null,Null),
('Stronger', 4,'2017-6-16',1.40,5,3,Null,Null),
('Woodshock', 5,'2017-3-15',1.34,3,4,Null,Null)


select*from Directors
select*from Genres
select*from Categories
select*from Movies