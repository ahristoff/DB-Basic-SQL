USE SoftUni

SELECT  DepartmentID ,
AVG(CASE
WHEN DepartmentID=1 THEN Salary+5000
ELSE Salary 
END) AS AverageSalary 
FROM Employees
WHERE Salary>30000 AND (ManagerID !=42 OR ManagerID IS NULL)
GROUP BY DepartmentID





SELECT*
INTO New
FROM Employees
WHERE Salary>30000

DELETE FROM New
WHERE ManagerID=42

UPDATE New
SET Salary = Salary+5000
WHERE DepartmentID=1

SELECT DepartmentID, AVG(Salary) AS AverageSalary FROM New
GROUP BY DepartmentID








--SELECT*FROM Employees
