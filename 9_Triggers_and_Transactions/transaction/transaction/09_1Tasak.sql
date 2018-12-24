USE SoftUni

GO

CREATE TABLE Deleted_Employees(
EmployeeId INT PRIMARY KEY IDENTITY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
MiddleName VARCHAR(50),
JobTitle VARCHAR(50),
DepartmentId INT,
Salary DECIMAL(15, 2)
)

GO

CREATE TRIGGER tr_DeleteEmployees1 ON Employees
FOR DELETE
AS
BEGIN

		INSERT INTO Deleted_Employees (FirstName, LastName, MiddleName, JobTitle,
		DepartmentId, Salary)
		SELECT deleted.FirstName, deleted.LastName, deleted.MiddleName,	deleted.JobTitle, deleted.DepartmentID, deleted.Salary FROM deleted 
		--WHERE Employees.IsActiv = 0

END

SELECT* FROM Deleted_Employees

DELETE FROM Employees
WHERE EmployeeID =10