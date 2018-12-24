USE SoftUni

--SELECT e.FirstName, e.LastName, e.HireDate, d.Name AS DepartmentName FROM Employees AS e
--JOIN Departments AS d
--ON e.DepartmentID = d.DepartmentID
--AND e.HireDate > '1998' AND d.Name IN('Sales', 'Finance')
--ORDER BY e.HireDate


SELECT e.FirstName, e.LastName, e.HireDate, d.Name AS DepartmentName FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID

WHERE e.HireDate > '1-1-1999' AND d.Name IN('Sales', 'Finance')

ORDER BY e.HireDate