USE Bank

GO

CREATE PROC usp_WithdrawMoney (@AccountId INT, @MoneyAmount DECIMAL(18, 4))
AS
BEGIN

	BEGIN TRAN
	IF(@MoneyAmount<=0)
		BEGIN
			
			ROLLBACK
			RETURN
		END
	
	UPDATE Accounts
	SET Balance = Balance - @MoneyAmount
	WHERE Id = @AccountId

	IF(@@ROWCOUNT<>1)
		BEGIN
			
			ROLLBACK
			RETURN
		END

	DECLARE @Balance DECIMAL(18, 4)  
	SET @Balance= (SELECT Balance FROM Accounts WHERE Id = @AccountId)

	IF(@Balance<0)
		BEGIN 
			ROLLBACK
			RETURN 
		END 
		
	COMMIT 
		
 -- SELECT @AccountId AS AccountId, 
	--ah.Id AS AccountHolderId,    
	--@Balance   AS Balance 
	--FROM AccountHolders 
	--AS ah INNER JOIN Accounts AS ac ON ah.Id = ac.AccountHolderId 
	--WHERE ac.Id = @AccountId 

END

GO


EXEC usp_WithdrawMoney 1, 20

select * from Accounts


-------------------------------------------------------------------------------

CREATE OR ALTER PROCEDURE usp_WithdrawMoney(@AccountId INT, @moneyAmount MONEY) 
AS 
BEGIN 
	DECLARE @CurrentAccountBalance MONEY 
	BEGIN TRAN 
		UPDATE Accounts 
		SET Balance = Balance - @moneyAmount 
		WHERE Accounts.Id = @AccountId 
 
	SET @CurrentAccountBalance = (SELECT Balance FROM Accounts AS a WHERE a.Id = @AccountId) 
 
		IF (@CurrentAccountBalance < 0) 
		BEGIN 
			ROLLBACK 
		END 
		ELSE 
		BEGIN 
			COMMIT 
		END 
END 
