USE SoftUni

GO

CREATE PROC usp_AssignProject(@emloyeeId INT, @projectID INT) 
AS
BEGIN
	DECLARE @EmployeeProjectCount INT = (SELECT COUNT(ProjectID)FROM EmployeesProjects AS ep 
	WHERE ep.EmployeeID = @emloyeeId)
	
	if(@EmployeeProjectCount >= 3)
		BEGIN
			RAISERROR('The employee has too many projects!', 16, 1)
			RETURN
		END

	INSERT INTO EmployeesProjects(EmployeeID, ProjectID)
	VALUES(@emloyeeId, @projectID)

END



EXEC usp_AssignProject 2, 1


SELECT * FROM EmployeesProjects

