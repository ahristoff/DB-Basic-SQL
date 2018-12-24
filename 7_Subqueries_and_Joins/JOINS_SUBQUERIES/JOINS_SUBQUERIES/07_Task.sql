USE SoftUni

SELECT TOP(5) e.EmployeeID, e.FirstName, p.Name AS ProjectName FROM Projects AS p
JOIN EmployeesProjects AS ep ON ep.ProjectID = p.ProjectID
JOIN Employees AS e ON ep.EmployeeID = e.EmployeeID

WHERE p.StartDate >'2002-08-13' AND p.EndDate IS NULL

ORDER BY e.EmployeeID


--SELECT TOP(5) e.EmployeeID, e.FirstName, p.Name AS ProjectName FROM Projects AS p
--JOIN EmployeesProjects AS ep
--ON p.ProjectID = ep.ProjectID
--JOIN Employees AS e
--ON e.EmployeeID = ep.EmployeeID
--AND p.StartDate >'2002-08-13' AND p.EndDate IS NULL
--ORDER BY e.EmployeeID