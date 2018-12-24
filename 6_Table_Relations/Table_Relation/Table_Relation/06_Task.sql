USE TableRelation

CREATE TABLE Majors(
MajorID INT Primary Key IDENTITY,
Name VARCHAR(50)
)

CREATE TABLE Students(
StudentID INT Primary Key IDENTITY,
StudentNumber INT,
StudentName VARCHAR(50),
MajorID INT
)

CREATE TABLE Payments(
PaymentID INT Primary Key IDENTITY,
PaymentDate DATE,
PaymentAmount DECIMAL(10,2),
StudentID INT
)

CREATE TABLE Agenda(
StudentID INT NOT NULL,
SubjectID INT NOT NULL
)

CREATE TABLE Subjects(
SubjectID INT Primary Key IDENTITY,
SubjectName VARCHAR(50)
)

ALTER TABLE Students
ADD 
CONSTRAINT FK_StudentsMajors
FOREIGN KEY (MajorID)
REFERENCES Majors(MajorID)

ALTER TABLE Payments
ADD 
CONSTRAINT FK_PaymentsStudents
FOREIGN KEY (StudentID)
REFERENCES Students(StudentID)

ALTER TABLE Agenda
ADD
CONSTRAINT PK_StudentsSubjects
PRIMARY KEY(StudentID,SubjectID),

CONSTRAINT FK_StudentsSubjects_Students
FOREIGN KEY (StudentID)
REFERENCES Students(StudentID),

CONSTRAINT FK_StudentsSubjects_Subjects
FOREIGN KEY (SubjectID)
REFERENCES Subjects(SubjectID)



SELECT * FROM Majors
SELECT * FROM Students
SELECT * FROM Payments
SELECT * FROM Agenda
SELECT * FROM Subjects



--DROP TABLE Agenda
--DROP TABLE Subjects
--DROP TABLE Payments
--DROP TABLE Students
--DROP TABLE Majors





