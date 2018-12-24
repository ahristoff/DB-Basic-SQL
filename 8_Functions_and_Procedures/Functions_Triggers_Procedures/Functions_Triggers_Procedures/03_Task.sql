USE SoftUni

GO

CREATE PROC usp_GetTownsStartingWith (@Text VARCHAR(50))

AS

SELECT Name FROM Towns
WHERE LEFT(Name, LEN(@Text)) = @Text

GO

EXEC usp_GetTownsStartingWith ca