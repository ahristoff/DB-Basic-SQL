USE SoftUni

GO

CREATE PROC usp_GetEmployeesSalaryAboveNumber(@SalarySize DECIMAL(18,4)) 

AS

SELECT FirstName, LastName FROM Employees 
WHERE Salary >= @SalarySize

GO

EXEC usp_GetEmployeesSalaryAboveNumber 48100