USE SoftUni

go

CREATE PROC usp_GetEmployeesSalaryAbove35000
AS
SELECT FirstName, LastName FROM Employees
WHERE Salary > 35000

go

EXEC usp_GetEmployeesSalaryAbove35000