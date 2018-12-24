USE TableRelation

CREATE TABLE Students(
StudentID INT Primary Key IDENTITY(1,1),
Name VARCHAR (50)
)

CREATE TABLE Exams(
ExamID INT Primary Key IDENTITY(101,1),
Name VARCHAR (50)
)

CREATE TABLE StudentsExams(
StudentID INT,
ExamID INT,

CONSTRAINT PK_StudentsExams
PRIMARY KEY(StudentID,ExamID),

CONSTRAINT FK_StudentsExams_Students
FOREIGN KEY (StudentID)
REFERENCES Students(StudentID),

CONSTRAINT FK_StudentsExams_Exams
FOREIGN KEY (ExamID)
REFERENCES Exams(ExamID)
)

INSERT INTO Students
VALUES ('Mila'),('Toni'),('Ron')

INSERT INTO Exams
VALUES ('SpringMVC'),('Neo4j'),('Oracle 11g')

INSERT INTO StudentsExams(StudentID, ExamID)
VALUES (1, 101),(1, 102),(2, 101),(3, 103),(2, 102),(2, 103)



SELECT*FROM Students
SELECT*FROM Exams
SELECT*FROM StudentsExams



--DROP TABLE StudentsExams
--DROP TABLE Students
--DROP TABLE Exams

