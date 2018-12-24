USE Bank

GO

CREATE PROC usp_GetHoldersFullName 
AS
SELECT FullName = CONCAT(FirstName,' ', LastName) FROM AccountHolders

GO

EXEC usp_GetHoldersFullName