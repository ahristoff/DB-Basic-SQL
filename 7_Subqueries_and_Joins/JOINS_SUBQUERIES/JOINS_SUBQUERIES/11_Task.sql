USE SoftUni

SELECT MIN(AverigeSalary) AS MinAverageSalary FROM 
(
SELECT AVG(Salary) AS AverigeSalary 
FROM Employees
GROUP BY DepartmentID
)
AS a