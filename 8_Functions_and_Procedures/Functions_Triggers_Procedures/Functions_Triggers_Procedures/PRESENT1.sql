CREATE or alter PROCEDURE udp_AssignProject (@EmployeeID INT, @ProjectID INT)
AS
BEGIN

DECLARE @employeeProjectsCount INT
SET @employeeProjectsCount = 
(SELECT COUNT(*) FROM [dbo].[EmployeesProjects] AS ep
 WHERE ep.EmployeeId = @EmployeeID)
		IF(@employeeProjectsCount>=3)
			BEGIN
				RAISERROR('To Many Projects', 20, 1)			
			END
		ELSE
			BEGIN
				INSERT INTO EmployeesProjects (EmployeeID , ProjectID)
				VALUES(@EmployeeID , @ProjectID)
			END
END

DELETE FROM EmployeesProjects
WHERE EmployeeID =2

exec udp_AssignProject 2, 3

SELECT * FROM EmployeesProjects
ORDER BY EmployeeID
