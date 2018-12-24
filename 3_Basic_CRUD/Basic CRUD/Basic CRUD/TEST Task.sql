USE SoftUni
SELECT FirstName,MiddleName,LastName,JobTitle,Salary,DepartmentID
INTO TestTable
FROM Employees




ALTER Table TestTable
ADD FullName VARCHAR(150)

UPDATE TestTable
SET FullName = FirstName+' '+ISNULL(MiddleName, '')+' '+LastName


UPDATE TestTable
   SET Salary=Salary*1.12,
		JobTitle = RIGHT(JobTitle, LEN(JobTitle) - 6)
 WHERE (DepartmentID = 1 OR DepartmentID=2 OR DepartmentID=4 OR DepartmentID=11)
SELECT Salary FROM TestTable


SELECT*FROM TestTable