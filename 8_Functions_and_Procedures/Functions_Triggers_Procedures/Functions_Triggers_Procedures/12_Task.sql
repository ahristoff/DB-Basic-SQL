USE Bank

GO

CREATE PROC usp_CalculateFutureValueForAccount (@accontId INT, @interestRate FLOAT)
AS
BEGIN

DECLARE @currBalance DECIMAL(20,4)= (SELECT Balance FROM Accounts WHERE Id = @accontId)

SELECT ac.Id AS AccountId, ah.FirstName, ah.LastName, ac.Balance AS [Current Balance], 
dbo.ufn_CalculateFutureValue(@currBalance, @interestRate, 5) AS [Balance in 5 years] 
FROM AccountHolders AS ah
JOIN Accounts AS ac ON ah.Id = ac.AccountHolderId 

WHERE ac.Id = @accontId

END

GO

EXEC usp_CalculateFutureValueForAccount 1, 0.1