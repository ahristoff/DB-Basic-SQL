USE SoftUni

GO

CREATE PROC usp_GetEmployeesFromTown(@TownName VARCHAR(50))
AS
SELECT e.FirstName, e.LastName FROM Addresses AS a
JOIN Towns AS t     ON t.TownID = a.TownID
JOIN Employees AS e ON a.AddressID = e.AddressID
WHERE t.Name = @TownName

GO

EXEC usp_GetEmployeesFromTown Sofia