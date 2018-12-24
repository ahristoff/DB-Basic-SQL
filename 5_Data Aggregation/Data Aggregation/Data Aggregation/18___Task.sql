USE SoftUni

SELECT  DepartmentID, Salary FROM
(
SELECT 
DepartmentID, 
Max(Salary) AS Salary,
DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS Rank
FROM Employees
GROUP BY DepartmentID,Salary
) AS ThirdPart
WHERE Rank = 3


SELECT  DepartmentID, FFF FROM
(
SELECT 
DepartmentID, 
Salary AS FFF,
DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS Rank
FROM Employees
GROUP BY DepartmentID,Salary
) AS ThirdPart
WHERE Rank = 3

--SELECT DepartmentID, Salary From Employees
--group by DepartmentID,Salary
--order by DepartmentID, Salary Desc
--while(DepartmentID <= 15)
--begin
--OFFSET 2 ROWS
--FETCH NEXT 1 ROWS ONLY
--OFFSET 1000 ROWS
--DepartmentID = DepartmentID + 1
--end