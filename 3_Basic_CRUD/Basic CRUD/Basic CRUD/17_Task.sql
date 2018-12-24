USE SoftUni
GO
CREATE VIEW V_EmployeeNameJobTitle AS
--SELECT CONCAT(FirstName,' ',MiddleName,' ',LastName) AS [FullName],JobTitle
--FROM Employees


--SELECT MiddleName=
--case
--when MiddleName IS NULL THEN ' '
--else MiddleName
--end 
--FROM Employees



SELECT FirstName + ' ' +
case
when MiddleName IS NULL THEN ''
else MiddleName
end 
+ ' '+LastName AS [FullName],JobTitle FROM Employees
GO

--ALTER TABLE Employees
--ADD FullName Varchar(50)


--UPDATE Employees
--SET FullName = FirstName + ' ' +
--case
--when MiddleName IS NULL THEN ''
--else MiddleName
--end 
--+ ' '+LastName

--ALTER TABLE Employees
--Drop Column FirstName,MiddleName,LastName



SELECT*FROM V_EmployeeNameJobTitle
 