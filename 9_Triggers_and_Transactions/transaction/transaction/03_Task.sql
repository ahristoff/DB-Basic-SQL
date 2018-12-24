USE Bank

GO

CREATE PROC usp_DepositMoney (@AccountId INT, @MoneyAmount DECIMAL(18, 4))
AS
BEGIN

	BEGIN TRAN
	IF(@MoneyAmount<=0)
		BEGIN
			--RAISERROR('Negativ Amount', 16, 1)
			ROLLBACK
			RETURN
		END
	
	UPDATE Accounts
	SET Balance = @MoneyAmount + Balance
	WHERE Id = @AccountId

	IF(@@ROWCOUNT<>1)
		BEGIN
			--RAISERROR('Invalid Account', 16, 1)
			ROLLBACK
			RETURN
		END

  COMMIT

	--DECLARE @Balance DECIMAL(18, 4) 
	--SET @Balance = (SELECT Balance FROM Accounts WHERE Id = @AccountId)

	--SELECT @AccountId AS AccountId, 
	--ah.Id AS AccountHolderId,    
	--@Balance AS Balance 
	--FROM AccountHolders 
	--AS ah INNER JOIN Accounts AS ac ON ah.Id = ac.AccountHolderId 
	--WHERE ac.Id = @AccountId 
  
END

GO


EXEC usp_DepositMoney 1, 4

select * from Accounts


 
