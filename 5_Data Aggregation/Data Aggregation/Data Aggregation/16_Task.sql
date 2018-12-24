USE SoftUni
SELECT DepartmentID,Max(Salary)AS MaxSalary FROM Employees
GROUP BY DepartmentID
HAVING NOT Max(Salary) BETWEEN 30000 AND 70000