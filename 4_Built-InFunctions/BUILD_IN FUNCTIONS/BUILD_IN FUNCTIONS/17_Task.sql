USE Orders

--CREATE TABLE People(
--Id INT Primary Key NOT NULL IDENTITY(1,1),
--Name NVARCHAR(50),
--BirthDay Datetime
--)


--INSERT INTO People(Name,BirthDay)
--VALUES
--('Victor','2000-12-08 00:00:00.000'),
--('Steven','1992-10-10 00:00:00.000'),
--('Stephen','1910-09-19 00:00:00.000'),
--('John','2010-01-06 00:00:00.000')

SELECT Name, DateDiff(YEAR,BirthDay,GETDATE())AS [Age in Years],
DateDiff(MONTH,BirthDay,GETDATE())AS [Age in Months],
DateDiff(DAY,BirthDay,GETDATE())AS [Age in Days],
DateDiff(MINUTE,BirthDay,GETDATE())AS [Age in Minutes]
 FROM People
