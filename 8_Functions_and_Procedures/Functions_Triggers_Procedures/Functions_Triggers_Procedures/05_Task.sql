USE SoftUni

GO

CREATE OR ALTER FUnction ufn_GetSalaryLevel(@salary DECIMAL(18,4)) 
RETURNS NVARCHAR(10)
AS
BEGIN
 DECLARE @salaryLevel VARCHAR(10)
IF (@salary < 30000)
begin
  SET @salaryLevel = 'Low'
end
 ELSE IF(@salary BETWEEN 30000 AND 50000)
begin
  SET @salaryLevel = 'Average'
end
 ELSE
begin
  SET @salaryLevel = 'High'
end
RETURN @salaryLevel
END

go

SELECT Salary,dbo.ufn_GetSalaryLevel(Salary) AS SalaryLevel FROM Employees



--SELECT dbo.ufn_GetSalaryLevel(Salary) AS SalaryLevel, COUNT(Salary)  AS SalaryLevel
--FROM Employees
--GROUP BY dbo.ufn_GetSalaryLevel (Salary)
