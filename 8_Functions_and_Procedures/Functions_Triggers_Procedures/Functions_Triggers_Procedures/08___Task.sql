USE SoftUni

GO

CREATE PROC usp_DeleteEmployeesFromDepartment (@departmentId INT)
AS
ALTER TABLE Departments
ALTER column ManagerId INT NULL -- da moje da bude null


DELETE FROM EmployeesProjects
WHERE EmployeeID  IN (
							SELECT e.EmployeeID FROM Employees AS e
							JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
							WHERE d.DepartmentID = @departmentId
					)

UPDATE Employees
SET ManagerID = Null
WHERE ManagerID IN  (
							SELECT e.EmployeeID FROM Employees AS e
							JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
							WHERE d.DepartmentID = @departmentId
					)

UPDATE Departments
SET ManagerID = Null
WHERE ManagerID IN  (
							SELECT e.EmployeeID FROM Employees AS e
							JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
							WHERE d.DepartmentID = @departmentId
					)

DELETE FROM Employees
WHERE EmployeeID  IN (
							SELECT e.EmployeeID FROM Employees AS e
							JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
							WHERE d.DepartmentID = @departmentId
					)


DELETE FROM Departments
WHERE DepartmentID = @departmentId

SELECT EmployeeID, DepartmentID FROM Employees WHERE DepartmentID = @departmentId

go

exec usp_DeleteEmployeesFromDepartment 7
