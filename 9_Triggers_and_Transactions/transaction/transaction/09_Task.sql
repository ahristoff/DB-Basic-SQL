USE SoftUni
GO

--CREATE TABLE Deleted_Employees(
--EmployeeId INT PRIMARY KEY IDENTITY,
--FirstName VARCHAR(50),
--LastName VARCHAR(50),
--MiddleName VARCHAR(50),
--JobTitle VARCHAR(50),
--DeparmentId INT,
--Salary DECIMAL(15, 2)
--)

ALTER TABLE Employees
ADD IsActiv BIT DEFAULT 1 NOT NULL

GO

alter TRIGGER tr_DeleteEmployees
ON Employees
INSTEAD OF DELETE
AS
	BEGIN
		UPDATE Employees
		SET IsActiv = 0
		FROM Employees AS e JOIN deleted AS d ON d.EmployeeID = e.EmployeeID
		WHERE d.IsActiv = 1

		SELECT EmployeeId, FirstName, LastName, MiddleName, JobTitle, DepartmentID, Salary 
		FROM Employees
		WHERE IsActiv = 0
	END

--INSERT EmployeeId, FirstName, LastName, MiddleName, JobTitle, DepartmentID, Salary
--INTO Deleted_Employees
--FROM Employees
--where IsActiv = 0



----------------------------------------------------------------

	DELETE FROM  Employees
	WHERE EmployeeID IN (12)

	SELECT * FROM Employees
	select * from Deleted_Employees



