USE SoftUni

SELECT e.EmployeeID, e.FirstName,
CASE
	WHEN p.StartDate > '2005' THEN NULL
	ELSE p.Name 
END AS ProjectName
FROM Projects AS p
JOIN EmployeesProjects AS ep ON p.ProjectID = ep.ProjectID
JOIN Employees AS e ON e.EmployeeID = ep.EmployeeID

WHERE e.EmployeeID = 24



SELECT e.EmployeeID, e.FirstName,
CASE
	WHEN p.StartDate > '2005' THEN NULL
	ELSE p.Name 
END 
AS ProjectName
FROM Employees AS e
JOIN EmployeesProjects AS ep ON e.EmployeeID = ep.EmployeeID
JOIN  Projects AS p ON p.ProjectID = ep.ProjectID

WHERE e.EmployeeID = 24
