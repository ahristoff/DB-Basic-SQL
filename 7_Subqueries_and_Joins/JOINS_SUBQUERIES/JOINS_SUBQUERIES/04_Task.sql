USE SoftUni

SELECT top (5) e.EmployeeID, e.FirstName, e.Salary, d.Name 
FROM Employees AS e
JOIN  Departments AS d ON e.DepartmentID = d.DepartmentID AND e.Salary > 15000
ORDER By d.DepartmentID