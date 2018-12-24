USE Bank

GO

CREATE PROC usp_GetHoldersWithBalanceHigherThan @value MONEY
AS

SELECT ah.FirstName, ah.LastName FROM AccountHolders AS ah
JOIN Accounts AS ac ON ac.AccountHolderId = ah.Id

Group by ah.FirstName, ah.LastName
HAVING SUM(ac.Balance) > @value

GO

EXEC usp_GetHoldersWithBalanceHigherThan 10000


