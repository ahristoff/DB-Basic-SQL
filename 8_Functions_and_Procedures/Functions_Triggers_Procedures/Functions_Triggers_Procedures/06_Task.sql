USE SoftUni

GO
 
CREATE PROC usp_EmployeesBySalaryLevel (@LevelOfSalary VARCHAR(10))
AS
SELECT FirstName, LastName FROM Employees
WHERE dbo.ufn_GetSalaryLevel(Salary) = @LevelOfSalary

GO
EXEC dbo.usp_EmployeesBySalaryLevel High

