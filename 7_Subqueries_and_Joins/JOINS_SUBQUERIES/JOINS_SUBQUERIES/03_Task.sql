USE SoftUni

SELECT e.EmployeeID, e.FirstName, e.LastName, d.Name 
FROM Employees AS e
JOIN  Departments AS d ON e.DepartmentID = d.DepartmentID
Where d.Name = 'Sales'
ORDER By e.EmployeeID



--SELECT e.EmployeeID, e.FirstName, e.LastName, d.Name FROM Employees AS e
--JOIN  Departments AS d
--ON e.DepartmentID = d.DepartmentID AND d.Name = 'Sales'
--ORDER By e.EmployeeID